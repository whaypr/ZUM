#include <iostream>
#include <string>
#include <sstream>
#include <vector>
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
    vector<Tile*> open;
    open.push_back(&layout[startY][startX]);

	srand((unsigned) time(NULL));

    while (!open.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        int random = rand() % open.size();
        Tile *t = open[random];
        open.erase(next(open.begin(), random));
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
                tNext->state = opened;
                open.push_back(tNext);

                if (!dynamic) cout << "\t " << *tNext << " opened" << endl;
            }
        }

        t->state = closed;
    }
}


void Maze::DFS() {
    stack<Tile*> open;
    open.push(&layout[startY][startX]);

    while (!open.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        Tile *t = open.top();
        open.pop();
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
                tNext->state = opened;
                open.push(tNext);

                if (!dynamic) cout << "\t " << *tNext << " opened" << endl;
            }
        }

        t->state = closed;
    }
}


void Maze::BFS() {
    queue<Tile*> open;
    open.push(&layout[startY][startX]);

    while (!open.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        Tile *t = open.front();
        open.pop();
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
                tNext->state = opened;
                open.push(tNext);

                if (!dynamic) {
                    string steps = ( open.size() == 1 ? ("the next step") : (to_string(open.size()) + " steps") ); 
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

    vector<Tile*> open;
    open.push_back(&layout[startY][startX]);

    layout[startY][startX].endDistanceHeuristic = 0;

    while (!open.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        size_t argmin;
        double distShortest = INT32_MAX;
        for (size_t i = 0; i < open.size(); ++i) {
            Tile *tTmp = open[i];
            if (tTmp->endDistanceHeuristic < distShortest) {
                argmin = i;
                distShortest = tTmp->endDistanceHeuristic;
            }
        }

        Tile *t = open[argmin];
        open.erase(next(begin(open), argmin));
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
                open.push_back(tNext);

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

    vector<Tile*> open;
    open.push_back(&layout[startY][startX]);

    layout[startY][startX].startDistance = 0;
    layout[startY][startX].endDistanceHeuristic = metric(startX, startY, endX, endY);

    while (!open.empty()) {
        if (dynamic) {
            printMaze();
            usleep(dynamicRefreshTime);
            system("clear");
        }

        size_t argmin;
        double distShortest = INT32_MAX;
        for (size_t i = 0; i < open.size(); ++i) {
            double distTMP = open[i]->startDistance + open[i]->endDistanceHeuristic;
            if (distTMP < distShortest) {
                argmin = i;
                distShortest = distTMP;
            }
        }

        Tile *t = open[argmin];
        open.erase(next(begin(open), argmin));
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
                    open.push_back(tNext);
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
        for (const auto & t : row) {
            if ( (t.x == startX && t.y == startY) || (t.x == endX && t.y == endY) ) {
                cout << "\033[1;31m.\033[0m";
                continue;
            }

            switch (t.state) {
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
