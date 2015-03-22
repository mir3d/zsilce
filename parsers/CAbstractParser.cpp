#include "CAbstractParser.hpp"
#include <QDebug>
#include "stl/stl.hpp"

CAbstractParser::CAbstractParser(QObject *parent) : QObject(parent)
{
    qDebug() << "CAbstractParser construct";
}

CAbstractParser::~CAbstractParser()
{
    qDebug() << "CAbstractParser destruct";
}

stl_file *CAbstractParser::stl() const
{
    return m_stl;
}

void CAbstractParser::setStl(stl_file *stl)
{
    m_stl = stl;
}


