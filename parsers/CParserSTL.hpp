#ifndef CPARSERSTL_H
#define CPARSERSTL_H

#include "CAbstractParser.hpp"

#include <QObject>

class CParserSTL : public CAbstractParser
{
    Q_OBJECT

public:
    explicit CParserSTL(QObject *parent = 0);
    ~CParserSTL();

    bool parse(QString &pathModel) Q_DECL_OVERRIDE;
    void convertObjToStl();
};

#endif // CPARSERSTL_H
