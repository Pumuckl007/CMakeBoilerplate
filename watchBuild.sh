#!/bin/bash
# (c) 2020 Max Apodaca
# This code is licensed under MIT license (see LICENSE for details)

if [ ! -f build/ ]; then    #check if the build directory exists
  mkdir -p build            #if not create it and run cmake
  cd build
  cmake ..
else
  cd build                  #if it does exist just change into it
fi
make                        #make to rebuild incase something has changed
if [ $? -eq 0 ]; then
  ./test/P1_tests   #run tests if we built sucessfully
fi
while inotifywait -q -r -e close_write ../ ../test/ #check for src update
do
  make                      #when found build
  if [ $? -eq 0 ]; then     #and if the build is succesfull run the tests
    ./test/PROJECT_NAME_tests
  fi
done
