#include "DbFiller.h"
#include "SqlTable.h"
#include "rsyn/model/timing/DefaultTimingModel.h"
#include "rsyn/model/scenario/Scenario.h"


std::string directionToStr(Rsyn::Direction direction)
{
    return Rsyn::Global::getDirectionName(direction);
}


std::string DbFiller::sqlStr(std::string s)
{
    return "\'" + s + "\'";
}


DbFiller::DbFiller(std::string dbFilePath) :
    mDb(dbFilePath, SQLite::OPEN_READWRITE),
    mDesign(mSession.getDesign()),
    mLibrary(mSession.getLibrary()),
    mModule(mSession.getTopModule()),
    mPhyDesign(mSession.getPhysicalDesign())
{
//    fillers.push_back(&DbFiller::fillBlock);
//    fillers.push_back(&DbFiller::fillBPin);
//    fillers.push_back(&DbFiller::fillCell);
//    fillers.push_back(&DbFiller::fillCPin);
//    fillers.push_back(&DbFiller::fillInst);
//    fillers.push_back(&DbFiller::fillNet);
//    fillers.push_back(&DbFiller::fillNetRelations);
    fillers.push_back(&DbFiller::fillArcs);
    fillers.push_back(&DbFiller::fillLUT);
}


void DbFiller::execStatement(std::string statement)
{
    try {
        std::cout << "STATEMENT: " << statement << std::endl;
        int status = mDb.exec(statement); // should do sth with status
    }
    catch (std::exception& e) {
        std::cout << "exception: " << e.what() << std::endl;
    }
}


void DbFiller::fillInst()
{
    std::string tableName = "Inst";
    std::vector<std::string> headers {
        "NAME",
        "Cell_Name"
    };
    SqlTable table(tableName, SqlHeader(headers));

    for (Rsyn::Instance instance : mModule.allInstances()) {
        if (instance.getType() == Rsyn::CELL) {
            Rsyn::Cell cell = instance.asCell();
            std::string cellName = cell.getName();
            Rsyn::LibraryCell libCell = cell.getLibraryCell();
            std::string libCellName = libCell.getName();

            SqlValue sqlCellName(0, cellName);
            SqlValue sqlLibCellName(1, libCellName);
            SqlRow row(table.getWidth());
            row.insertValue(sqlCellName);
            row.insertValue(sqlLibCellName);
            table.insertRow(row);
        }
    }
    execInsert(table);
}


void DbFiller::fillCell()
{
    std::string tableName = "Cell";
    std::vector<std::string> headers {
        "NAME",
        "height",
        "width"
    };
    SqlTable table(tableName, SqlHeader(headers));

    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        Rsyn::PhysicalLibraryCell phyLibCell = mPhyDesign.getPhysicalLibraryCell(libCell);
        std::string name = libCell.getName();
        int width = phyLibCell.getWidth();
        int height = phyLibCell.getHeight();

        SqlRow row(table.getWidth());
        row.insertValue(SqlValue(0, name));
        row.insertValue(SqlValue(1, std::to_string(height)));
        row.insertValue(SqlValue(2, std::to_string(width)));
        table.insertRow(row);
    }
    execInsert(table);
}


void DbFiller::fillBPin()
{
    std::string tableName = "BPin";

    std::map<std::string, std::string> entries;
    std::vector<std::string> headers {
        "NAME",
        "dir",
        "Block_Name"
    };
    SqlTable table(tableName, SqlHeader(headers));

    std::string blockName = mDesign.getName();
    for (Rsyn::Port port : mModule.allPorts()) {
        std::string name = port.getName();
        std::string dir = directionToStr(port.getDirection());

        SqlRow row(table.getWidth());
        row.insertValue(SqlValue(0, name));
        row.insertValue(SqlValue(1, dir));
        row.insertValue(SqlValue(2, blockName));
        table.insertRow(row);
    }
    execInsert(table);
}


void DbFiller::fill()
{
    // I hate that so far the order of calls matters
    // due to foreign keys.
    // Note that I could however omit not null and
    // update them later but the caller still
    // needs to be aware of their absence.
    setForeignKeySupport(true);
    for (int i = 0; i < fillers.size(); i++) {
        (this->*fillers[i])();
    }
}


