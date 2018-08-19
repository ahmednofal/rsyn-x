#include "PrimitiveFloorplanner.h"
bool PrimitiveFloorplanner::run(const Rsyn::Json &params)
{
    setUtilization(0.9);
    setFloorplanRatio(1);
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


void PrimitiveFloorplanner::setUtilization(float utilization )
{
    mUtilization = utilization;
}


void PrimitiveFloorplanner::setFloorplanRatio(float ratio )
{
    mFloorplanRatio = ratio;
}


void PrimitiveFloorplanner::create()
{
    mFloorplanArea = mCellsArea / mUtilization;
    mSiteRatio = mSiteHeight / mSiteWidth;
    mRowRatio = mSiteRatio / mFloorplanRatio;
    mRowCount = ceil(sqrt(mFloorplanArea / (mRowRatio * mSiteHeight * mSiteWidth)));
    mSiteCount = ceil(mRowCount * mRowRatio);
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
/* double PrimitiveFloorplanner::coreWidth() */
/* { */
/*     double width = 0; */
/*     for (Rsyn::Instance instance : module.allInstances()) */ 
/*     { */
/*         if (instance.getType() != Rsyn::CELL) */
/*             continue; */
/*         Rsyn::PhysicalLibraryCell &phLibCell = mRsynPhysicalDesign.getPhysicalLibraryCell(instance.asCell()); */
/*         width += phLibCell.getWidth(); */
/*     } */
/*     return width; */
/* } */
/* double PrimitiveFloorplanner::coreHeight() */
/* { */

/* } */
