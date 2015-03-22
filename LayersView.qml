import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

import QtQuick.Window 2.2

Rectangle {
    id: layersView
    property alias mouseAreaCloseButton: mouseAreaCloseButton
    property alias closeButton: closeButton

    property alias mouseAreaCreateLayersButton: mouseAreaCreateLayersButton
    property alias createLayersButton: createLayersButton

    x: 95
    y: 15

    width: 460
    height: 300
    border.color: "#cce9fc"
    radius: 5

    GroupBox {
        x: 25
        y: 15
        flat: true
        title: "Operation:"
        Column {
            spacing: 10
            Row {
                spacing: 15
                // 1 line
                CheckBox {
                    id: activateLayersCount
                    anchors.verticalCenter: parent.verticalCenter
                    text: "layers number"
                }
                TextField {
                    anchors.verticalCenter: parent.verticalCenter
                    placeholderText: "enter count"
                }
                Button {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "?"
                    tooltip: "Количество слоёв для автоматического создания"
                }
            }
            Row {
                // 2 line
                // 1 line
                CheckBox {
                    id: activateCopyLayer
                    anchors.verticalCenter: parent.verticalCenter
                    text: "copy current layer"
                }
                Button {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "?"
                    tooltip: "Все автоматически созданные слои, будут созданы как копия текущего слоя"
                }
            }


        }
    }

    Rectangle { // start button
        id: createLayersButton
        x: 295
        y: 257
        width: 65
        height: 25
        color: "#00000000"
        radius: 5
//        anchors.bottomMargin: 0
//        anchors.topMargin: 0
//        anchors.verticalCenter: closeButton.verticalCenter
//        anchors.bottom: closeButton.bottom
//        anchors.top: closeButton.top
        Text {
            id: createLayersButtonText
            x: 21
            y: 6
            text: qsTr("Start")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        MouseArea {
            id: mouseAreaCreateLayersButton
            hoverEnabled: true
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onEntered: createLayersButton.border.width = 2
            onExited: createLayersButton.border.width = 1
        }
        border.color: "#cce9fc"
    }

    Rectangle { // close button
        id: closeButton
        x: 373
        y: 257
        width: 65
        height: 25
        color: "#00000000"
        radius: 5
        border.color: "#cce9fc"

        Text {
            id: closeButtonText
            x: 21
            y: 6
            text: qsTr("Close")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }

        MouseArea {
            id: mouseAreaCloseButton
            hoverEnabled: true
            anchors.fill: parent
        }
    }
}
