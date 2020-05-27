#!/bin/bash
#
# Copyright (c) 2020 Max Apodaca
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
#   all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

if [ ! -f build/ ]; then    #check if the build directory exists
  mkdir -p build            #if not create it and run cmake
  cd build
  cmake ..
else
  cd build                  #if it does exist just change into it
fi
make                        #make to rebuild incase something has changed
if [ $? -eq 0 ]; then
  ./test/PROJECT_NAME_tests   #run tests if we built sucessfully
fi
while inotifywait -q -r -e close_write ../ ../test/ #check for src update
do
  make                      #when found build
  if [ $? -eq 0 ]; then     #and if the build is succesfull run the tests
    ./test/PROJECT_NAME_tests
  fi
done
