#ifndef CUTILS_H
#define CUTILS_H

#include <QObject>

class CUtils : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal x READ x WRITE setX NOTIFY xChanged)
    Q_PROPERTY(qreal y READ y WRITE setY NOTIFY yChanged)
public:
    explicit CUtils(QObject *parent = 0);
    ~CUtils();

    Q_INVOKABLE void glUnProject(qreal x0, qreal y0); // convert view port to wold coords

    inline qreal x() const { return m_x; }
    inline qreal y() const { return m_y; }

signals:
    void xChanged(qreal arg);
    void yChanged(qreal arg);

public slots:
    void setX(qreal newX);
    void setY(qreal newY);

private:
    qreal m_x;
    qreal m_y;
};

#endif // CUTILS_H
