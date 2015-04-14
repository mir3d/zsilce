#include "CModel.hpp"
//#include "stl/stl.hpp"


#include <QRegExp>
#include <QUrl>
#include <QDebug>
#include <QFileInfo>
#include <QCryptographicHash>
#include <QDateTime>

CModel::CModel(const QUrl &newPathModel, QObject *parent) : QObject(parent),
    m_stl(0),
    m_STL(false),
    m_OBJ(false)
{
    m_modelPath = newPathModel.toEncoded();
    m_nameFile = QFileInfo(m_modelPath).fileName();

    m_hash = QCryptographicHash::hash(m_modelPath.toLatin1() +
                QString().setNum(QDateTime::currentMSecsSinceEpoch()).toLatin1(),
                QCryptographicHash::Md5);

    qDebug() << "model constructor: " << m_modelPath;
    qDebug() << "   m_modelPath:" << m_modelPath;
    qDebug() << "   m_nameFile:" << m_nameFile;
    qDebug() << "   m_hash:" << m_hash;
}

CModel::~CModel()
{
    if(m_stl)
        stl_close(m_stl);
}

void CModel::setStl(stl_file *newStl)
{
    if(newStl)
        m_stl = newStl;
}

void CModel::dumpData()
{
    qDebug() << "Model: " << m_modelPath;
//    for(i=0; i < m_stl->stats.; i++) {
//        qDebug() <<  i << ": x y z (" <<
//                    m_stl->v_shared[i].x <<
//                    m_stl->v_shared[i].y <<
//                    m_stl->v_shared[i].z;
//    }
}

void CModel::repair()
{
    qDebug() << "CModel::repair() - not implemented!";
}

QVector3DArray CModel::boundBox3d()
{
    if(!m_bound.isEmpty()) return m_bound;

    //calc bound  pmin & pmax
    QVector3DArray min;
    QVector3DArray max;
    min.append(m_stl->stats.min.x, m_stl->stats.min.y, m_stl->stats.min.z);
    max.append(m_stl->stats.max.x, m_stl->stats.max.y, m_stl->stats.max.z);

    return min;
}


































