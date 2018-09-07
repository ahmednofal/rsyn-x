#include "DbFiller.h"


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
    fillers.push_back(&DbFiller::fillBlock);
    fillers.push_back(&DbFiller::fillBPin);
    fillers.push_back(&DbFiller::fillCell);
    fillers.push_back(&DbFiller::fillCPin);
    fillers.push_back(&DbFiller::fillInst);
    fillers.push_back(&DbFiller::fillNet);
    fillers.push_back(&DbFiller::fillNetRelations);
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
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME",
        "Cell_Name"
    };

    SQLite::Transaction transaction(mDb);

    for (Rsyn::Instance instance : mModule.allInstances()) {
        if (instance.getType() == Rsyn::CELL) {
            Rsyn::Cell cell = instance.asCell();
            std::string cellName = cell.getName();
            Rsyn::LibraryCell libCell = cell.getLibraryCell();
            std::string libCellName = libCell.getName();

            values.push_back(cellName);
            values.push_back(libCellName);
            std::string statement = insertStatement(tableName, headers, values);
            execStatement(statement);
            values.clear();
        }
    }

    transaction.commit();
}


void DbFiller::fillCell()
{
    std::string tableName = "Cell";
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME",
        "height",
        "width"
    };

    SQLite::Transaction transaction(mDb);

    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        Rsyn::PhysicalLibraryCell phyLibCell = mPhyDesign.getPhysicalLibraryCell(libCell);
        std::string name = libCell.getName();
        int width = phyLibCell.getWidth();
        int height = phyLibCell.getHeight();

        values.push_back(name);
        values.push_back(std::to_string(height));
        values.push_back(std::to_string(width));
        std::string statement = insertStatement(tableName, headers, values);
        execStatement(statement);
        values.clear();
    }

    transaction.commit();
}


void DbFiller::fillBPin()
{
    std::string tableName = "BPin";
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME",
        "dir",
        "Block_Name"
    };

    SQLite::Transaction transaction(mDb);

    std::string blockName = mDesign.getName();
    for (Rsyn::Port port : mModule.allPorts()) {
        std::string name = port.getName();
        std::string dir = directionToStr(port.getDirection());

        values.push_back(name);
        values.push_back(dir);
        values.push_back(blockName);
        std::string statement = insertStatement(tableName, headers, values);
        execStatement(statement);
        values.clear();
    }

    transaction.commit();
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
    std::string tableName;
    std::vector<std::string> headers;
    std::vector<std::string> values;

    SQLite::Transaction transaction(mDb);

    for (Rsyn::Net net : mModule.allNets()) {
        std::string netName = net.getName();
        for (Rsyn::Pin pin : net.allPins()) {
            std::string statement = "BOGUS";
            if (pin.isPort()) {
                std::string portName = pin.getInstanceName();

                values.push_back(netName);
                values.push_back(portName);
                tableName = "Net_BPin";
            } else {
                std::string pinName = pin.getName();
                std::string pinCellName = pin.getLibraryCell().getName();
                std::string instName = pin.getInstanceName(); // check this ones

                values.push_back(netName);
                values.push_back(pinName);
                values.push_back(pinCellName);
                values.push_back(instName);
                tableName = "Net_CPin_Inst";
            }
            statement = insertStatement(tableName, headers, values);
            execStatement(statement);
            values.clear();
        }
    }

    transaction.commit();
}


void DbFiller::fillNet()
{
    std::string tableName = "Net";
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME",
    };

    SQLite::Transaction transaction(mDb);

    for (Rsyn::Net net : mModule.allNets()) {
        std::string netName = net.getName();

        values.push_back(netName);
        std::string statement = insertStatement(tableName, headers, values);
        execStatement(statement);
        values.clear();
    }

    transaction.commit();
}


void DbFiller::fillCPin()
{
    std::string tableName = "CPin";
    std::vector<std::string> values;
    std::vector<std::string> headers {
        "NAME",
        "dir",
        "Cell_Name"
    };

    SQLite::Transaction transaction(mDb);

    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        std::string cellName = libCell.getName();
        for (Rsyn::LibraryPin pin : libCell.allLibraryPins()) {
                std::string pinName = pin.getName();
                std::string dir = pin.getDirectionName();

                values.push_back(pinName);
                values.push_back(dir);
                values.push_back(cellName);
                std::string statement = insertStatement(tableName, headers, values);
                execStatement(statement);
                values.clear();
        }
    }

    transaction.commit();
}


void DbFiller::fillBlock()
{
    std::string tableName = "Block";
    std::vector<std::string> values;
    std::vector<std::string> headers;

    SQLite::Transaction transaction(mDb);

    std::string name = mDesign.getName();

    values.push_back(name);
    std::string statement = insertStatement(tableName, headers, values);
    execStatement(statement);

    transaction.commit();
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
