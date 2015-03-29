import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

import Qt3D 2.0
import Qt3D.Shapes 2.0
//import Qt3D.Render 2.0

Window {

    visible: true
    width: 1280
    height: 800
    title: "Z-Slice"

    //visibility: Window.FullScreen

    MainView {
        id: mainDlg
        anchors.fill: parent
        property url modelFile
        property real dX: 0
        property real dY: 0
        property int idd:0

        onModelFileChanged: {
            app.addModel(mainDlg.modelFile, 0) // assimpSupportedFormats()
            //id = app.lastModel;
            //mainDlg.idd += 1;
            var model3D = Qt.createComponent("Model3DObject.qml")

            // verify position object here
            plateMouseArea.tmpObject = model3D.createObject(viewPort, { /*"id": "_" + mainDlg.idd,*/
                                             "path": mainDlg.modelFile,
                                             "colorObject": "red",
                                             "location": Qt.vector3d(0,0,0)})
            plateMouseArea.hoverEnabled = true
            plateMouseArea.visible = true
        }

        mouseAreaSlice.onClicked: !sliceDlg.visible && !layersDlg.visible ? actionSlice() : dummy()
        mouseAreaGCode.onClicked: !layersDlg.visible && !sliceDlg.visible ? actionCreateLayers() : dummy()
        mouseAreaOpen.onClicked:  !sliceDlg.visible && !layersDlg.visible ? openModelDialog.open() : undefined
        mouseAreaClose.onClicked: Qt.quit()

        // begin actions //////////////////////////
        function actionSlice() {
            console.log("actionSlice()")
            sliceButton.opacity = 1
            openButton.opacity = 0.3
            createLayersButton.opacity = 0.3
            closeButton.opacity = 0.3

            sliceButton.width = 90 // default 65
            sliceDlg.visible = true
        }
        function actionCreateLayers() {
            console.log("actionGCode()")
            createLayersButton.opacity = 1
            sliceButton.opacity = 0.3
            openButton.opacity = 0.3
            closeButton.opacity = 0.3

            createLayersButton.width = 90 // default 65
            layersDlg.visible = true
            //app.gcode()
        }
        function dummy() { console.log("dummy") }

        // end actions //////////////////////////

        Viewport {
            id: viewPort
            anchors.fill: parent
            anchors.leftMargin: mainDlg.sliceButton.width + 40
            anchors.topMargin: 40; anchors.rightMargin: 40; anchors.bottomMargin: 40

            //picking: true
            //navigation: false

            Rectangle {
                anchors.fill: parent
                border.width: 1
                border.color: "#cce9fc"
                color: "transparent"
            }
            //        light: Light {
            //            diffuseColor: Qt.rgba(0.8, 0.8, 0.8, 1)
            //            spotDirection: Qt.vector3d(0, 0, 1)
            //            position: Qt.vector3d(0, 0, 250)
            //            spotExponent: 0
            //        }
            //        lightModel: LightModel {
            //            model: LightModel.TwoSided
            //        }
            camera: Camera {
                id: viewCamera
                property vector3d frontCamera: Qt.vector3d(0, 500, 300)
                property vector3d leftCamera:  Qt.vector3d(-500, 0, 300)
                property vector3d rightCamera: Qt.vector3d(500, 0, 300)
                property vector3d topCamera:   Qt.vector3d(0, 0, 500)
                property vector3d freeCamera:  Qt.vector3d(500, 300, 300)

                eye: freeCamera
                nearPlane:1.0
                farPlane: 2000
                center: Qt.vector3d(0,0,0)
                fieldOfView: 45
                upVector: Qt.vector3d(0,0,1)
            }

            Plate {
                id: plate
            }
//            Item {
//                id: mouseHelper
//                visible: true
//                width: 20; height: 20
////                Rectangle {
////                    anchors.fill: parent
////                    border.color: "grey"
////                    border.width: 1
////                    color: "green"
////                }
//            }

            MouseArea {
                id: plateMouseArea
                anchors.fill: parent
                hoverEnabled: false
                visible: false

                property var tmpObject

                onPositionChanged: {


//                    Допустим, имеется некое пространство сцены, в которое объекты приводятся матрицей MODELVIEW. В дальнейшем объекты преобразовываются в экранное пространство матрицей Projection. Даны координаты курсора в окне с шириной/высотой w/h пикселей: (x, y), которые отсчитываются от верхнего левого угла. Найти координаты соответствующей точки в пространстве сцены.
//                    Решение.
//                    Переведём координаты курсора в экранное пространство. Оно ограничено координатами от -1 до 1 по всем 3 осям, с точкой (0, 0, 0) в центре экрана, ось x идёт слева направо, ось y снизу вверх. Отсюда формулы: xS = (2*x - w)/w, yS = (h - 2*y)/h, zS = 0.
//                    Следующий шаг - перевод из экранных координат в пространство сцены. Для этого надо либо вычислить матрицу проекции (её размерность - 4*4) по данным в MSDN формулам, либо просто прочитать её с помощью glGetDoublev. Затем найти обратную матрицу методом Гаусса. Дополнить координаты xS, yS, zS компонентой w, чтобы получить однородные координаты (задать w = 1). Умножить полученный вектор длиной 4 на обратную матрицу, получим новый вектор длиной 4: (xM, yM, zM, wM). Поделим координаты xM, yM, zM на компонент wM и получим координаты мышиного курсора в пространстве сцены.
                }
                onClicked: {
                    hoverEnabled = false
                    visible = false
                }
            }
        }
    }

    SliceView {
        id: sliceDlg
        visible: false
        mouseAreaCloseButton.cursorShape: Qt.PointingHandCursor
        mouseAreaCloseButton.onEntered: closeButton.border.width = 2
        mouseAreaCloseButton.onExited: closeButton.border.width = 1

        mouseAreaCloseButton.onClicked: {

            mainDlg.createLayersButton.opacity = 1
            mainDlg.openButton.opacity = 1
            mainDlg.closeButton.opacity = 1

            mainDlg.sliceButton.width = 65
            sliceDlg.visible = false
        }

        mouseAreaSliceButton.onClicked: {
//            sliceDlg.visible = false
//            mainForm.visible = true
            // progress bar start showing
            app.slice()
        }
    }

    LayersView {
        id: layersDlg
        visible: false
        mouseAreaCloseButton.cursorShape: Qt.PointingHandCursor
        mouseAreaCloseButton.onEntered: closeButton.border.width = 2
        mouseAreaCloseButton.onExited: closeButton.border.width = 1

        mouseAreaCloseButton.onClicked: {
            mainDlg.sliceButton.opacity = 1
            mainDlg.openButton.opacity = 1
            mainDlg.closeButton.opacity = 1

            mainDlg.createLayersButton.width = 65
            layersDlg.visible = false
        }
    }

    FileDialog {
        id: openModelDialog
        title: "Please choose a 3d model file"
        nameFilters: [ "OBJ files (*.obj)", "STL files (*.stl)", "All files (*)" ]

        onAccepted: {
            mainDlg.modelFile = fileUrl
            openModelDialog.close()
        }
        onRejected: {
            openModelDialog.close()
        }
    }

}