// notes:
// check all
void DbFiller::fillNetRelations()
{
    std::string BPinTableName = "Net_BPin";
    std::string CPinTableName = "Net_CPin_Inst";
    std::vector<std::string> cHeaders {
        "Net_Name",
        "CPin_Name",
        "CPin_CName",
        "Inst_Name"
    };
    std::vector<std::string> bHeaders {
        "Net_Name",
        "BPin_Name"
    };
    SqlTable BPinTable(BPinTableName, SqlHeader(bHeaders));
    SqlTable CPinTable(CPinTableName, SqlHeader(cHeaders));

    for (Rsyn::Net net : mModule.allNets()) {
        std::string netName = net.getName();
        for (Rsyn::Pin pin : net.allPins()) {
            if (pin.isPort()) {
                std::string portName = pin.getInstanceName();

                SqlRow row(BPinTable.getWidth());
                row.insertValue(SqlValue(0, netName));
                row.insertValue(SqlValue(1, portName));
                BPinTable.insertRow(row);
            } else {
                std::string pinName = pin.getName();
                std::string pinCellName = pin.getLibraryCell().getName();
                std::string instName = pin.getInstanceName(); // check this ones

                SqlRow row(CPinTable.getWidth());
                row.insertValue(SqlValue(0, netName));
                row.insertValue(SqlValue(1, pinName));
                row.insertValue(SqlValue(2, pinCellName));
                row.insertValue(SqlValue(3, instName));
                CPinTable.insertRow(row);
            }
        }
    }
    execInsert(BPinTable);
    execInsert(CPinTable);
}


void DbFiller::fillNet()
{
    std::string tableName = "Net";
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME"
    };
    SqlTable table(tableName, SqlHeader(headers));

    for (Rsyn::Net net : mModule.allNets()) {
        std::string netName = net.getName();

        SqlRow row(table.getWidth());
        row.insertValue(SqlValue(0, netName));
        table.insertRow(row);
    }
    execInsert(table);
}

void DbFiller::printLut(ISPD13::LibParserLUT & lut)
{
    std::cout << "Load: ";
    std::vector<double> loadIdx = lut.loadIndices;
    std::vector<double> transIdx = lut.transitionIndices;
    auto values = lut.tableVals;
    int valuesRows = values.getNumRows();
    int valuesCols = values.getNumCols();

    for (int i = 0; i < loadIdx.size(); i++) {
        std::cout << loadIdx[i] << " ";
    }
    std::cout << std::endl << "Tans: ";
    for (int i = 0; i < transIdx.size(); i++) {
        std::cout << transIdx[i] << " ";
    }
    std::cout << std::endl
              << "Values\n";
    for (int i = 0; i < valuesRows; ++i) {

        for (int j = 0; j < valuesCols; j++) {
            std::cout << values(i, j) << " ";
        }
        std::cout << std::endl;
    }
}

void DbFiller::fillArcs()
{
    Rsyn::DefaultTimingModel * timingModel = mSession.getService("rsyn.defaultTimingModel");
    Rsyn::Scenario * scenario = mSession.getService("rsyn.scenario");
    std::string tableName = "Timing_Arcs";
    std::string lutTableName = "Timing_Arcs_LUT";
    std::vector<std::string> headers {
        "ID",
        "From_Pin_Name",
        "From_Pin_Cell_Name",
        "To_Pin_Name",
        "To_Pin_Cell_Name",
        "timing_sense"
    };
    SqlTable table(tableName, headers);

    int arcID = 0;
    for (auto libCell : mLibrary.allLibraryCells()) {
        std::string cellName = libCell.getName();
        for (auto libArc : libCell.allLibraryArcs()) {
            auto timingLibArc = scenario->getTimingLibraryArc(libArc);
            std::string timingSense = timingSense2Str(timingLibArc.getSense());
            std::string fromPin = libArc.getFromName();
            std::string toPin = libArc.getToName();
            SqlRow row(table.getWidth());
            row.insertValue(SqlValue(0, std::to_string(arcID)));
            row.insertValue(SqlValue(1, fromPin));
            row.insertValue(SqlValue(2, cellName));
            row.insertValue(SqlValue(3, toPin));
            row.insertValue(SqlValue(4, cellName));
            row.insertValue(SqlValue(5, timingSense));
            table.insertRow(row);

            auto delayLut = timingLibArc.getDelayLut(Rsyn::TimingMode::EARLY, Rsyn::RISE);
            auto slewLut = timingLibArc.getSlewLut(Rsyn::TimingMode::EARLY, Rsyn::RISE);
            arcID++;
        }
    }
    execInsert(table);
}

