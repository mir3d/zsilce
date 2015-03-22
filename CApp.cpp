#include "CApp.h"
#include "CModel.hpp"
#include "CLayer.h"

#include "parsers/CAbstractParser.hpp"
#include "parsers/CParserOBJ.hpp"
#include "parsers/CParserSTL.hpp"

#include <QString>
#include <QDebug>
#include <QLibrary>
#include <QUrl>

CApp::CApp(QObject *parent) : QObject(parent),
    m_lib(0),
    m_fSlice(0),
    m_fGCode(0)
{
    m_scene.clear();
    setObjectName("app");
}

CApp::~CApp() { }

void CApp::init()
{
    m_lib.setFileName("sliXYZ");

    if(m_lib.isLibrary("sliXYZ")) {
        qDebug() << "> 'sliXYZ' is real library";
    }

    if(!m_lib.load()) {
        qDebug() << "> error load library sliXYZ";
    } else {
        qDebug() << "> success load library sliXYZ";
    }

    m_fSlice = (libSlice)m_lib.resolve("slice");
    m_fGCode = (libGCode)m_lib.resolve("gcode");

    if(!m_fSlice) {
        qDebug() << "> no slice function";
    }
    if(!m_fGCode) {
        qDebug() << "> no gcode function";
    }
}

void CApp::slice()
{
    qDebug() << "CAPP::slice";
    //m_fSlice();
}

void CApp::gcode()
{
    //fGCode();
    qDebug() << "CAPP::gcode";
}

void CApp::addModel(const QUrl &newModel, int level)
{
    // - загрузка из файла
    // - парсинг и создание объекта класса модели
    // - добавление объекта модели в нужный слой
    // - dump сцены

    QString pathModel = newModel.toLocalFile();
    CModel *model = new CModel( pathModel, this );

    QRegExp patternSTLFile("\\.stl$", Qt::CaseInsensitive);
    QRegExp patternOBJFile("\\.obj$", Qt::CaseInsensitive);

    CAbstractParser *parser = 0;

    if(!pathModel.isEmpty()) {
        if(pathModel.contains(patternOBJFile)) {
            parser = new CParserOBJ();
            if(parser) {
                parser->parse(pathModel);
                parser->convertObjToStl();
                model->setStl(parser->stl());
            } else return;
            model->setOBJ(true);
        } else if(pathModel.contains(patternSTLFile)) {
            parser = new CParserSTL();
            parser->parse(pathModel);
            model->setStl(parser->stl());
            model->setSTL(true);
        }
    }

    model->repair();

    // если модель помещается в слой в котором ещё не было помещено ни одной модели
    // то необходимо создать объект Layer этого слоя
    // иначе добавить модель сразу в слой
    // выполнить проверку высоты объекта и высоты слоя.
    // Слой автоматом создавать в высоту объекта!

    if(!m_scene.contains(level)) { // не содержит слой в который помещается модель
        CLayer *pLayer = new CLayer();
        pLayer->setId(level);
        m_scene.insert(level, pLayer);
        pLayer->addModels(model);
    } else { // если в уровне присутствуют уже объекты, то дабавить объект
             // без создания нового уровня
        QMap<int, CLayer*>::iterator pLayer = m_scene.find(level);
        pLayer.value()->addModels(model);
    }

//    model->dumpData();
    delete parser; //  впарсере

    // DUMP
    qDebug() << "M_SCENE entity: ";
    for(auto& layer : m_scene){
        qDebug() << "   Id level: " << layer->id();
        for(auto& model : layer->models()) {
            qDebug() << "     model: " << model->nameFile();
        }
    }
}
