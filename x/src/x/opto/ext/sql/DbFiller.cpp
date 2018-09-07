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
    mDb(dbFilePath),
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
    fillers.push_back(&DbFiller::fillNetRelations);
}


void DbFiller::execStatement(std::string statement)
{
    try {
        SQLite::Transaction transaction(mDb);
        std::cout << "STATEMENT: " << statement << std::endl;
        int status = mDb.exec(statement); // should do sth with status
        transaction.commit();
    }
    catch (std::exception& e) {
        std::cout << "exception: " << e.what() << std::endl;
    }
}


void DbFiller::fillInst()
{
    for (Rsyn::Instance instance : mModule.allInstances()) {
        if (instance.getType() == Rsyn::CELL) {
            Rsyn::Cell cell = instance.asCell();
            std::string cellName = cell.getName();
            Rsyn::LibraryCell libCell = cell.getLibraryCell();
            std::string libCellName = libCell.getName();
            std::string statement = std::string("INSERT INTO Inst")
                + std::string("(NAME, Cell_Name) ")
                + std::string("VALUES(")
                + sqlStr(cellName) + ", "
                + sqlStr(libCellName)
                + std::string(");");
            execStatement(statement);
        }
    }
}


void DbFiller::fillCell()
{
    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        Rsyn::PhysicalLibraryCell phyLibCell = mPhyDesign.getPhysicalLibraryCell(libCell);
        std::string name = libCell.getName();
        int width = phyLibCell.getWidth();
        int height = phyLibCell.getHeight();
        std::string statement = std::string("INSERT INTO Cell")
            + std::string("(NAME, height, width) ")
            + std::string("VALUES(")
            + sqlStr(name) + ", "
            + std::to_string(height) + ", "
            + std::to_string(width)
            + std::string(");");
        execStatement(statement);
    }
}


void DbFiller::fillBPin()
{
    std::string blockName = mDesign.getName();
    for (Rsyn::Port port : mModule.allPorts()) {
        std::string name = port.getName();
        std::string dir = directionToStr(port.getDirection());
        std::string statement = std::string("INSERT INTO BPin ")
            + std::string("(NAME, dir, Block_Name) ")
            + std::string("VALUES(")
            + sqlStr(name)+ ", "
            + sqlStr(dir) + ", "
            + sqlStr(blockName)
            + std::string(");");
        execStatement(statement);
    }
}


void DbFiller::fill()
{
    // I hate that so far the order of calls matters
    // due to foreign keys.
    // Note that I could however omit not null and
    // update them later but the caller still
    // needs to be aware of their absence.
    for (int i = 0; i < fillers.size(); i++) {
        (this->*fillers[i])();
    }
}


// notes:
// check all
void DbFiller::fillNetRelations()
{
    for (Rsyn::Net net : mModule.allNets()) {
        std::string netName = net.getName();
        for (Rsyn::Pin pin : net.allPins()) {
            std::string statement = "BOGUS";
            if (pin.isPort()) {
                std::string portName = pin.getInstanceName();
                statement = std::string("INSERT INTO Net_BPin ")
                    + std::string("VALUES(")
                    + sqlStr(netName) + ", "
                    + sqlStr(portName)
                    + std::string(");");
            } else {
                std::string pinName = pin.getName();
                std::string pinCellName = pin.getLibraryCell().getName();
                std::string instName = pin.getInstanceName(); // check this ones
                statement = std::string("INSERT INTO Net_CPin_Inst ")
                    + std::string("VALUES(")
                    + sqlStr(netName) + ", "
                    + sqlStr(pinName) + ", "
                    + sqlStr(pinCellName) + ", "
                    + sqlStr(instName)
                    + std::string(");");
            }
            execStatement(statement);
        }
    }
}


void DbFiller::fillCPin()
{
    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        std::string cellName = libCell.getName();
        for (Rsyn::LibraryPin pin : libCell.allLibraryPins()) {
                std::string pinName = pin.getName();
                std::string dir = pin.getDirectionName();
                std::string statement = std::string("INSERT INTO CPin")
                    + std::string("(NAME, dir, Cell_Name) ")
                    + std::string("VALUES(")
                    + sqlStr(pinName) + ", "
                    + sqlStr(dir) + ", "
                    + sqlStr(cellName)
                    + std::string(");");
                execStatement(statement);
        }
    }
}


void DbFiller::fillBlock()
{
    std::string name = mDesign.getName();
    std::string statement = std::string("INSERT INTO Block VALUES(")
        + sqlStr(name)
        + std::string(");");
    execStatement(statement);
}
