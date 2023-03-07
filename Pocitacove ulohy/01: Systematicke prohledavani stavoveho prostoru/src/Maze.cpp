#include <cstdlib>
#include <iostream>
#include <string>
#include <string.h>
#include <fstream>
#include <utility>
#include <vector>
#include <sstream>
#include <queue>
#include <stack>
#include<unistd.h> 

#include "Maze.hpp"

using namespace std;


Maze::Maze(ifstream &infile, bool dynamic) {
    this->dynamic = dynamic;

    string line;
    int row = 0;

    while (getline(infile, line)) {
        layout.push_back({});

        istringstream iss(line);
        int col = 0;

        char c;
        iss.get(c);
        while (!iss.eof()) {
            if (c == 'X') {
                layout[row].push_back(Tile(wall, col, row));
            } else if (c == ' ') {
                layout[row].push_back(Tile(undiscovered, col, row));
            } else if (c == 's') {
                string rest;
                iss >> rest // tart
                    >> startX
                    >> rest // ,
                    >> startY;
            } else { // c == 'e'
                string rest;
                iss >> rest // nd
                    >> endX
                    >> rest // ,
                    >> endY;
            }

            iss.get(c);
            col++;
        }

        row++;
    }
}


// -----------------------------------------------------------------------
void Maze::randomSearch() {
    vector<Tile*> v;
    v.push_back(&layout[startY][startX]);

    layout[startY][startX].startDistance = 0;

	srand((unsigned) time(NULL));

    while (!v.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        int random = rand() % v.size();
        Tile *t = v[random];
        v.erase(next(v.begin(), random));
        if (!dynamic) cout << "Entering " << *t;

        if (t->x == endX && t->y == endY) {
            if (!dynamic)cout << " <--- SOLUTION FOUND!" << endl;
            printResults();
            return;
        }
        cout << endl;

        for (pair<int, int> p : {make_pair(t->x-1, t->y), make_pair(t->x+1, t->y), make_pair(t->x, t->y-1), make_pair(t->x, t->y+1)}) {
            Tile *tNext = &layout[p.second][p.first];
            if (tNext->state == undiscovered) {
                tNext->predecessor = t;
                tNext->startDistance = t->startDistance + 1;
                tNext->state = opened;
                v.push_back(tNext);

                if (!dynamic) cout << "\t " << *tNext << " opened" << endl;
            }
        }

        t->state = closed;
    }
}


void Maze::DFS() {
    stack<Tile*> s;
    s.push(&layout[startY][startX]);

    layout[startY][startX].startDistance = 0;

    while (!s.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        Tile *t = s.top();
        s.pop();
        if (!dynamic) cout << "Entering " << *t;

        if (t->x == endX && t->y == endY) {
            if (!dynamic)cout << " <--- SOLUTION FOUND!" << endl;
            printResults();
            return;
        }
        cout << endl;

        for (pair<int, int> p : {make_pair(t->x-1, t->y), make_pair(t->x+1, t->y), make_pair(t->x, t->y-1), make_pair(t->x, t->y+1)}) {
            Tile *tNext = &layout[p.second][p.first];
            if (tNext->state == undiscovered) {
                tNext->predecessor = t;
                tNext->startDistance = t->startDistance + 1;
                tNext->state = opened;
                s.push(tNext);

                if (!dynamic) cout << "\t " << *tNext << " opened" << endl;
            }
        }

        t->state = closed;
    }
}


void Maze::BFS() {
    queue<Tile*> q;
    q.push(&layout[startY][startX]);

    layout[startY][startX].startDistance = 0;

    while (!q.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        Tile *t = q.front();
        q.pop();
        if (!dynamic) cout << "Entering " << *t;

        if (t->x == endX && t->y == endY) {
            if (!dynamic) cout << " <--- SOLUTION FOUND!" << endl;
            printResults();
            return;
        }
        cout << endl;

        for (pair<int, int> p : {make_pair(t->x-1, t->y), make_pair(t->x+1, t->y), make_pair(t->x, t->y-1), make_pair(t->x, t->y+1)}) {
            Tile *tNext = &layout[p.second][p.first];
            if (tNext->state == undiscovered) {
                tNext->predecessor = t;
                tNext->startDistance = t->startDistance + 1;
                tNext->state = opened;
                q.push(tNext);

                if (!dynamic) {
                    string steps = ( q.size() == 1 ? ("the next step") : (to_string(q.size()) + " steps") ); 
                    cout << "\t " << *tNext << " opened to be entered in " << steps << endl;
                }
            }
        }

        t->state = closed;
    }
}


void Maze::greedySearch() {

}


void Maze::AStar() {

}


// -----------------------------------------------------------------------
void Maze::printResults() {
    cout << "----------------------\nPATH:" << endl;
    cout << Tile(opened, endX, endY);

    layout[startY][startX].state = path;
    layout[endY][endX].state = path;
    int len = 0;

    Tile *pred = layout[endY][endX].predecessor;
    while (pred) {
        cout << " <- " << *pred;
        len++;
        pred->state = path;
        pred = pred->predecessor;
    }
    cout << "\nLength: " << len << endl;
    
    cout << "----------------------\nMAZE:" << endl;
    printMaze();
}


void Maze::printMaze() {
    for ( const auto & row: layout ) {
        for (const auto & tile : row) {
            switch (tile.state) {
                case wall:
                    cout << "\033[1;32mX\033[0m";
                    break;
                case closed:
                    cout << "\033[0;37m#\033[0m";
                    break;
                case opened:
                    cout << "\033[0;37m@\033[0m";
                    break;
                case undiscovered:
                    cout << " ";
                    break;
                case path:
                    cout << "\033[1;31m.\033[0m";
                    break;
            }
        }
        cout << endl;
    }
}
