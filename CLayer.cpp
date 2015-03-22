#include <QList>

#include "CLayer.hpp"
#include "CModel.hpp"


CLayer::CLayer(QObject *parent) : QObject(parent)
{
    m_models.clear();
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
    return m_MaxHeight;
}

void CLayer::setMaxHeight(const qreal &maxHeight)
{
    m_MaxHeight = maxHeight;
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




