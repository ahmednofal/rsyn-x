#include "SqlRow.h"

SqlRow::SqlRow(int size) :
    mValues(size)
{
}

void SqlRow::insertValue(SqlValue value)
{
    int idx = value.getColKey();
    mValues[idx] = value;
};

std::string SqlRow::getStr()
{
    std::string s;
    s += "(";
    for (int i = 0; i < mValues.size() - 1; ++i) {
        s += "\'"
            + mValues[i].getValue()
            + "\'"
            + ", ";
    }
    s += "\'"
        + mValues[mValues.size() - 1].getValue()
        + "\'"
        + ")";
    return s;
}
