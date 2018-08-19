#ifndef DEFAULT_DEF_H
#define DEFUALT_DEF_H

#include "rsyn/phy/util/DefDescriptors.h"
#include <Rsyn/PhysicalDesign>
#include <Rsyn/Session>

class DefaultDef {

public:
    DefaultDef();
    DefDscp getDscp();

private:
    DefDscp mDefDscp;
    Rsyn::Session mSession;
	Rsyn::Module mModule;
    void addComps();
    void addNets();
    void addPorts();
    void addDbu();

};

#endif
