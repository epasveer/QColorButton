Notes for cmake.

% cd QColorBar/src/build
% cmake -DCMAKE_BUILD_TYPE=Debug ..
% cmake -DCMAKE_BUILD_TYPE=Release ..
% make clean
% make Example
% sudo make install

Notes for building with cmake.

% cd QColorButton/src/build
    % cmake -DCMAKE_BUILD_TYPE=Debug ..     # Debug release -g.
    % cmake -DCMAKE_BUILD_TYPE=Release ..   # Optimized release -O.
    % cmake -DCMAKE_CXX_FLAGS=-Wall ..      # With all compile warnings turned on.

The above defaults to Qt6. If you want to use Qt5, add the '-DQTVERSION' flag.

    % cmake -DQTVERSION=QT5 -DCMAKE_BUILD_TYPE=Debug ..

Once cmake is run, then just build QColorButton.

    % make clean                            # Clean files.
    % make                                  # Build.
    % sudo make install                     # Install it.

Another way to ask cmake to do the build for you.

    % cmake --build . --config Release
    % sudo cmake --install .

MacOS may need help finding the cmake config file for Qt6.

    % cmake -DCMAKE_PREFIX_PATH=/usr/local/opt/qt6/ -DCMAKE_BUILD_TYPE=Release ..

Sometimes you need to specify a newer version of g++/gcc. Your installation
may have an old version as the default.

    % cmake -D CMAKE_C_COMPILER=gcc-13 -D CMAKE_CXX_COMPILER=g++-13 -DQTVERSION=QT6 -DCMAKE_BUILD_TYPE=Debug ..

