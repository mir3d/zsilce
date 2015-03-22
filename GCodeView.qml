import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Rectangle {
    id: gcodeView
    property alias mouseAreaCloseButton: mouseAreaCloseButton
    property alias closeButton: closeButton

    property alias mouseAreaGCodeButton: mouseAreaGCodeButton
    property alias gcodeButton: gcodeButton

    x: 95
    y: 15

    width: 460
    height: 770
    border.color: "#cce9fc"
    radius: 5

    Rectangle {
        id: gcodeButton
        x: 295
        y: 437
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
            id: gcodeButtonText
            x: 21
            y: 6
            text: qsTr("Slice it")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        MouseArea {
            id: mouseAreaGCodeButton
            hoverEnabled: true
            anchors.fill: parent
        }
        border.color: "#cce9fc"
    }

    Rectangle {
        id: closeButton
        x: 373
        y: 437
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
