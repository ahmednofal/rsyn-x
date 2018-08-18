#include "NetlistReader.h"
#include "rsyn/util/Stepwatch.h"
#include "rsyn/io/parser/lef_def/LEFControlParser.h"
#include "rsyn/io/parser/verilog/SimplifiedVerilogReader.h"

namespace Rsyn {


DefDscp defaultDefDscp()
{
    DefDscp defDscp;
    defDscp.clsDatabaseUnits = 1;
    return defDscp;
}


bool NetlistReader::load(const Rsyn::Json &options)
{
    std::string path = options.value("path", "");
    std::string netlistFile = options.value("netlist", "");
    std::string lefFile = options.value("lef", "");

    this->mSession = mSession;
    mDesign = mSession.getDesign();
    // lazy stitching
    setNetlistPath(path + netlistFile);
    setLefPath(path + lefFile);
    loadAll();

    return true;
}


void NetlistReader::loadAll()
{
    loadLib();
    loadDesign();

    Rsyn::Json physicalOptions;
	mSession.startService("rsyn.physical", physicalOptions);
    DefDscp defDscp = defaultDefDscp();
    mSession.getPhysicalDesign().loadLibrary(lefDscp);
    mSession.getPhysicalDesign().loadDesign(defDscp);
	mSession.getPhysicalDesign().updateAllNetBounds(false);	
}




void NetlistReader::setNetlistPath(std::string path)
{
    mNetlistPath = path;
}


void NetlistReader::setLefPath(std::string path)
{
    mLefPath = path;
}


void NetlistReader::loadDesign()
{
    Stepwatch watchParsingVerilog("Parsing Verilog");
	Legacy::Design verilogDesignDescriptor;
	Parsing::SimplifiedVerilogReader parser(verilogDesignDescriptor);
    parser.parseFromFile(mNetlistPath);

    Reader::populateRsynNetlistFromVerilog(verilogDesignDescriptor, mDesign);
    watchParsingVerilog.finish();
}


void NetlistReader::loadLib()
{
	LEFControlParser lefParser;
	Stepwatch watchParsingLef("Parsing LEF");
	lefParser.parseLEF(mLefPath, lefDscp);

    Reader::populateRsynLibraryFromLef(lefDscp, mDesign);
	watchParsingLef.finish();
}


void NetlistReader::loadDefaults()
{

}
}
