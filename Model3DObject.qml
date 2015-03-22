import QtQuick 2.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Item3D {
    id: model3D

    property url path
    property color colorObject
    property vector3d location

    property var colorObjects: ["#ff0000", "#00ff00", "#0000ff",
                                "#ffff00", "#00ffff", "#ff00ff"]


    position: location
    mesh: Mesh { source: path }
    effect: Effect { color: colorObject }
//        onClicked: console.log("Has model clicked")
//        onHoverEnter: opacity = 0.5
//        onHoverLeave: opacity = 1
//        onPressed: console.log("pressed model")
}
