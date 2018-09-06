#include "DbFiller.h"


DbFiller::DbFiller(std::string dbFilePath)
{
    mDb = SQLite::Database(dbFilePath);
    fillers = {
        fillBlock(),
        fillBPin(),
        fillCell(),
        fillCPin(),
        fillInst(),
        fillNetRelations()
    }
}


void DbFiller::execStatement(std::string statement)
{
    SQLite::Transaction transaction(mDb);
    int status = db.execute(statment); // should do sth with status
    transaction.commit();
}


void DbFiller::fillInst()
{
    for (Rsyn::Instance instance : mModule.allInstances()) {
        if (instance.getType() == Rsyn::CELL) {
            Rsyn::Cell cell = instane.asCell();
            std::string cellName = cell.getName();
            Rsyn::LibraryCell libCell = cell.getLibraryCell();
            std::string libCellName = libCell.getName();
            std::string statement = "INSERT INTO Inst"
                + "(NAME, Cell_Name) "
                + "VALUES("
                + cellName + ", "
                + libCellName
                + ");";
            execStatement(statement);
        }
    }
}


void DbFiller::fillCell()
{
    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        Rsyn::PhysicalLibraryCell phyLibCell = mPhyDesign.getPhysicalLibraryCell(libCell);
        std::string name = libCell.getName();
        int width = phyLibCell.getWith();
        int height = phyLibCell.getHeight();
        std::string statement = "INSERT INTO Cell"
            + "(NAME, height, width) "
            + "VALUES("
            + name + ", "
            + std::string(height) + ", "
            + std::string(width)
            + ");";
        execStatement(statment);
    }
}


void DbFiller::fillBPin()
{
    std::string blockName = mDesign.getName();
    for (Rsyn::Port port : mModule.allPorts()) {
        std::string name = port.getName();
        std::string dir = directionToStr(port.getDirection);
        std::string statement = "INSERT INTO BPin "
            + "(NAME, dir, Block_Name) "
            + "VALUES("
            + name + ", "
            + dir + ", "
            + blockName + ");";
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
        fillers[i]();
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
                statement = "INSERT INTO Net_BPin "
                    + "VALUES("
                    + netName + ", "
                    + portName + ", "
                    + ");";
            } else {
                std::string pinName = pin.getName();
                std::string pinCellName = pin.getLibraryCell().getName();
                std::string instName = pin.getInstanceName(); // check this ones
                statement = "INSERT INOT Net_CPin_Inst "
                    + "VALUES("
                    + netName + ", "
                    + pinName + ", "
                    + pinCellName + ", "
                    + instName
                    + ");";
            }
        }
        execStatement(statement);
    }
}


void DbFiller::fillCPin()
{
    for (Rsyn::LibraryCell libCell : mLibrary.allLibraryCells()) {
        std::string cellName = libCell.getName();
        for (Rsyn::LibraryPin pin : libCell.allLibraryPins()) {
                std::string pinName = pin.getName();
                std::string dir = pin.getDirectionName();
                std::string statement = "INSERT INTO CPin"
                    + "(NAME, dir, Cell_Name) "
                    + "VALUES("
                    + pinName + ", "
                    + dir + ", "
                    + cellName
                    + ");";
                execStatement(statement);
        }
    }
}


void DbFiller::fillBlock()
{
    std::string name = mDesign.getName();
    std::string statement = "INSERT INTO Block VALUES("
            + name
            + ");";
    execStatement(statement);
}
