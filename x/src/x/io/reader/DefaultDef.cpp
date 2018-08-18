#include "x/io/reader/DefaultDef.h"

DefaultDef::DefaultDef()
{
    mModule = mSession.getTopModule();
    addDbu();
    addComps();
    addNets();
    addPorts();
}


DefDscp DefaultDef::getDscp()
{
    return mDefDscp;
}


void DefaultDef::addDbu()
{
    mDefDscp.clsDatabaseUnits = 1;
}


void DefaultDef::addComps()
{
    for (Rsyn::Instance instance : mModule.allInstances()) {
        if (instance.getType() == Rsyn::CELL) {
            Rsyn::Cell cell = instance.asCell();
            DefComponentDscp defComp;
            defComp.clsName = cell.getName();
            defComp.clsMacroName = cell.getLibraryCellName();

            mDefDscp.clsComps.push_back(defComp);
        }
    }
}


void DefaultDef::addPorts()
{
    for (Rsyn::Port port : mModule.allPorts(Rsyn::IN)) {
        DefPortDscp defPort;
        defPort.clsName = port.getName();
        defPort.clsNetName = port.getName();
        defPort.clsDirection = "INPUT";
        defPort.clsLocationType = "UNPLACED";
        defPort.clsLayerName = "metal1";

        mDefDscp.clsPorts.push_back(defPort);
    }

    for (Rsyn::Port port : mModule.allPorts(Rsyn::OUT)) {
        DefPortDscp defPort;
        defPort.clsName = port.getName();
        defPort.clsNetName = port.getName();
        defPort.clsDirection = "OUTPUT";
        defPort.clsLocationType = "UNPLACED";
        defPort.clsLayerName = "metal1";

        mDefDscp.clsPorts.push_back(defPort);
    }
}


void DefaultDef::addNets()
{
    for (Rsyn::Net net : mModule.allNets()) {
        DefNetDscp defNet;
        defNet.clsName = net.getName();

        for (Rsyn::Pin pin : net.allPins()) {
            if (pin.isPort()) {
                DefNetConnection netConnection;
                netConnection.clsComponentName = "PIN";
                netConnection.clsPinName = pin.getInstanceName();

                defNet.clsConnections.push_back(netConnection);
            } else {
                DefNetConnection netConnection;
                netConnection.clsComponentName = pin.getInstanceName();
                netConnection.clsPinName = pin.getName();

                defNet.clsConnections.push_back(netConnection);
            }
        }
    }
}
