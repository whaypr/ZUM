#include <iostream>
#include <string>

#include "Maze.hpp"

using namespace std;


void crash(string msg, int status) {
    cout << msg << endl;
    exit(status);
}


int main(int argc, char *argv[]) {
    string help =
        "\nexec <input_path> <algorithm_number> <dynamic>\n\n"
        "algorithms:\n"
        "\t1: Random Search\n"
        "\t2: DFS\n"
        "\t3: BFS\n"
        "\t4: Greedy Search\n"
        "\t5: A*\n"
        "dynamic:\n"
        "\t0: Show only final result\n"
        "\t1: Show each step of pathfinding\n";

    if (argc != 4) crash(help, 1);

    ifstream infile(argv[1]);
    if (infile.fail()) {
        infile.close();
        crash("Maze failed to load", 2);
    }

    string dynamicStr = argv[3];
    bool dynamic;
    if (dynamicStr == "0")
        dynamic = false;
    else if (dynamicStr == "1")
        dynamic = true;
    else
        crash(help, 5);

    Maze *maze = nullptr;
    try {
        maze = new Maze(infile, dynamic);
    } catch (string e) {
        delete maze;
        crash("Error during maze creation: " + e, 3);
    }

    string algo = argv[2];
    if (algo == "1")
        maze->randomSearch();
    else if (algo == "2")
        maze->DFS();
    else if (algo == "3")
        maze->BFS();
    else if (algo == "4")
        maze->greedySearch();
    else if (algo == "5")
        maze->AStar();
    else
        crash(help, 4);

    delete maze;
    return 0;
}

