#ifndef CMODEL_H
#define CMODEL_H

#include <QObject>
#include <QVector3DArray>
#include <QUrl>
#include <QByteArray>

#include "stl/stl.hpp"

class CModel : public QObject
{
    Q_OBJECT
public:
    explicit CModel(const QUrl &newPathModel, QObject *parent = 0);
    ~CModel();

    inline const QString &modelPath() { return m_modelPath; }
    inline const QString &nameFile() { return m_nameFile; }
    inline stl_file *stl() { return m_stl; }
    inline QByteArray hash() const {return m_hash; }

    inline void setOBJ(bool state) {m_OBJ = state; m_STL = !state;}
    inline void setSTL(bool state) {m_STL = state; m_OBJ = !state;}

    inline bool isOBJ() {return m_OBJ;}
    inline bool isSTL() {return m_STL;}

    void setStl(stl_file* newStl);
    void dumpData();            // not release
    void repair();              // not release



private:
    QString m_modelPath;
    QString m_nameFile;

    QByteArray m_hash;
    stl_file *m_stl;


    bool m_STL;
    bool m_OBJ;
};



#endif // CMODEL_H
