
Common Errors
=

Supplying a verilog netlist file with a DEF file that does not have a floorplanning information
will probably break when the parser tries to extract the pins direction in the DEF files. All
you have to do is to use the NetlistReader reader to read the files 
