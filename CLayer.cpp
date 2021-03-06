#include <QList>

#include "CLayer.hpp"
#include "CModel.hpp"


CLayer::CLayer(QObject *parent, int id) : QObject(parent)
{
    m_models.clear();
    m_id = id;
}

CLayer::~CLayer()
{

}
QList<CModel *> &CLayer::models()
{
    return m_models; // copy! not reference/pointer
}

void CLayer::addModels(CModel *model)
{
    m_models.append(model);
}

qreal CLayer::maxHeight() const
{
    return m_height;
}

void CLayer::setMaxHeight(const qreal &maxHeight)
{
    m_height = maxHeight;
}

qreal CLayer::findMaxHieght()
{
    // перебрать все объекты в слое и найти максимальный размер объекта вдоль оси z
//    for(QList<CModel *>::const_iterator item = m_models.constBegin();
//        item!=m_models.constEnd(); item++) {
//        *item.
//    }

    return 0;
}

int CLayer::id() const
{
    return m_id;
}

void CLayer::setId(int id)
{
    m_id = id;
}

void CLayer::setHeight(qreal newHeight)
{
    m_height = newHeight;
}

void CLayer::setY0(qreal newY0)
{
    if(m_y0 == newY0) return
    m_y0 = newY0;
    emit y0Changed(m_y0);
}

void CLayer::alignModel(CModel *model, Qt::AlignmentFlag align)
{
    switch (align) {
    case Qt::AlignBottom :
        //stl_translate(model->stl(), 0, 0, 0);
        break;

    case Qt::AlignTop : // прижимает объект к ВЕРХНЕЙ границе слоя

        break;

    case Qt::AlignCenter : // поместить объект к ЦЕНТРУ слоя

        break;
    default:
        break;
    }
    stl_translate(model->stl(), 0, 0, 0);
    qDebug() << "model has down m_stl->stats.min.z" << model->stl()->stats.min.z;
}
