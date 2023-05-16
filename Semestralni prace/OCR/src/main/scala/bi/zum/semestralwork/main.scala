package bi.zum.semestralwork

import java.awt.image.BufferedImage
import java.io.File
import java.nio.file.{Files, Path, Paths}
import javax.imageio.ImageIO
import scala.collection.immutable.Set
import scala.collection.mutable
import scala.io.Source
import scala.jdk.CollectionConverters.*


type Candidate = Set[Int]

enum Color:
  case White, Black


val width = 16
val height = 16
val maxIter = 150
val maxReset = 150
val minBits = 6
val imagesDirPathName = "src/main/resources/hiragana"

val imageVectors: Vector[Vector[Color]] = loadImageVectors(imagesDirPathName)
val mask: Vector[Boolean] = findMask()


@main
def main(): Unit = {
  val rand = new scala.util.Random

  var bestCandidate: Set[Int] = null
  var bestCandidateCollisions: Int = 26

  var reset = 0
  while (bestCandidateCollisions != 0 && reset != maxReset) {
    var initState: Set[Int] = Set()
    while (initState.size != minBits) {
      val next = rand.nextInt(width * height)
      if (mask(next))
        initState = initState + next
    }

    var currentCandidate = initState
    var currentCandidateCollisions = calculateCollisions(initState)

    var bestNeighbor = currentCandidate
    var bestNeighborCollisions = currentCandidateCollisions

    var iter = 0
    while (currentCandidateCollisions != 0 && iter != maxIter) {

      for (neighbor <- candidateNeighbors(currentCandidate)) {
        if (calculateCollisions(neighbor) <= bestNeighborCollisions) {
          bestNeighbor = neighbor
          bestNeighborCollisions = calculateCollisions(neighbor)
        }
      }

      currentCandidate = bestNeighbor
      currentCandidateCollisions = calculateCollisions(bestNeighbor)

      print("\u001b[2J")
      println(s"Iterations: ${iter}/${maxIter}")
      println(s"Resets: ${reset}/${maxReset}")
      println(s"Best solution so far with ${bestCandidateCollisions} collisions: ${bestCandidate}")
      iter += 1
    }

    if (currentCandidateCollisions < bestCandidateCollisions) {
      bestCandidate = currentCandidate
      bestCandidateCollisions = currentCandidateCollisions
    }
    reset += 1
  }

  println("Best result:")
  println(s"${bestCandidate}")
  println(s"${bestCandidateCollisions}")
}


def calculateCollisions(candidate: Candidate): Int = {
  var collisions = 0
  var values: Set[mutable.ArrayBuffer[Color]] = Set()

  for (imageVector <- imageVectors) {
    val value: mutable.ArrayBuffer[Color] = mutable.ArrayBuffer()
    for (index <- candidate)
      value += imageVector(index)

    if (values.contains(value))
      collisions += 1
    else
      values = values + value
  }

  collisions
}


def candidateNeighbors(candidate: Candidate): Set[Candidate] = {
  var neighbors: Set[Candidate] = Set()

  for (index <- candidate) {
    val rest = candidate.filter(_ != index)
    val shift = (0 until width * height).toSet.filter(x => !rest.contains(x) && mask(x))
    shift.foreach(neighbors += rest union Set(_))
  }

  neighbors
}


// INIT //

def loadImageVectors(pathname: String): Vector[Vector[Color]] = {
  var res: Vector[Vector[Color]] = Vector()

  for (path <- Files.list(Paths.get(pathname)).iterator().asScala) {
    val image = ImageIO.read(path.toFile)

    var imageArray: Array[Color] = Array()
    for (y <- 0 until image.getHeight(); x <- 0 until image.getWidth()) {
      val color = image.getRGB(x, y) match
        case -1 => Color.White
        case -16777216 => Color.Black
      imageArray = imageArray :+ color
    }

    res = res appended imageArray.toVector
  }

  res
}


def findMask(): Vector[Boolean] = {
  var res: Vector[Boolean] = Vector()

  for (i <- 0 until width * height) {
    if ( imageVectors.forall(_(i) == imageVectors.head(i)) )
      res = res appended false
    else
      res = res appended true
  }

  res
}
