#ifndef SLIXYZ_H
#define SLIXYZ_H

#include "slixyz_global.h"
//class SLIXYZSHARED_EXPORT SliXYZ
//{
//public:
//    SliXYZ();

//    void slice();
//    void gcode();
//};

//extern "C" SLIXYZSHARED_EXPORT SliXYZ * createSliXYZObject();
//SliXYZ * createSliXYZObject() {
//    return new SliXYZ();
//}

extern "C" SLIXYZSHARED_EXPORT int slice();
extern "C" SLIXYZSHARED_EXPORT int gcode();

#endif // SLIXYZ_H

