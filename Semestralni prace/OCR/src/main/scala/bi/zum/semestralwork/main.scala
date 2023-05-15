import java.awt.image.BufferedImage
import java.io.File
import java.nio.file.{Files, Path, Paths}
import javax.imageio.ImageIO
import scala.collection.immutable.Set
import scala.io.Source
import scala.jdk.CollectionConverters.*
import scala.collection.mutable


case class Point(x: Int, y: Int)

type Candidate = Set[Point]

enum Color:
  case White, Black


val images: Vector[BufferedImage] = loadImages()


@main
def main(): Unit = {
  val maxIter = 10_000
  val maxReset = 10
  val rand = new scala.util.Random

  var bestCandidate: Set[Point] = null
  var bestCandidateCollisions: Int = 26

  var reset = 0
  while (reset != maxReset) {
    var initState: Set[Point] = Set()
    while (initState.size != 5)
      initState = initState + Point(rand.nextInt(16), rand.nextInt(16))

    var currentCandidate = initState
    var currentCandidateCollisions = calculateCollisions((initState))

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


def calculateCollisions(c: Candidate): Int = {
  var collisions = 0
  var values: Set[mutable.ArrayBuffer[Color]] = Set()

  for (image <- images) {
    val value: mutable.ArrayBuffer[Color] = mutable.ArrayBuffer()

    for (point <- c) {
      val color = image.getRGB(point.x, point.y) match {
        case -1 => Color.White
        case -16777216 => Color.Black
      }
      value += color
    }

    if (values.contains(value))
      collisions += 1
    else
      values = values + value
  }

  collisions
}


def candidateNeighbors(candidate: Candidate): Set[Candidate] = {
  var neighbors: Set[Candidate] = Set()

  val cv = candidate.toVector

  neighbors += Set(Point(cv(0).x + 1 min 15, cv(0).y), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(0).x - 1 max 0, cv(0).y), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(0).x, cv(0).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(0).x, cv(0).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(0).x + 1 min 15, cv(0).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(0).x + 1 min 15, cv(0).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(0).x - 1 max 0, cv(0).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(0).x - 1 max 0, cv(0).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))


  neighbors += Set(Point(cv(1).x + 1 min 15, cv(1).y), cv(0), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(1).x - 1 max 0, cv(1).y), cv(0), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(1).x, cv(1).y + 1 min 15), cv(0), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(1).x, cv(1).y - 1 max 0), cv(0), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(1).x + 1 min 15, cv(1).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(1).x + 1 min 15, cv(1).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(1).x - 1 max 0, cv(1).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(1).x - 1 max 0, cv(1).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))

  neighbors += Set(Point(cv(2).x + 1 min 15, cv(2).y), cv(1), cv(0), cv(3), cv(4))
  neighbors += Set(Point(cv(2).x - 1 max 0, cv(2).y), cv(1), cv(0), cv(3), cv(4))
  neighbors += Set(Point(cv(2).x, cv(2).y + 1 min 15), cv(1), cv(0), cv(3), cv(4))
  neighbors += Set(Point(cv(2).x, cv(2).y - 1 max 0), cv(1), cv(0), cv(3), cv(4))
  neighbors += Set(Point(cv(2).x + 1 min 15, cv(2).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(2).x + 1 min 15, cv(2).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(2).x - 1 max 0, cv(2).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(2).x - 1 max 0, cv(2).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))

  neighbors += Set(Point(cv(3).x + 1 min 15, cv(3).y), cv(1), cv(2), cv(0), cv(4))
  neighbors += Set(Point(cv(3).x - 1 max 0, cv(3).y), cv(1), cv(2), cv(0), cv(4))
  neighbors += Set(Point(cv(3).x, cv(3).y + 1 min 15), cv(1), cv(2), cv(0), cv(4))
  neighbors += Set(Point(cv(3).x, cv(3).y - 1 max 0), cv(1), cv(2), cv(0), cv(4))
  neighbors += Set(Point(cv(3).x + 1 min 15, cv(3).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(3).x + 1 min 15, cv(3).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(3).x - 1 max 0, cv(3).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(3).x - 1 max 0, cv(3).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))

  neighbors += Set(Point(cv(4).x + 1 min 15, cv(4).y), cv(1), cv(2), cv(3), cv(0))
  neighbors += Set(Point(cv(4).x - 1 max 0, cv(4).y), cv(1), cv(2), cv(3), cv(0))
  neighbors += Set(Point(cv(4).x, cv(4).y + 1 min 15), cv(1), cv(2), cv(3), cv(0))
  neighbors += Set(Point(cv(4).x, cv(4).y - 1 max 0), cv(1), cv(2), cv(3), cv(0))
  neighbors += Set(Point(cv(4).x + 1 min 15, cv(4).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(4).x + 1 min 15, cv(4).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(4).x - 1 max 0, cv(4).y + 1 min 15), cv(1), cv(2), cv(3), cv(4))
  neighbors += Set(Point(cv(4).x - 1 max 0, cv(4).y - 1 max 0), cv(1), cv(2), cv(3), cv(4))

  neighbors
}


private def loadImages(): Vector[BufferedImage] = {
  val imagesTMP = mutable.ArrayBuffer.empty[BufferedImage]
  for (path <- Files.list(Paths.get("src/main/resources/latin_script")).iterator().asScala) {
    imagesTMP += ImageIO.read(path.toFile)
  }
  imagesTMP.toVector
}
