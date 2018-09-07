#ifndef DB_PROCESS_H
#define DB_PROCESS_H

#include <Rsyn/Session>
#include "DbFiller.h"
#include <string>


class DbProcess : public Rsyn::Process {
public:
    virtual bool run(const Rsyn::Json & params);
};

#endif
