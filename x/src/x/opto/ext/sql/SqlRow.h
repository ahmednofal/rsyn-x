#ifndef SQL_ROW_H
#define SQL_ROW_H

#include "SqlValue.h"
#include <string>
#include <vector>

class SqlRow {
private:
    std::vector<SqlValue> mValues;
public:
    SqlRow(int);
    ~SqlRow() = default;
    void insertValue(SqlValue);
    std::string getStr();
};

#endif
