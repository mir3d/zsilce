#ifndef CAPP_HPP
#define CAPP_HPP

#include <QObject>
#include <QLibrary>
#include <QMap>

// for library
typedef void (*libSlice)();
typedef void (*libGCode)();

class CLayer;
class QUrl;
class Cmodel;


class CApp : public QObject
{
    Q_OBJECT

public:
    explicit CApp(QObject *parent = 0);
    ~CApp();

    void init();

    Q_INVOKABLE void slice();
    Q_INVOKABLE void gcode();
    Q_INVOKABLE void addModel(const QUrl &newModel, int level);

    //service


private:
    QLibrary m_lib;
    QMap<int, CLayer* > m_scene;

    libSlice m_fSlice;
    libGCode m_fGCode;
};

#include <QThread>
#endif // CAPP_HPP
