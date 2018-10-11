
Notes about running
=

When running and rsyn script of even running the produced binary you should always run it from 
within the directory /rsyn/build/bin and not from anywhere else because it records the current
path and uses it to find other files in the project directory. It uses the relative path when 
running the scripts which means that it will not find the specified files if they are not 
either specified using their absolute paths (have not been tried out) or not specified relative
to the bin folder.

Also keep the files PORT9.dat, POWV9.dat in the bin folder or it wont run


Please Note that running rsyn in a flow that does not include the NetListReader and with either
no DEF files at all or DEF files with no floorplanning, the execution will fail.
