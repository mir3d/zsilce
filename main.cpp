#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "CApp.hpp"
#include "CUtils.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication appl(argc, argv);

    CApp *app = new CApp();
    app->init();

    CUtils *utils = new CUtils(&appl);

    QQmlApplicationEngine engine;
    QQmlContext *pContext = engine.rootContext();
    pContext->setContextProperty("app", app);
    pContext->setContextProperty("utils", utils);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return appl.exec();
}
