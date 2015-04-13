#ifndef CLAYER_HPP
#define CLAYER_HPP

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

    int id() const;
    void setId(int id);

    void setHeight(qreal newHeight);
    inline qreal height() const { return m_height; }

    void setY0(qreal newY0);
    inline qreal y0() const { return m_y0; }

    //logic
    qreal findMaxHieght();

private:
    QList<CModel *> m_models;

    qreal m_height;             // высота слоя
    qreal m_y0;                 // нижня граница слоя
    int m_id;                   // номер слоя
};

#endif // CLAYER_HPP
