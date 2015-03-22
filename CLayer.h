#ifndef CLAYER_H
#define CLAYER_H

#include <QObject>
#include <QList>

class CModel;

class CLayer : public QObject
{
    Q_OBJECT
public:
    CLayer(QObject *parent = 0);
    ~CLayer();

    //get/set
    QList<CModel *> &models();
    void addModels(CModel *model);

    qreal maxHeight() const;
    void setMaxHeight(const qreal &maxHeight);

    //logic
    qreal findMaxHieght();

    int id() const;
    void setId(int id);

private:
    QList<CModel *> m_models;

    qreal m_MaxHeight;
    int m_id;

};

#endif // CLAYER_H
