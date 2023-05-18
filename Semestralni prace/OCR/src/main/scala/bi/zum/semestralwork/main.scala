package bi.zum.semestralwork

@main
def main(): Unit = {
  val solver = new Solver(7, "src/main/resources/hiragana")

  //solver.steepestAscentHillClimbingWithResets(150, 10_000)
  //solver.simulatedAnnealing(2)
  solver.tabuSearch(150, 5_000)
}
