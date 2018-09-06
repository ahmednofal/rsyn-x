#include "DbFiller.h"


std::string directionToStr(Rsyn::Direction direction)
{
    std::string directionStr;
    return directionStr;
}


DbFiller::DbFiller(std::string dbFilePath) :
    mDb(dbFilePath)
{
    // mDb = SQLite::Database(dbFilePath);
    fillers.push_back(&DbFiller::fillBlock);
    fillers.push_back(&DbFiller::fillBPin);
    fillers.push_back(&DbFiller::fillCell);
    fillers.push_back(&DbFiller::fillCPin);
    fillers.push_back(&DbFiller::fillInst);
    fillers.push_back(&DbFiller::fillNetRelations);
//    fillers = {
//        fillBlock,
//        fillBPin,
//        fillCell,
//        fillCPin,
//        fillInst,
//        fillNetRelations
//    }
}


void DbFiller::execStatement(std::string statement)
{
    SQLite::Transaction transaction(mDb);
    int status = mDb.exec(statement); // should do sth with status
    transaction.commit();
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
                + cellName + ", "
                + libCellName
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
            + name + ", "
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
            + name + ", "
            + dir + ", "
            + blockName
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
                    + netName + ", "
                    + portName + ", "
                    + std::string(");");
            } else {
                std::string pinName = pin.getName();
                std::string pinCellName = pin.getLibraryCell().getName();
                std::string instName = pin.getInstanceName(); // check this ones
                statement = std::string("INSERT INOT Net_CPin_Inst ")
                    + std::string("VALUES(")
                    + netName + ", "
                    + pinName + ", "
                    + pinCellName + ", "
                    + instName
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
                    + pinName + ", "
                    + dir + ", "
                    + cellName
                    + std::string(");");
                execStatement(statement);
        }
    }
}


void DbFiller::fillBlock()
{
    std::string name = mDesign.getName();
    std::string statement = std::string("INSERT INTO Block VALUES(")
        + name
        + std::string(");");
    execStatement(statement);
}
