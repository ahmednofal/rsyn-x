
Development Flow
=
The development flow is as follows : You design either the "service" or the "process" then 
you implement it via accessing the data filled using the Rsyn-x framework reader modules.
After implementing the service or process; you have to register it in the framework to 
be callable from the shell interface. The registration process happends by adding it as a register process(refer to github tutorial about registering it)


The implementation of the process happens by accessing the session's variables : design, physicaldesign, library and physical library. Each of those instances will give access to 
functions that set or get values of the design, physical design or library.

So for instance if we take the placement optimization problem as an example for a process we
need to implement a solution for. We would need to access the names, the number and the inter
-connects between the instances of the design. Which would be included in the design object
in the session. The information about the instances physical shapes, their placement in rows 
and the tracks definition in the die can all be accessed and set via the physical design object.

a Typ
Typical workflow to get a netlist to be accessible, modifiable and processable through using 
the netlistReader developed by [Kareem Farid](https://github.com/kareefardi) to be able to 
just use a netlist
without having to include a pre-floorplanned DEF file like you would have to do normally, if 
you were to be using Rsyn-x main repo. The provided reader would read the netlist that is 
provided in a verilog file. The netlist have to be completely pre-synthesized into basic blocks
(AND, OR), normal non-synthesizable verilog wil not pass. You can use a tool like qflow to 
synthesize. After reading the netlist using the "netlistReader", you can now access the 
physical design info such as the instances and their placement information. 
As a starter we can take a look at the floorplanning process. We need to be able to access ,
modify and add to the Rows, Tracks and Pin placement of the design. The api to do such a thing
is as follows 
* PhysicalDesign.allPhysicalLayers()
* PhysicalDesign.allPhysicalTracks()
    * PhysicalTracks.getLocation()
    * PhysicalTracks.getSpace()
    * PhysicalTracks.getNumberOfTracks()
    * PhysicalTracks.getDirection()
    * PhysicalTracks.getNumberOfTracks()
    * PhysicalTracks.getNumberOfTracks()
    * PhysicalTracks.getNumberOfTracks()
* PhysicalDesign.getPhysicalDie()
    * PhysicalDie.getLength(Dim) Dim is either X or Y
* PhysicalDesign.allPhysicalPorts()
* PhysicalDesign.placePhysicalPort(phPort, xCoordinate, yCoordinate, orient , dont_alert_notifiers_flag)

The current version of Rsyn-x does not return modules' cells, instead it returns all of the 
instances and you have to check manually if they are cells (cells extraction is to be 
supported in future releases), so the way to do it is this :


An implementation flow can just call the services, processes and readers from within the code
in the source tree rather than use the rsyn scripting language/interface

``` 
bool FastPlace::run(const Rsyn::Json &params) {
	this->session = session;
	this->design = session.getDesign();
	this->timer = session.getService("rsyn.timer");
	this->writer = session.getService("rsyn.writer");
	this->module = design.getTopModule();
```
Also to mark certain flags set about certain aspects of the design (such as the orientation of
the tracks) there are certain defined enumerable types for that, for instance : 
    ```
    Rsyn::PhysicalOrientation orient = Rsyn::PhysicalOrientation::ORIENTATION_E;
    ```
