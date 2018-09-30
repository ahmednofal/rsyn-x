#ifndef SQL_VALUE_H
#define SQL_VALUE_H

#include <string>

class SqlValue {
private:
    std::string mValue;
    int mKey;
public:
    SqlValue();
    SqlValue(int, std::string);
    void setValue(std::string);
    void setColKey(int);
    int getColKey();
    std::string getValue();
};

#endif
