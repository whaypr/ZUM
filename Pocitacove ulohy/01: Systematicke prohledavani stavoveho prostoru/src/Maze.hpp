#include <fstream>
#include <vector>


class Maze {
public:
  Maze(std::ifstream &infile, bool interactive);

  void randomSearch();
  void DFS();
  void BFS();
  void greedySearch();
  void AStar();

private:
  enum State { wall, closed, opened, undiscovered, path };
  struct Tile {
    Tile(State state, int x, int y, int startDistance = INT32_MAX, double endDistanceHeuristic = INT32_MAX, Tile *predecessor = nullptr)
        : state(state), x(x), y(y), startDistance(startDistance), endDistanceHeuristic(endDistanceHeuristic), predecessor(predecessor) {}

    State state;
    int x, y, startDistance;
    double endDistanceHeuristic;
    Tile *predecessor;

    friend std::ostream& operator<<(std::ostream& os, const Tile& t) {
        os << "(" << t.x << "," << t.y << ")";
        return os;
    }
  };

  std::vector<std::vector<Tile>> layout;
  int startX, startY, endX, endY;

  bool dynamic;
  int dynamicRefreshTime = 60000;
  void printResults();
  void printMaze();
};
