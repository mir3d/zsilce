import QtQuick 2.0

import Qt3D 2.0
import Qt3D.Shapes 2.0


Item {
    id: plate

    property real step: 10.0

    property real widthPlate:  500.0   // mm
    property real heightPlate: 500.0  // mm
    property real zHeight: 300.0      // mm

    property real zLines: 10.0         // pixel

    Cube { // база
        id: basePlate
        position: Qt.vector3d(250,250,0)
        transform: [
            Scale3D { scale: Qt.vector3d(widthPlate, heightPlate, 1) },
            Translation3D { translate: Qt.vector3d(-widthPlate/2,-heightPlate/2, -0.6)}
        ]

        effect: Effect { color: "#aaca00" }
        //effect: Effect { color: "#555555" }
    }

    Repeater { // yAxis
        model: heightPlate / step + 1
        Line {
            vertices: [ -widthPlate/2, index * step - heightPlate/2, 0.01,
                        -widthPlate/2, index * step - heightPlate/2,    0,
                         widthPlate/2, index * step - heightPlate/2,    0 ]
            effect: Effect { color: "#ff0000" }
            width: 1
        }
    }
    Repeater {  // xAxis
        model: widthPlate / step + 1
        Line {
            vertices: [index * step - heightPlate/2, -heightPlate/2,    0.01,
                       index * step - heightPlate/2, -heightPlate/2,    0,
                       index * step - heightPlate/2,    heightPlate/2,    0 ]
            effect: Effect { color: "#ff0000" }
            width: 1
        }
    }

}


//{
//                     var verts = new Array()
//                     for(var w = 0; w <= widthPlate / step; w++) { // x
//                         verts.push(w * step, 0,          1)
//                         verts.push(w * step, heightPlate,1)
//                     }

//                     for(var h = 0; h <= heightPlate / step; h++){ // y
//                         verts.push(0,          h * step,1)
//                         verts.push(widthPlate, h * step,1)
//                     }
//                     return verts
//                 }
