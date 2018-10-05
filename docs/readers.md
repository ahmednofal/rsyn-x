
Readers
=

Readers are an Rsyn-x notion which use Rsyn-x defined or external service added to it and other
Rsyn-x APIs to read different file formats and populate Rsyn-x internal datastructure(so 
typical reader will have a verilog and def parsers and would use the information extracted
from those .v and .def files to populate the internal datastructures of Rsy-x )

a typical rsyn-script looks like this : 
```
open "verilog" {"netlist" : "/simple.v", "lef" : "/simple.lef"};
start "rsyn.writer";
start "rsyn.timer";
run "ext.PrimitiveFloorplanner";
run "example.randomPlacement";
writeDEF;
```
notice the first line calling a reader called verilog, which takes verilog and lef files
This is defined through the reader registration process which is through the setup folder in 
rsyn in the reader file : rsyn-x/x/src/x/setup/reader.cpp
```
static Startup registerReaders([]{
	Rsyn::Session session;
	session.registerReader<ICCAD15::ICCAD15ReaderExtended>("iccad2015");
    session.registerReader<NetlistReader>("verilog");
```
notice the registration happens via
```
session.registerReader<YOUR_READER>("name");
```

you can see the physical design population from verilog module that was added by [Kareem Farid](https://github.com/kareefardi)
in
```
session.registerReader<NetlistReader>("verilog");
```
from the rsyn shell you can easily check the names of the registered readers via simply
```
list "reader"
```
