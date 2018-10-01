#ifndef SQL_TABLE_H
#define SQL_TABLE_H

#include <string>
#include <map>
#include <vector>
#include "SqlRow.h"
#include "SqlHeader.h"

class SqlTable {
protected:
    std::string mTableName;
    std::vector<SqlRow> mRows;
    SqlHeader mHeader;

public:
    int getWidth();
    void insertRow(SqlRow);
    void setHeader(SqlHeader);
    std::vector<std::string> insertAll();

    SqlTable(std::string);
    SqlTable(std::string, SqlHeader);
    SqlTable() = default;
    ~SqlTable() = default;
};

#endif
