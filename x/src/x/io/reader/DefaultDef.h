#ifndef DEFAULT_DEF_H
#define DEFUALT_DEF_H

#include "rsyn/phy/util/DefDescriptors.h"
#include <Rsyn/PhysicalDesign>
#include <Rsyn/Session>


//! Creates A Minimal Def Dscp
/*!
 * Creates A Def Dscp out of
 * the current design built in rsyn.
 *
 * It fills components, Ports, Nets and
 * Database units
 */

class DefaultDef {

public:
    //! Default constructor
    DefaultDef();
    //! Returns the created def dscp
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
