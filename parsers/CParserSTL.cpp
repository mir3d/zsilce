#include "CParserSTL.hpp"
#include "../CModel.hpp"

#include "stl/stl.hpp"

#include <QDebug>


CParserSTL::CParserSTL(QObject *parent): CAbstractParser(parent)
{
    qDebug() << "CParserSTL()";
}

CParserSTL::~CParserSTL()
{
    qDebug() << "~CParserSTL()";
}

bool CParserSTL::parse(QString &pathModel)
{
    if(pathModel.isNull() || pathModel.isEmpty()) return false;

    stl_file *stl = (stl_file*)malloc(sizeof(stl_file));
    stl_open(stl, const_cast<char*>(pathModel.toStdString().c_str()));

//    qDebug() << "stl.stats.original_num_facets" << stl.stats.original_num_facets;
//    //qDebug() << "stl.stats.number_of_facets" << stl.stats.number_of_facets;
//    //stl_close(); // fully cleanse

    return true;
}

void CParserSTL::convertObjToStl()
{

}
