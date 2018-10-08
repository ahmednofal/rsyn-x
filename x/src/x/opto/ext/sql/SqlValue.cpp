#include "SqlValue.h"

SqlValue::SqlValue()
{
}

SqlValue::SqlValue(int key, std::string value) :
    mKey(key),
    mValue(value)
{
}

void SqlValue::setValue(std::string value)
{
    mValue = value;
}

void SqlValue::setColKey(int key)
{
    mKey = key;
}

int SqlValue::getColKey()
{
    return mKey;
}

std::string SqlValue::getValue()
{
    return mValue;
}