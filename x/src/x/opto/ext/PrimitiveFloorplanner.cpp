#include "PrimitiveFloorplanner.h"
bool PrimitiveFloorplanner::run(const Rsyn::Json &params)
{
    setUtilization(0.9);
    setFloorplanRatio(1,1);
    create();
    return true;
}

PrimitiveFloorplanner::PrimitiveFloorplanner() :
    mSession(mSession),
    mRsynDesign(mSession.getDesign()),
    mRsynPhysicalDesign(mSession.getPhysicalDesign()),
    mModule(mSession.getTopModule()),
    mCoreSite(mRsynPhysicalDesign.getPhysicalSiteByName("core")),
    mSiteWidth(mCoreSite.getWidth()),
    mSiteHeight(mCoreSite.getHeight())
{
    mCellsArea = cellsArea();
}


void PrimitiveFloorplanner::setUtilization(double utilization )
{
    mUtilization = utilization;
}


void PrimitiveFloorplanner::setFloorplanRatio(double heightPart, double widthPart)
{
    mFloorplanRatio = heightPart/widthPart;
}

/* 1) Calculate the total cells area using information from the Verilog netlist and/or the LEF/Lib : Done */
/* 2) using the utilization find the floor plan area : Done */
/* 3) From the area, AR and the site dimensions ===> get the width and the height : this not sure how it is done */
void PrimitiveFloorplanner::create()
{
    mFloorplanArea = mCellsArea / mUtilization;
    mSiteRatio = mSiteHeight / mSiteWidth;
    mRowRatio = mSiteRatio / mFloorplanRatio;
    mRowCount = ceil(sqrt(mFloorplanArea / (mRowRatio * mSiteHeight * mSiteWidth)));
    mSiteCount = ceil(mRowCount * mRowRatio);
    /* mPhysicalDieData->clsBounds = Bounds(0, 0, coreWidth(), coreHeight()); */
    /* Rsyn::PhysicalDie physicalDie(mPhysicalDieData); */
    /* mRsynPhysicalDesign->data->clsPhysicalDie = physicalDie; */
    for (int i = 0; i < mRowCount; ++i) {
        /* Point rowOrigin = Point(0, mSiteHeight * i); */
        DefRowDscp rowDscp;
        rowDscp.clsSite = mCoreSite.getName();
        /* Naming Style can be changed to suit your needs */
        /* Following the rows naming in simple.def */
        rowDscp.clsName = rowDscp.clsSite+"_SITE_ROW_"+std::to_string(i);
        rowDscp.clsOrigin = DBUxy(0, mSiteHeight * i);
        rowDscp.clsOrientation = "N";
        rowDscp.clsNumX = mSiteCount;
        rowDscp.clsNumY = 1;
        rowDscp.clsStepX = 0;
        rowDscp.clsStepY = 0;
        mRsynPhysicalDesign.addPhysicalRow(rowDscp);
    }
    mRsynPhysicalDesign.setDieArea();
}


/* void Floorplanner::printVals() */
/* { */
/*     printf("chipArea: %.2f\nfpArea: %.2f\nsiteRatio %.2f\nrowRatio: %.2f\nrowCount: %d\n" */
/*            "siteCount: %d\nsiteHeight %.2f\nsiteWidth: %.2f\n" */
/*            "whatever %.2f\ncellsArea %.2f\n", */
/*             mChipArea, mFloorplanArea, mSiteRatio, mRowRatio, mRowCount, mSiteCount, mSiteHeight, mSiteWidth, */
/*             mFloorplanArea / (mRowRatio * mSiteHeight * mSiteWidth), mCellsArea); */
/*  } */
double PrimitiveFloorplanner::cellsArea()
{
    double area = 0;

    for (Rsyn::Instance instance : mModule.allInstances()) {
        if (instance.getType() != Rsyn::CELL)
            continue;
        Rsyn::PhysicalLibraryCell phLibCell = mRsynPhysicalDesign.getPhysicalLibraryCell(instance.asCell());
        DBU dimWidth = phLibCell.getWidth();
        DBU dimHeight = phLibCell.getHeight();
        area += dimWidth * dimHeight;
    }

    return area;
    
}
double PrimitiveFloorplanner::coreWidth()
{
    double x = sqrt(mFloorplanArea / (mHeightPart * mWidthPart));
    mCoreWidth = x * mWidthPart;

    return mCoreWidth;
}
double PrimitiveFloorplanner::coreHeight()
{
    double x = sqrt(mFloorplanArea / (mHeightPart * mWidthPart));
    mCoreHeight = x * mHeightPart;

    return mCoreHeight;

}
void PrimitiveFloorplanner::placePorts()
{
    // Iterate over physical and send location and the physicalports to placePort
    for (Rsyn::PhysicalPort phPort : mPhysicalDesign.allPhysicalPorts())
    {
        mPhysicalDesign.placePhysicalPort(phPort);
        for (Rsyn::PhysicalTrack : mPhysicalDesign.allPhysicalTracks)
        placePhysicalPort(phPort, const DBU x, const DBU y,
                Rsyn::PhysicalOrientation orient, const bool dontNotifyObservers);

    }
    
}
