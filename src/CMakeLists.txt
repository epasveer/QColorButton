cmake_minimum_required(VERSION 3.1.0)

project(QColorButton VERSION 1.0.2 LANGUAGES CXX)

set(PROJECT_NAME QColorButtonTest)

if(NOT DEFINED QTVERSION)
    set(QTVERSION "QT6" CACHE STRING "" FORCE)
endif()

if(${QTVERSION} STREQUAL "QT6")
    message("-- Compile with QT6")
elseif(${QTVERSION} STREQUAL "QT5")
    message("-- Compile with QT5")
else()
    message(FATAL_ERROR "-- Use -DQTVERSION=QT5|QT6 not \"${QTVERSION}\"")
endif()

# Find includes in the build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_PREFIX_PATH ${QTDIR})
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

if(${QTVERSION} STREQUAL "QT6")
    find_package(Qt6 COMPONENTS REQUIRED Core)
    find_package(Qt6 COMPONENTS REQUIRED Gui)
    find_package(Qt6 COMPONENTS REQUIRED Widgets)

    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)

elseif(${QTVERSION} STREQUAL "QT5")
    find_package(Qt5 COMPONENTS REQUIRED Core)
    find_package(Qt5 COMPONENTS REQUIRED Gui)
    find_package(Qt5 COMPONENTS REQUIRED Widgets)

    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
endif()

set(HEADER_FILES
    Example.h
    QColorSwatch.h
    QColorButton.h
    )

set(SOURCE_FILES
    main.cpp
    Example.cpp
    QColorSwatch.cpp
    QColorButton.cpp
    )

# Set non-Debug build as GUI application.
# Debug build remains consle application.
if(NOT CMAKE_BUILD_TYPE MATCHES Debug) #Release, RelWithDebInfo and MinSizeRel
    if(WIN32) # Check if we are on Windows
        set(SYSTEM_TYPE WIN32)
    elseif(APPLE) # MacOS X
        set(SYSTEM_TYPE MACOSX_BUNDLE)
    else() # UNIX
        set(SYSTEM_TYPE EXCLUDE_FROM_ALL)
    endif()
    message("System type is" ${SYSTEM_TYPE})
endif()

# for Linux, BSD, Solaris, Minix
if(UNIX AND NOT APPLE)
    add_compile_options(-Wall -Wextra -Wunused-result -pedantic)   # -Werror -Wdeprecated-copy
endif()

add_definitions(-DQT_DEPRECATED_WARNINGS)

add_executable(${PROJECT_NAME} ${SYSTEM_TYPE} ${SOURCE_FILES})

install(TARGETS ${PROJECT_NAME} DESTINATION bin)

if(${QTVERSION} STREQUAL "QT6")
    target_link_libraries(${PROJECT_NAME} Qt6::Widgets Qt6::Gui Qt6::Core)
elseif(${QTVERSION} STREQUAL "QT5")
    target_link_libraries(${PROJECT_NAME} Qt5::Widgets Qt5::Gui Qt5::Core)
endif()