void DbFiller::fillLUT()
{
    Rsyn::DefaultTimingModel * timingModel = mSession.getService("rsyn.defaultTimingModel");
    Rsyn::Scenario * scenario = mSession.getService("rsyn.scenario");
    std::string lutTableName = "Timing_Arcs_LUT";
    std::string lutValuesName = "Timing_Arcs_LUT_Value";
    std::vector<std::string> lutValuesHeader {
        "LUT_ID",
        "Index_1",
        "Index_2",
        "value"
    };

    std::vector<std::string> lutHeaders {
        "ID",
        "Arc_ID",
        "Table_Type"
    };
    SqlTable lutTable(lutTableName, lutHeaders);
    SqlTable lutValuesTable(lutValuesName, lutValuesHeader);

    int arcID = 0;
    int lutID = 0;
    for (auto libCell : mLibrary.allLibraryCells()) {
        for (auto libArc : libCell.allLibraryArcs()) {
            auto timingLibArc = scenario->getTimingLibraryArc(libArc);

            auto cellRise= timingLibArc.getDelayLut(Rsyn::TimingMode::EARLY, Rsyn::RISE);
            auto cellFall = timingLibArc.getDelayLut(Rsyn::TimingMode::EARLY, Rsyn::FALL);
            auto riseTransition = timingLibArc.getSlewLut(Rsyn::TimingMode::EARLY, Rsyn::RISE);
            auto fallTransition = timingLibArc.getSlewLut(Rsyn::TimingMode::EARLY, Rsyn::FALL);

            SqlRow row0(lutTable.getWidth());
            row0.insertValue(SqlValue(0, std::to_string(lutID)));
            row0.insertValue(SqlValue(1, std::to_string(arcID)));
            row0.insertValue(SqlValue(2, "cell_fall"));
            fillLutValues(cellFall, lutID, lutValuesTable);
            lutID++;

            SqlRow row1(lutTable.getWidth());
            row1.insertValue(SqlValue(0, std::to_string(lutID)));
            row1.insertValue(SqlValue(1, std::to_string(arcID)));
            row1.insertValue(SqlValue(2, "cell_rise"));
            fillLutValues(cellRise, lutID, lutValuesTable);
            lutID++;

            SqlRow row2(lutTable.getWidth());
            row2.insertValue(SqlValue(0, std::to_string(lutID)));
            row2.insertValue(SqlValue(1, std::to_string(arcID)));
            row2.insertValue(SqlValue(2, "fall_transition"));
            fillLutValues(fallTransition, lutID, lutValuesTable);
            lutID++;

            SqlRow row3(lutTable.getWidth());
            row3.insertValue(SqlValue(0, std::to_string(lutID)));
            row3.insertValue(SqlValue(1, std::to_string(arcID)));
            row3.insertValue(SqlValue(2, "rise_transition"));
            fillLutValues(riseTransition, lutID, lutValuesTable);
            lutID++;

            arcID++;
            lutTable.insertRow(row0);
            lutTable.insertRow(row1);
            lutTable.insertRow(row2);
            lutTable.insertRow(row3);
        }
    }
    execInsert(lutTable);
    execInsert(lutValuesTable);
}


std::string DbFiller::timingSense2Str(const Rsyn::TimingSense& timingSense)
{
    std::string s;
    switch(timingSense) {
    case Rsyn::TimingSense::NEGATIVE_UNATE:
        s = "negative";
        break;

    case Rsyn::TimingSense::POSITIVE_UNATE:
        s = "positive";
        break;
    case Rsyn::TimingSense::NON_UNATE:
        s = "non";
        break;

    default:
        s = "invalid";
        break;
    }
    return s;
}


void DbFiller::fillLutValues(ISPD13::LibParserLUT& lut, int lutID, SqlTable & table)
{

    int width = table.getWidth();
    std::vector<double> loadIdx = lut.loadIndices;
    std::vector<double> transIdx = lut.transitionIndices;
    auto values = lut.tableVals;
    int valuesRows = values.getNumRows();
    int valuesCols = values.getNumCols();

    for (int i = 0; i < valuesRows; ++i) {
        for (int j = 0; j < valuesCols; j++) {
            SqlRow row(width);
            row.insertValue(SqlValue(0, std::to_string(lutID)));
            row.insertValue(SqlValue(1, std::to_string(transIdx[i])));
            row.insertValue(SqlValue(2, std::to_string(loadIdx[j])));
            row.insertValue(SqlValue(3, std::to_string(values(i, j))));
            table.insertRow(row);
        }
    }
}


