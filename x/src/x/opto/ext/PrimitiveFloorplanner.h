
 
#ifndef PRIMITIVE_FLOORPLANNER_OPTO_EXT_H
#define PRIMITIVE_FLOORPLANNER_OPTO_EXT_H

#include <Rsyn/Session>
#include <Rsyn/PhysicalDesign>

/* class PhysicalDieDataWrapper : public Rsyn::PhysicalDieData{ */
/* public: */
/*     bool setArea(double height, double width); */

/* }; */
class PrimitiveFloorplanner : public Rsyn::Process, protected Rsyn::Proxy<Rsyn::PhysicalDesign>{

public:
	virtual bool run(const Rsyn::Json &params);
    PrimitiveFloorplanner();
    void create();
    void setUtilization(double utilization = 0.86);
    void setFloorplanRatio(double heightPart = 1, double widthPart = 1);

private:
    double coreWidth();
    double coreHeight();
    double cellsArea();
    Rsyn::Design  mRsynDesign;
    Rsyn::PhysicalDesign mRsynPhysicalDesign;
	Rsyn::Session mSession;
	Rsyn::Module mModule;
    Rsyn::PhysicalSite  mCoreSite;
    Rsyn::PhysicalDieData *mPhysicalDieData = new Rsyn::PhysicalDieData();
    int   mRowCount;
    int   mSiteCount;
    double mSiteWidth;
    double mSiteHeight;
    double mSiteRatio;
    double mRowRatio;
    double mChipArea;
    double mFloorplanArea;
    double mCoreWidth;
    double mCoreHeight;
    double mUtilization;
    double mFloorplanRatio;
    double mHeightPart;
    double mWidthPart;
    double mCellsArea;

}; // end class

#endif
