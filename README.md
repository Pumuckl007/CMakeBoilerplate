My default repo for C / C++ with CMake

The watchbuild script will auto compile and run the tests when a file changes.

You must change ```PROJECT_NAME``` and ```PROJECT_NAME_EXE``` in CMakeLists.txt
as well as ```PROJECT_NAME``` test/CMakeLists.txt as well as  in watchBuild.sh.

The watchbuild script requires the ```inotify-tools``` package.


Testing uses [Miniuint](https://github.com/urin/miniunit).