void DbFiller::fillCPin()
{
    std::string tableName = "CPin";
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME",
        "dir",
        "Cell_Name",
        "cap"
    };
    SqlTable table(tableName, SqlHeader(headers));

    Rsyn::DefaultTimingModel* timingModel = mSession.getService("rsyn.defaultTimingModel");
    Rsyn::Scenario * scenario = mSession.getService("rsyn.scenario");

    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        std::string cellName = libCell.getName();
//        for (Rsyn::LibraryArc libArc : libCell.allLibraryArcs()) {
//            auto timingLibArc = scenario->getTimingLibraryArc(libArc);
//            ISPD13::LibParserLUT wv = scenario->getTimingLibraryArc(libArc).getDelayLut(Rsyn::TimingMode::LATE, Rsyn::RISE);
//            std::cout << wv << std::endl;
//            std::cout << libArc.getName();
//            auto lut = timingLibArc.getDelayLut(Rsyn::TimingMode::LATE, Rsyn::RISE);
//            for (auto index : lut.loadIndices) {
//                std::cout << index << "\t";
//            }
//            std::cout << std::endl;
//            for (auto index : lut.transitionIndices) {
//                std::cout << index << "\t";
//            }
//            std::cout << std::endl;
//        }
        for (Rsyn::LibraryPin pin : libCell.allLibraryPins()) {
                std::string pinName = pin.getName();
                std::string dir = pin.getDirectionName();
                float cap = timingModel->getLibraryPinInputCapacitance(pin);

                SqlRow row(table.getWidth());
                row.insertValue(SqlValue(0, pinName));
                row.insertValue(SqlValue(1, dir));
                row.insertValue(SqlValue(2, cellName));
                row.insertValue(SqlValue(3, std::to_string(cap)));
                table.insertRow(row);
                // ISPD13::LibParserLUT wv = (scenario->getTimingLibraryPin(pin).getSetupLut(Rsyn::RISE));
                // std::cout << wv << std::endl;
        }
    }
    execInsert(table);
}


void DbFiller::fillBlock()
{
    std::string tableName = "Block";
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME"
    };

    SqlTable table(tableName);
    table.setHeader(SqlHeader(headers));

    std::string name = mDesign.getName();

    SqlRow row(table.getWidth());
    row.insertValue(SqlValue(0, name));
    table.insertRow(row);
    execInsert(table);
}


void DbFiller::setForeignKeySupport(bool status)
{
    SQLite::Transaction transaction(mDb);

    std::string statement =
        "PRAGMA foreign_keys = ";
    if (status) {
        statement += "ON;";
    } else {
        statement += "OFF;";
    }

    execStatement(statement);

    transaction.commit();
}

std::string DbFiller::insertStatement(std::string tableName, std::vector<std::string> headers, std::vector<std::string> values)
{
    std::string headersStr = sqlMultiValue(headers);
    std::string valuesStr = sqlMultiValue(values);
    std::string statement = "INSERT INTO "
        + tableName
        + headersStr + " "
        + "VALUES"
        + valuesStr + ";";
    return statement;
}



std::string DbFiller::sqlMultiValue(std::vector<std::string> values)
{
    std::string valuesStr;

    if (!values.empty()) {
        valuesStr += "(";
        for (int i = 0; i < values.size() - 1; i++) {
            valuesStr += sqlStr(values[i]);
            valuesStr += ", ";
        }
        valuesStr += sqlStr(values[values.size() - 1]);
        valuesStr += ")";
    }

    return valuesStr;
}


std::string DbFiller::insertStatement(std::string tableName, std::map<std::string, std::string> entries)
{
    std::vector<std::string> headers;
    std::vector<std::string> values;

    for (auto entry : entries) {
        headers.push_back(entry.first);
        values.push_back(entry.second);
    }

    std::string headersStr = sqlMultiValue(headers);
    std::string valuesStr = sqlMultiValue(values);

    std::string statement = "INSERT INTO "
        + tableName
        + headersStr + " "
        + "VALUES"
        + valuesStr + ";";
    return statement;
}

void DbFiller::execInsert(SqlTable & table)
{
    SQLite::Transaction transaction(mDb);

    for (auto statement : table.insertAll()) {
        execStatement(statement);
    }

    transaction.commit();
}
