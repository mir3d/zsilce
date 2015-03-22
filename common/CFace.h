#ifndef CFACE_H
#define CFACE_H

#include <QVector3D>
#include <QVector3DArray>

class CFace
{
public:
    CFace();
    ~CFace();

//    QVector3D p1;
//    QVector3D p2;
//    QVector3D p3;

    QVector3DArray p1;
    QVector3DArray p2;
    QVector3DArray p3;
};


#endif // CFACE_H
