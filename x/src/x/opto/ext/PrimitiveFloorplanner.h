
 
#ifndef PRIMITIVE_FLOORPLANNER_OPTO_EXT_H
#define PRIMITIVE_FLOORPLANNER_OPTO_EXT_H

#include <Rsyn/Session>
#include "rsyn/phy/PhysicalDesign.h"
#include "rsyn/phy/util/DefDescriptors.h"
#include "rsyn/util/dbu.h"
/* namespace Rsyn { */
/* class Timer; */
/* class Writer; */
/* } // end namespace */


class PrimitiveFloorplanner : public Rsyn::Process {
public:
	
	virtual bool run(const Rsyn::Json &params);
    PrimitiveFloorplanner();
    void create();
    void setUtilization(float utilization = 0.86);
    void setFloorplanRatio(float ratio = 1);

private:
    double coreWidth();
    double coreHeight();
    double cellsArea();
    Rsyn::Design  mRsynDesign;
    Rsyn::PhysicalDesign mRsynPhysicalDesign;
	Rsyn::Session mSession;
	Rsyn::Module mModule;
    Rsyn::PhysicalSite  mCoreSite;
    int   mRowCount;
    int   mSiteCount;
    float mSiteWidth;
    float mSiteHeight;
    float mSiteRatio;
    float mRowRatio;
    float mChipArea;
    float mFloorplanArea;

    float mUtilization;
    float mFloorplanRatio;
    float mCellsArea;

}; // end class

#endif
