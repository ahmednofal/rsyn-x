#include "SqlHeader.h"
#include <iostream>

SqlHeader::SqlHeader()
{
}

SqlHeader::SqlHeader(std::vector<std::string> header)
{
    setCols(header);
}

void SqlHeader::insertCol(std::string colName)
{
    mColsNames.push_back(colName);
}

void SqlHeader::setCols(std::vector<std::string> colsNames)
{
    mColsNames = colsNames;
}

int SqlHeader::getSize()
{
    return mColsNames.size();
}

int SqlHeader::getColKey(std::string colName)
{
    for (int i = 0; i < mColsNames.size(); ++i) {
        if (mColsNames[i] == colName)
            return i;
    }
    return -1;
}

std::string SqlHeader::getStr()
{
    std::string s;
    s += "(";
    for (int i = 0; i < mColsNames.size() - 1; ++i) {
        s += "\'"
            + mColsNames[i]
            + "\'"
            + ", ";
    }
    s +=  "\'"
        + mColsNames[mColsNames.size() - 1]
        + "\'"
        + ")";
    return s;
}
