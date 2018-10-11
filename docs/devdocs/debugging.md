
Debugging Code
=

The compiler will most likely optimize some values out. It is essential to lower the
optimizations to the lowest level using -o0 inside the CMakeLists.txt or specifying that the 
build is a RelWithDebug using `cmake -DCMAKE_BUILD_TYPE=Debug` when building(of course 
following the build instructions except when executing cmake), and that way you won't have 
values "optimized out" when debugging
