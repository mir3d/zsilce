#ifndef CPARESEROBJ_H
#define CPARESEROBJ_H

#include <QVector3DArray>

#include "CAbstractParser.hpp"


class CModel;
class CParserOBJ : public CAbstractParser
{
    Q_OBJECT
public:
    explicit CParserOBJ(QObject *parent = 0);
    ~CParserOBJ();

    bool parse(QString &pathModel) Q_DECL_OVERRIDE;
    void convertObjToStl();

    QVector3DArray vs;
    QList<quint32> fs;
};

#endif // CPARESEROBJ_H
