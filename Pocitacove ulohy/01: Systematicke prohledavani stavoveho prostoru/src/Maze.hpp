#include <fstream>
#include <vector>


class Maze {
public:
  Maze(std::ifstream &infile);

  void printPath();

  void randomSearch();
  void DFS();
  void BFS();
  void greedySearch();
  void AStar();

private:
  enum State { wall, closed, opened, undiscovered };

  struct Tile {
    Tile(State state, int x, int y, int startDistance = INT32_MAX, Tile *predecessor = nullptr)
        : state(state), x(x), y(y), startDistance(startDistance), predecessor(predecessor) {}

    State state;
    int x, y, startDistance;
    Tile *predecessor;

    friend std::ostream& operator<<(std::ostream& os, const Tile& t) {
        os << "(" << t.x << "," << t.y << ")";
        return os;
    }
  };

  std::vector<std::vector<Tile>> layout;
  int startX, startY, endX, endY;
};
