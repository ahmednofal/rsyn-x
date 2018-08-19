#ifndef NETLIST_READER_H
#define NETLIST_READER_H

#include <Rsyn/Session>
#include <Rsyn/PhysicalDesign>
#include <string>
#include "rsyn/io/parser/lef_def/LEFControlParser.h"


namespace Rsyn {

class NetlistReader : public Reader {
public:
    NetlistReader() = default;
    virtual ~NetlistReader() = default;
    virtual bool load(const Rsyn::Json &params) override;

    void setNetlistPath(std::string);
    void setLefPath(std::string);
    void loadAll();

private:
    std::string mNetlistPath;
    std::string mLefPath;
    Rsyn::Session mSession;
    Rsyn::Design mDesign;
	LefDscp lefDscp;
    
    void loadDesign();
    void loadLib();
    void loadDefaults();
};

}

#endif
