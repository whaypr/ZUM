#include <cstddef>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <math.h>
#include <string>
#include <string.h>
#include <fstream>
#include <utility>
#include <vector>
#include <sstream>
#include <queue>
#include <stack>
#include <unistd.h>
#include <cmath>

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
    auto metric = [](int ax, int ay, int bx, int by){
        return sqrt( pow(ax - bx, 2) + pow(ay - by, 2) );
    };

    vector<Tile*> v;
    v.push_back(&layout[startY][startX]);

    layout[startY][startX].endDistanceHeuristic = 0;

    while (!v.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        size_t argmin;
        double distShortest = INT32_MAX;
        for (size_t i = 0; i < v.size(); ++i) {
            Tile *tTmp = v[i];
            if (tTmp->endDistanceHeuristic < distShortest) {
                argmin = i;
                distShortest = tTmp->endDistanceHeuristic;
            }
        }

        Tile *t = v[argmin];
        v.erase(next(begin(v), argmin));
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
                tNext->endDistanceHeuristic = metric(tNext->x, tNext->y, endX, endY);
                tNext->state = opened;
                v.push_back(tNext);

                if (!dynamic) cout << "\t " << *tNext << " opened" << endl;
            }
        }

        t->state = closed;
    }
}


void Maze::AStar() {
    auto metric = [](int ax, int ay, int bx, int by){
        //return sqrt( pow(ax - bx, 2) + pow(ay - by, 2) );
        return abs(ax - bx) + abs(ay - by);
    };

    vector<Tile*> v;
    v.push_back(&layout[startY][startX]);

    layout[startY][startX].startDistance = 0;
    layout[startY][startX].endDistanceHeuristic = metric(startX, startY, endX, endY);

    while (!v.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        size_t argmin;
        double distShortest = INT32_MAX;
        for (size_t i = 0; i < v.size(); ++i) {
            double distTMP = v[i]->startDistance + v[i]->endDistanceHeuristic;
            if (distTMP < distShortest) {
                argmin = i;
                distShortest = distTMP;
            }
        }

        Tile *t = v[argmin];
        v.erase(next(begin(v), argmin));
        if (!dynamic) cout << "Entering " << *t;

        if (t->x == endX && t->y == endY) {
            if (!dynamic)cout << " <--- SOLUTION FOUND!" << endl;
            printResults();
            return;
        }
        cout << endl;

        for (pair<int, int> p : {make_pair(t->x-1, t->y), make_pair(t->x+1, t->y), make_pair(t->x, t->y-1), make_pair(t->x, t->y+1)}) {
            Tile *tNext = &layout[p.second][p.first];

            if (tNext->state == closed || tNext->state == wall)
                continue;

            int startDistNext = t->startDistance + 1;
            if (tNext->state == undiscovered || tNext->startDistance > startDistNext) {
                tNext->predecessor = t;
                tNext->endDistanceHeuristic = metric(tNext->x, tNext->y, endX, endY);
                tNext->startDistance = startDistNext;
                if (tNext->state == undiscovered)
                    v.push_back(tNext);
                tNext->state = opened;

                if (!dynamic) cout << "\t " << *tNext << " opened" << endl;
            }
        }

        t->state = closed;
    }
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
