#include "CAbstractParser.hpp"
#include "CParserOBJ.hpp"
#include "CModel.hpp"

#include <QFile>
#include <QTextStream>
#include <QDebug>

#include "stl/stl.hpp"


CParserOBJ::CParserOBJ(QObject *parent): CAbstractParser(parent)
{
    qDebug() << "CParserOBJ()";
}

CParserOBJ::~CParserOBJ() {}

bool CParserOBJ::parse(QString &pathModel) //  parse obj & fill CModel
{
    if(pathModel.isNull() || pathModel.isEmpty()) return false;

    //1  read from *.obj to parsedData
    QFile inData(pathModel);

    if(!inData.open(QIODevice::ReadOnly)) {
        qDebug() << "file " << pathModel << " open error";
        return false;
    }

    QTextStream textFile(&inData);
    QString line;
    QStringList lineData;

    //2  PARSE DATA OBJ
    while(!textFile.atEnd()) {
        line = textFile.readLine().trimmed();
        lineData << line.split(QRegExp("\\s+"));

        if(lineData[0] == QChar('v'))
            vs.append(lineData[1].toFloat(),
                               lineData[2].toFloat(),
                               lineData[3].toFloat());
        if(lineData[0] == QChar('f')) {
            fs.append(lineData[1].toUInt());
            fs.append(lineData[2].toUInt());
            fs.append(lineData[3].toUInt());
        }
        lineData.clear();
    }

    inData.close();
    return true;
}

void CParserOBJ::convertObjToStl()
{
    stl_file *stl = 0;
    stl = (stl_file*)malloc(sizeof(stl_file));
    if(!stl) return;

    stl_initialize(stl);
    stl->error = 0;
    stl->stats.type = inmemory;
    stl->stats.number_of_facets = this->vs.count() + 1;
    qDebug() << "number_of_facets" << stl->stats.number_of_facets;

    qDebug() << "before: stl.facet_start" << stl->facet_start;
    stl_allocate(stl);
    qDebug() << "after: stl.facet_start" << stl->facet_start;

    // TODO: copy from triangleMesh...

    m_stl = stl;
}

//qDebug() << "VERTICES:" << vs;
//qDebug() << "FACES:" << fs;
//    qDebug() << "test" << vertices.at(5).x() << vertices.at(5).y() << vertices.at(5).z();
//    qDebug() << "test" << vertices.at(5)[0] << vertices.at(5)[1] << vertices.at(5)[2];
