#ifndef NETLIST_READER_H
#define NETLIST_READER_H

#include <Rsyn/Session>
#include <Rsyn/PhysicalDesign>
#include <string>


namespace Rsyn {

class NetlistReader : public Reader {
public:
    NetlistReader(); 
    virtual ~NetlistReader() = default;
    virtual bool load(const Rsyn::Json &params) override;

    void setNetlistPath(std::string);
    void setLefPath(std::string);
    void build();

private:
    std::string mNetlistPath;
    std::string mLefPath;
    Rsyn::Session mSession;
    Rsyn::Design mDesign;
    
    void buildDesign();
    void buildLibrary();
};

}

#endif
