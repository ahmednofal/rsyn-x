
General Notes
=

Rsyn-x does not use a mainstream verilog parser, it uses a custom built parser to narrow down
the focus of verilog to the synthesizeable part

Due to the use of the bounds variable in the instances as the holder of the place of the 
instance, the normal use of the bounds to specify the places of the pins would be wrong, 
Rsyn-x specifies special variable for the pins placement probably because the bounds will 
be used to specify shapes which is not applicable in a typcial setting of pins.
