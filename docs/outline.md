

OVERVIEW
=
Rsyn-x is NOT GEARED towards being used as a SHARED library

Rsyn-x is geared towards building a controllable flow around the Rsyn-x datastructures in the sense that the physical design process such as Floorplanning, Placement or Routing would be 
created and included in the Rsyn-x source tree then all of the source tree will be compiled 
and the resulting executable will have access to the implemented Processes(such as 
floorplanning or placement)

Then through the unix shell interface Processes can be applied on certain inputs

Also through the notion of "services" certain evalutaions can be applied (to check for the effectiveness of placement for example, we might want to check for the wire length estimation ) and file formats production (Such as DEF and SPEF files generation)



The Rsyn-x framework introduces the notion of "session" which holds the datastructures that 
through them and their internal methods you can access the physical design "data" (which 
ususally describes the sections in DEF file format and their physical shapes.), design (which 
ususally describes the names of the modules in the design , the instances in them and their interconnects), library (which incorporates all knowledge extracted from the LEF and LIB files)


Project structure
=
The normal flow would be to implement your process or service and put the files in the 
locations specified in the Rsyn-x tutorials and then register those processes or services in 
the corresponding file type in the setup folder in src/rsyn folder(for instance, registering
services would be to add the register procedure in the service.cpp file)

Then that process or service would be easily callable through the shell interface to operate
on your physical design.

The main entry points in the project are the src/rsyn and x/src/x folders 
src/rsyn/phy contains the core data structures of Rsyn-x, the PhysicalDesign, Design and other
physical design-related classes as well such as PhysicalTracks and PhysicalCell for instance

The source code is structured in a different manner than most c++ projects. C++ header files 
reflect always the signature of the module or class that is to be implemented in the cpp files
Rsyn-x does it differently. The phy modules which contains all of the necessary classes for 
the physical-related processes, contains 3 folders. The obj folder contains all of the classes
that are related to physical processing of the design. The obj folder contains 3 folders. The
data folder contains what normally would be the data section in a class definition in a header
file for a class. The decl folder contains the header files that contain declaration of the
methods of the different physical-related classes.











