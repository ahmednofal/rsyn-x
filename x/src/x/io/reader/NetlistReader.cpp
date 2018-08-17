#include "NetlistReader.h"
#include "rsyn/util/Stepwatch.h"
#include "rsyn/io/parser/lef_def/LEFControlParser.h"
#include "rsyn/io/parser/verilog/SimplifiedVerilogReader.h"

namespace Rsyn {

NetlistReader::NetlistReader()
{
    mDesign = mSession.getDesign();
}


bool NetlistReader::load(const Rsyn::Json &options)
{
    std::string path = options.value("path", "");
    std::string netlistFile = options.value("netlist", "");
    std::string lefFile = options.value("lef", "");

    // lazy stitching
    setNetlistPath(path + netlistFile);
    setLefPath(path + lefFile);
    build();

    return true;
}


void NetlistReader::build()
{
    buildLibrary();
    buildDesign();
}


void NetlistReader::setNetlistPath(std::string path)
{
    mNetlistPath = path;
}


void NetlistReader::setLefPath(std::string path)
{
    mLefPath = path;
}


void NetlistReader::buildDesign()
{
    Stepwatch watchParsingVerilog("Parsing Verilog");
	Legacy::Design verilogDesignDescriptor;
	Parsing::SimplifiedVerilogReader parser(verilogDesignDescriptor);
    parser.parseFromFile(mNetlistPath);

    Reader::populateRsynNetlistFromVerilog(verilogDesignDescriptor, mDesign);
    watchParsingVerilog.finish();
}


void NetlistReader::buildLibrary()
{
	LefDscp lefDscp;
	LEFControlParser lefParser;
	Stepwatch watchParsingLef("Parsing LEF");
	lefParser.parseLEF(mLefPath, lefDscp);

    Reader::populateRsynLibraryFromLef(lefDscp, mDesign);
	watchParsingLef.finish();
}

}
