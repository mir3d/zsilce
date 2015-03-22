TEMPLATE = app

QT += qml quick 3dquick
CONFIG += c++14

SOURCES += main.cpp \
    CModel.cpp \
    CApp.cpp \
    stl/stlinit.cpp \
    stl/stl_io.cpp \
    CUtils.cpp \
    parsers/CAbstractParser.cpp \
    parsers/CParserSTL.cpp \
    parsers/CParserOBJ.cpp \
    common/CFace.cpp \
    CLayer.cpp

RESOURCES += qml.qrc

#DEFINES += QT_NO_DEBUG_OUTPUT

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    CModel.hpp \
    stl/stl.hpp \
    CUtils.h \
    CUtils.hpp \
    parsers/CAbstractParser.hpp \
    parsers/CParserSTL.hpp \
    parsers/CParserOBJ.hpp \
    common/CFace.h \
    CApp.hpp \
    CLayer.hpp

#INCLUDEPATH += c:\Qt\Tools\mingw491_32
#INCLUDEPATH += c:\Qt\Tools\mingw491_32\i686-w64-mingw32
INCLUDEPATH += c:\Qt\Tools\mingw491_32\i686-w64-mingw32\include
#INCLUDEPATH += c:\Qt\Tools\mingw491_32\i686-w64-mingw32\include\c++
#INCLUDEPATH += c:\Qt\Tools\mingw491_32\i686-w64-mingw32\include\c++\i686-w64-mingw32\
INCLUDEPATH += c:\Qt\Tools\mingw491_32\i686-w64-mingw32\include\c++\i686-w64-mingw32\bits\


DISTFILES +=
