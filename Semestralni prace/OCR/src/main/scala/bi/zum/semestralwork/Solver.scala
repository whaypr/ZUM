package bi.zum.semestralwork

import java.awt.image.BufferedImage
import java.io.File
import java.nio.file.{Files, Path, Paths}
import javax.imageio.ImageIO
import scala.collection.immutable.Set
import scala.collection.mutable
import scala.io.Source
import scala.jdk.CollectionConverters.*
import scala.util.control.Breaks.{break, breakable}


class Solver(bits: Int, imagesDirPathName: String) {

  def steepestAscentHillClimbingWithResets(maxIterations: Int, maxResets: Int): Unit = {
    var bestCandidate: Set[Int] = null
    var bestCandidateCollisions: Int = 26

    var reset = 0
    while (bestCandidateCollisions != 0 && reset != maxResets) {
      var initState: Set[Int] = Set()
      while (initState.size != bits) {
        val next = rand.nextInt(width * height)
        if (mask(next))
          initState = initState + next
      }

      var currentCandidate = initState
      var currentCandidateCollisions = calculateCollisions(initState)

      var bestNeighbor = currentCandidate
      var bestNeighborCollisions = currentCandidateCollisions

      var usedCandidatesOnTheSameLevel: Array[Candidate] = Array()

      var iter = 0
      breakable {
        while (currentCandidateCollisions != 0 && iter != maxIterations) {

          var candidateChanged = false
          for (neighbor <- candidateNeighbors(currentCandidate)) {
            if (!usedCandidatesOnTheSameLevel.contains(neighbor)) {
              val neighborCollisions = calculateCollisions(neighbor)

              if (neighborCollisions <= bestNeighborCollisions) {
                if (neighborCollisions == bestNeighborCollisions)
                  usedCandidatesOnTheSameLevel = usedCandidatesOnTheSameLevel :+ neighbor
                else
                  usedCandidatesOnTheSameLevel = Array()

                bestNeighbor = neighbor
                bestNeighborCollisions = neighborCollisions
                candidateChanged = true
              }
            }
          }

          if (!candidateChanged) break()

          currentCandidate = bestNeighbor
          currentCandidateCollisions = bestNeighborCollisions

          iter += 1

          print("\u001b[2J")
          println(s"Iterations: ${iter}/${maxIterations}")
          println(s"Resets: ${reset}/${maxResets}")
          println(s"Best solution so far with ${bestCandidateCollisions} collisions: ${bestCandidate}")
        }
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


  def simulatedAnnealing(
      maxTemperature: Double,
      decrease: Double => Double = (x: Double) => x - 0.00001,
      probability: (Int, Int, Double) => Double = (curr: Int, next: Int, t: Double) => Math.pow(Math.E, -(next - curr) / t)
  ): Unit = {
    var temperature = maxTemperature

    var currentCandidate: Set[Int] = Set()
    while (currentCandidate.size != bits) {
      val next = rand.nextInt(width * height)
      if (mask(next))
        currentCandidate = currentCandidate + next
    }
    var currentCandidateCollisions = calculateCollisions(currentCandidate)

    while (currentCandidateCollisions != 0 && temperature > 0) {
      val neighborCandidates = candidateNeighbors(currentCandidate).toVector
      val bestNeighbor = neighborCandidates( rand.nextInt(neighborCandidates.size) )
      val bestNeighborCollisions = calculateCollisions(bestNeighbor)

      if (
        bestNeighborCollisions < currentCandidateCollisions
        || probability(currentCandidateCollisions, bestNeighborCollisions, temperature) >= rand.nextDouble()
      ) {
        currentCandidate = bestNeighbor
        currentCandidateCollisions = bestNeighborCollisions
      }

      temperature = decrease(temperature)

      print("\u001b[2J")
      println(s"Temperature: ${temperature}/${maxTemperature}")
      println(s"Current candidate with ${currentCandidateCollisions} collisions: ${currentCandidate}")
    }

    println("Best candidate:")
    println(s"${currentCandidate}")
    println(s"${currentCandidateCollisions}")
  }


  //---------------//
  //    PRIVATE    //
  //---------------//

  private val rand = new scala.util.Random

  private val (width, height): (Int, Int) = getDimensions(imagesDirPathName)
  private val imageVectors: Vector[Vector[Color]] = loadImageVectors(imagesDirPathName)
  private val mask: Vector[Boolean] = findMask()


  // HELPERS //

  private def calculateCollisions(candidate: Candidate): Int = {
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


  private def candidateNeighbors(candidate: Candidate): Set[Candidate] = {
    var neighbors: Set[Candidate] = Set()

    for (index <- candidate) {
      val rest = candidate.filter(_ != index)
      val shift = (0 until width * height).toSet.filter(x => !rest.contains(x) && mask(x))
      shift.foreach(neighbors += rest union Set(_))
    }

    neighbors
  }


  // TYPES //

  private type Candidate = Set[Int]

  private enum Color:
    case White, Black


  // FOR INIT //

  private def loadImageVectors(pathname: String): Vector[Vector[Color]] = {
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


  private def getDimensions(pathname: String): (Int, Int) = {
    val file = Files.list(Paths.get(pathname)).iterator().asScala.next().toFile
    val image = ImageIO.read(file)
    (image.getWidth(), image.getHeight)
  }


  private def findMask(): Vector[Boolean] = {
    var res: Vector[Boolean] = Vector()

    for (i <- 0 until width * height) {
      if (imageVectors.forall(_(i) == imageVectors.head(i)))
        res = res appended false
      else
        res = res appended true
    }

    res
  }
}
