#ifndef CUTILS_H
#define CUTILS_H

#include <QObject>

class CUtils : public QObject
{
    Q_OBJECT
public:
    explicit CUtils(QObject *parent = 0);
    ~CUtils();

    Q_INVOKABLE void glUnProject(); // convert view port to wold coords

signals:


public slots:

private:




};

#endif // CUTILS_H
