#ifndef DB_FILLER
#define DB_FILLER

#include <SQLiteCpp/SQLiteCpp.h>
#include "rsyn/model/timing/types.h"
#include "rsyn/src/rsyn/io/parser/parser_helper.h"
#include <Rsyn/Session>
#include <string>
#include <vector>
#include <Rsyn/PhysicalDesign>
#include <map>
#include "SqlTable.h"

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
    void fillArcs();
    void fillLUT();
    void fillNetRelations();
    void fillLutValues(ISPD13::LibParserLUT& lut, int, SqlTable&);
    void printLut(ISPD13::LibParserLUT&);

    void execStatement(std::string);
    void execInsert(SqlTable &);
    void setForeignKeySupport(bool);
    std::string insertStatement(std::string, std::vector<std::string>, std::vector<std::string>);
    std::string insertStatement(std::string, std::map<std::string, std::string>);
    std::string sqlMultiValue(std::vector<std::string>);
    std::string sqlStr(std::string);
    std::string timingSense2Str(const Rsyn::TimingSense&);
};

#endif
