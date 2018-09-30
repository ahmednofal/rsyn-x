#ifndef SQL_HEADER_H
#define SQL_HEADER_H

#include <string>
#include <vector>

class SqlHeader {
private:
    std::vector<std::string> mColsNames;
public:
    SqlHeader();
    ~SqlHeader() = default;
    SqlHeader(std::vector<std::string>);
    void insertCol(std::string);
    void setCols(std::vector<std::string>);
    int getColKey(std::string);
    int getSize();
    std::string getStr();
};

#endif
