#ifndef CABSTRACTPARSER_H
#define CABSTRACTPARSER_H

#include "stl/stl.hpp"

#include <QObject>

class CAbstractParser : public QObject
{
    Q_OBJECT
public:
    explicit CAbstractParser(QObject *parent = 0);
    ~CAbstractParser();

    virtual bool parse(QString &pathModel) = 0;
    virtual void convertObjToStl() = 0;

    stl_file *stl() const;
    void setStl(stl_file *stl);

protected:
    stl_file *m_stl;
};

#endif // CABSTRACTPARSER_H


//stl_file *stl() const { return m_stl; }
//void setStl(stl_file *newStl) { m_stl = newStl; } // copy ref. only
