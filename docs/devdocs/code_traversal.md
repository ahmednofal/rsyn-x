
When You Can Not Find What You NEED
=

Suggested Tools:

fzf : fuzzy finder, finds files using pattern matching

silver_searcher : finds occurences of a certain string insided all of the files in a directory
recursively and lists them by their files relative path and line number in the file

good linter : I suggest ctags with a plugin for your prefered editor, you can jump to certain 
definitions 

Rsyn-x is a work-under-development, which means that sometimes you won't have the api you 
crave for. Hence you should know the framework structure to be able to add the functionality 
or datastructures you need. The most important part in the entire framework and where you
should always look is the PhysicalDesign Class. There you can find all the needed 
functionality, also accordingly if you do not find your desired datastructure, you should add 
it @ rsyn/src/rsyn/phy/obj/data/PhysicalDesign.h. 


Never try to extend the framework by inheriting from a base class you would like to add to. 
The classes internal nested-in classes are be-friended to allow access to their data in the 
data folder 
of the object for instance PhysicalDesign is a friend of PhysicalDieData so that physicaldesign
can access the PhysicalDieData in PhysicalDie and can easily access its private data members 
and modify them.
