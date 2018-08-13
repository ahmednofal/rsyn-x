#include <Rsyn/Session>
#include "rsyn/io/Writer.h"
#include <string>

int main()
{
    Rsyn::Session session;
    std::string filesPath = "/home/karim/rsyn-x/x/demo/simple";
    std::string format = "iccad2015";                     
    Rsyn::Json options = {
        {"config" , "simple.iccad2015"},
        {"path", filesPath},
        {"maxDisplacement" , 400},
        {"targetUtilization" , 0.85},
        {"parms" , "ICCAD15.parm"}
    };
	session.runReader(format, options);

    std::string writerName = "rsyn.writer";
    std::string defName = "foo.def";
    Rsyn::Writer * writerPtr = session.getService(writerName,  Rsyn::SERVICE_OPTIONAL);       // not sure what is the second argument
    // second Argument is not actually being used by writeDEF
    writerPtr->writeDEF(defName, true);

    return 0;
}