// возможный вариант - добавили объект и сразу законнектили его к сообщениям от мыши
// по клику отконнектили, забыли - остался как есть

// добавить


//QVector3D QGLCamera::mapPoint
//    (const QPoint& point, float aspectRatio, const QSize& viewportSize) const
//{
//    Q_D(const QGLCamera);

//    // Rotate the co-ordinate system to account for the screen rotation.
//    int x = point.x();
//    int y = point.y();
//    int width = viewportSize.width();
//    int height = viewportSize.height();
//    if (!d->adjustForAspectRatio)
//        aspectRatio = 1.0f;
//    if (d->screenRotation == 90) {
//        if (aspectRatio != 0.0f)
//            aspectRatio = 1.0f / aspectRatio;
//        qSwap(x, y);
//        qSwap(width, height);
//        y = height - 1 - y;
//    } else if (d->screenRotation == 180) {
//        x = width - 1 - x;
//        y = height - 1 - y;
//    } else if (d->screenRotation == 270) {
//        if (aspectRatio != 0.0f)
//            aspectRatio = 1.0f / aspectRatio;
//        qSwap(x, y);
//        qSwap(width, height);
//    }

//    // Determine the relative distance from the middle of the screen.
//    // After this xrel and yrel are typically between -1.0 and +1.0
//    // (unless the point was outside the viewport).  The yrel is
//    // flipped upside down to account for the incoming co-ordinate
//    // being left-handed, but the world being right-handed.
//    float xrel, yrel;
//    if (width)
//        xrel = ((float(x * 2)) - float(width)) / float(width);
//    else
//        xrel = 0.0f;
//    if (height)
//        yrel = -((float(y * 2)) - float(height)) / float(height);
//    else
//        yrel = 0.0f;

//    // Reverse the projection and return the point in world co-ordinates.
//    QMatrix4x4 m = projectionMatrix(aspectRatio);
//    QMatrix4x4 invm = m.inverted();
//    return invm.map(QVector3D(xrel, yrel, -1.0f));
//}
