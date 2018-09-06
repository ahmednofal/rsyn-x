#ifndef DB_FILLER
#define DB_FILLER

#include <SQLiteCpp/SQLiteCpp.h>
#include <Rsyn/Session>
#include <string>
#include <vector>
#include <Rsyn/PhysicalDesign>

class DbFiller {
public:
    typedef void (DbFiller::*methodPointer)();
    DbFiller(std::string);
    void fill();
private:
    SQLite::Database mDb;
    Rsyn::Session mSession;
    Rsyn::Design mDesign;
    Rsyn::Library mLibrary;
    Rsyn::Module mModule;
    Rsyn::PhysicalDesign mPhyDesign;
    std::vector<void (DbFiller::*)()> fillers;
    void fillBlock();
    void fillBPin();
    void fillCell();
    void fillInst();
    void fillCPin();
    void fillMtoM();
    void fillNetRelations();

    void execStatement(std::string);
};

#endif
