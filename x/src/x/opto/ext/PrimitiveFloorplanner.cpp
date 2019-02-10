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
    mRsynPhysicalDesign.setDieArea(0,0);
    mRsynPhysicalDesign.defineDesignPhysicalTracks();
    placePorts();
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
/* Rsyn::PhysicalOrientation portOrientation(Rsyn::PhysicalPort phPort, Rsyn::PhysicalTrackDirection phTracksDir) */
/* { */
/*     switch(phTracksDir) */
/*     { */
/*         case horizontal: */
/*             dbu workingdim = mphysicaldesign.getphysicaldie().getlength(x); */
/*             // Assuming 0,0 top left corner in the die */
/*             if (yCoordinate == workingdim) */
/*             { */
/*             } */

/*             break; */
/*         case VERTICAL: */
/*             DBU workingDim = mRsynPhysicalDesign.getPhysicalDie().getLength(Y); */
/*             break; */
/*     } */
/* } */
void PrimitiveFloorplanner::placePorts()
{
    auto debugging = true;
    auto placementDone = false;
    DBU xCoordinateMul = 0;
    DBU yCoordinateMul = 0;
    DBU xOffSet = 0;
    DBU yOffSet = 0;
    DBU xSpace = 0;
    DBU ySpace = 0;
    DBU xLocation = 0;
    DBU yLocation = 0;
    Rsyn::PhysicalTrackDirection phTracksDir;
    DBU location;
    DBU space;
    int tracksNum;
    std::vector<Rsyn::PhysicalPort> designPhysicalPorts = mRsynPhysicalDesign.allPhysicalPorts();
    Rsyn::PhysicalOrientation orient = Rsyn::PhysicalOrientation::ORIENTATION_E;

    // Iterate over physical and send location and the physicalports to placePort
    for (Rsyn::PhysicalLayer phLayer: mRsynPhysicalDesign.allPhysicalLayers())
    {
        if (placementDone)
            break;
        for (Rsyn::PhysicalTracks phTracks : mRsynPhysicalDesign.allPhysicalTracks(phLayer))
        {
        if (placementDone)
            break;
            location = phTracks.getLocation();
            space = phTracks.getSpace();
            tracksNum = phTracks.getNumberOfTracks();
            phTracksDir = phTracks.getDirection();
            switch (phTracksDir){
                case Rsyn::PhysicalTrackDirection::TRACK_HORIZONTAL:
                    yCoordinateMul = 1;
                    ySpace = space;
                    if (mPlacePortsOnEndOfTrack)
                    yOffSet = mRsynPhysicalDesign.getPhysicalDie().getLength(X);
                    yLocation = location;
                    if (debugging)
                    {
                        std::cout << "yCoordinateMul" << yCoordinateMul << std::endl;
                        std::cout << "ySpace   "<< ySpace << std::endl;
                        std::cout << "yOffSet  "<< yOffSet << std::endl;
                        std::cout << "yLocation"<< yLocation<< std::endl;

                    }
                    break;
                case Rsyn::PhysicalTrackDirection::TRACK_VERTICAL:
                    yCoordinateMul = 1;
                    xSpace = space;
                    if (mPlacePortsOnEndOfTrack)
                    xOffSet = mRsynPhysicalDesign.getPhysicalDie().getLength(Y);
                    xLocation = location;
                    if (debugging)
                    {
                        std::cout << "xCoordinateMul" << xCoordinateMul << std::endl;
                        std::cout << "xSpace   "<< xSpace << std::endl;
                        std::cout << "xOffSet  "<< xOffSet << std::endl;
                        std::cout << "xLocation"<< xLocation<< std::endl;

                    }
                    break;
            }
            for (int trackIndex = 0; trackIndex < tracksNum; trackIndex++)
            {
                if(debugging)
                std::cout << "in track " << trackIndex << std::endl;
                Rsyn::PhysicalPort phPort = designPhysicalPorts.back();
                if(debugging)
                std::cout << "phPortName " << phPort.getName() << std::endl;
                designPhysicalPorts.pop_back();
                DBU xCoordinate =   xLocation + xOffSet + xCoordinateMul*trackIndex*xSpace;
                DBU yCoordinate =   yLocation + yOffSet + yCoordinateMul*trackIndex*ySpace;
                if(debugging)
                std::cout << "(x, y) of phPort    " << xCoordinate << ","<< yCoordinate << std::endl;
                if(debugging)
                    if (orient == Rsyn::PhysicalOrientation::ORIENTATION_INVALID)
                        std::cout << "invalid orient" << std::endl;
                mRsynPhysicalDesign.placePhysicalPort(phPort, xCoordinate, yCoordinate,
                    orient , false);
                if (designPhysicalPorts.empty())
                {
                    placementDone = true;
                    break;
                }
            }

        }
    }
}