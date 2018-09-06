#ifndef DB_FILLER
#define DB_FILLER

#include <SQLiteCpp/SQLiteCpp.h>
#include <string>
#include <vector>
#include <functional>

class DbFiller {
public:
    DbFiller(std::string);
    fill();
private:
    SQLite::Database mDb;
    std::vector<std::function<void()>> fillers;
    void fillBlock();
    void fillBPin();
    void fillCell();
    void fillInst();
    void fillMtoM();

    void execStatement(std::string);
};

#endif
