#ifndef NETLIST_READER_H
#define NETLIST_READER_H

#include <Rsyn/Session>
#include <Rsyn/PhysicalDesign>
#include <string>
#include "rsyn/io/parser/lef_def/LEFControlParser.h"


namespace Rsyn {

//! A Reader Class
/*!
 * A Reader class that accepts a 
 * verilog netlist and a lef
 * and inputs the design to rsyn
 */

class NetlistReader : public Reader {
public:
    NetlistReader() = default;
    virtual ~NetlistReader() = default;
    virtual bool load(const Rsyn::Json &params) override;

    //! Verilog path setter
    void setNetlistPath(std::string);

    //! Lef path setter
    void setLefPath(std::string);

    //! Loads designs into rsyn
    void loadAll();

private:
    std::string mNetlistPath;
    std::string mLefPath;
    Rsyn::Session mSession;
    Rsyn::Design mDesign;
	LefDscp lefDscp;
    
    //! Loads Verilog into rsyn
    void loadDesign();

    //! Loads lef into rsyn
    void loadLib();

    //! Loads some def defaults into rsyn
    /*!
     * Some internal data structure depends on initilizing
     * rsyn design with a def descpritor
     */
    void loadDefaults();
};

}

#endif
