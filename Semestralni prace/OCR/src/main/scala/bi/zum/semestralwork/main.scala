package bi.zum.semestralwork

@main
def main(): Unit = {
  val solver = new Solver(150, 10_000, 6, "src/main/resources/hiragana")
  solver.steepestAscentHillClimbingWithResets()
}
