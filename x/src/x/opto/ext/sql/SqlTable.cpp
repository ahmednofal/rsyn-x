#include "SqlTable.h"
#include <iostream>

SqlTable::SqlTable(std::string name, SqlHeader header) :
    mTableName(name),
    mHeader(header)
{
}

int SqlTable::getWidth()
{
    return mHeader.getSize();
}

void SqlTable::insertRow(SqlRow row)
{
    mRows.push_back(row);
}

void SqlTable::setHeader(SqlHeader header)
{
    mHeader = header;
}

SqlTable::SqlTable(std::string name) :
    mTableName(name)
{
}

std::vector<std::string> SqlTable::insertAll()
{
    std::vector<std::string> statements;

    std::string statement1 =
        "INSERT INTO "
        + mTableName 
        + mHeader.getStr() + " "
        + "VALUES";
    for (int i = 0; i < (int) mRows.size(); ++i) {
        std::string statementFull = statement1 + mRows[i].getStr() + ";";
        statements.push_back(statementFull);
    }

    return statements;
}
