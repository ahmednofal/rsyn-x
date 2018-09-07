#include "DbProcess.h"
#include "DbFiller.h"


bool DbProcess::run(const Rsyn::Json & params)
{
    DbFiller filler("eda.db");
    filler.fill();
    return true;
}
