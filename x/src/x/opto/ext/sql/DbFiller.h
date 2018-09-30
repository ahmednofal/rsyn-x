#ifndef DB_FILLER
#define DB_FILLER

#include <SQLiteCpp/SQLiteCpp.h>
#include <Rsyn/Session>
#include <string>
#include <vector>
#include <Rsyn/PhysicalDesign>
#include <map>

class DbFiller {
public:
    DbFiller(std::string);
    void fill();
private:
    SQLite::Database mDb;
    Rsyn::Session mSession;
    Rsyn::Design mDesign;
    Rsyn::Library  mLibrary;
    Rsyn::Module mModule;
    Rsyn::PhysicalDesign mPhyDesign;
    std::vector<void (DbFiller::*)()> fillers;
    void fillBlock();
    void fillBPin();
    void fillCell();
    void fillInst();
    void fillCPin();
    void fillMtoM();
    void fillNet();
    void fillNetRelations();

    void execStatement(std::string);
    void setForeignKeySupport(bool);
    std::string insertStatement(std::string, std::vector<std::string>, std::vector<std::string>);
    std::string insertStatement(std::string, std::map<std::string, std::string>);
    std::string sqlMultiValue(std::vector<std::string>);
    std::string sqlStr(std::string);
};

#endif
