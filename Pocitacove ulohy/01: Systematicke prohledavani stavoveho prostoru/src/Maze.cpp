#include <iostream>
#include <string>
#include <string.h>
#include <fstream>
#include <utility>
#include <vector>
#include <sstream>
#include <queue>
#include <stack>

#include "Maze.hpp"

using namespace std;


Maze::Maze(ifstream &infile) {
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


void Maze::printPath() {
    cout << "----------------------\nPATH:" << endl;
    cout << Tile(opened, endX, endY);

    Tile *pred = layout[endY][endX].predecessor;
    while (pred) {
        cout << " <- " << *pred;
        pred = pred->predecessor;
    }
    cout << endl;
}


void Maze::randomSearch() {

}


void Maze::DFS() {
    stack<Tile*> s;
    s.push(&layout[startY][startX]);

    layout[startY][startX].startDistance = 0;

    while (!s.empty()) {
        Tile *t = s.top();
        s.pop();
        cout << "Entering " << *t;

        if (t->x == endX && t->y == endY) {
            cout << " <--- SOLUTION FOUND!" << endl;
            printPath();
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

                cout << "\t " << *tNext << " opened" << endl;
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
        Tile *t = q.front();
        q.pop();
        cout << "Entering " << *t;

        if (t->x == endX && t->y == endY) {
            cout << " <--- SOLUTION FOUND!" << endl;
            printPath();
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

                string steps = ( q.size() == 1 ? ("the next step") : (to_string(q.size()) + " steps") ); 
                cout << "\t " << *tNext << " opened to be entered in " << steps << endl;
            }
        }

        t->state = closed;
    }
}


void Maze::greedySearch() {

}


void Maze::AStar() {

}
