import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Rectangle {
    id: sliceView
    property alias mouseAreaCloseButton: mouseAreaCloseButton
    property alias closeButton: closeButton

    property alias mouseAreaSliceButton: mouseAreaSliceButton
    property alias sliceButton: sliceButton

    x: 95
    y: 15

    width: 460
    height: 770
    border.color: "#cce9fc"
    radius: 5

    Rectangle {
        id: borderSlicePropFrame
        color: "transparent"
        radius: 3
        z: -1
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.left: parent.left
        border.color: "#cce9fc"
    }

    Rectangle {
        id: rectangle1
        x: 47
        y: 140
        width: 92
        height: 22
        color: "#00000000"
        border.color: "#45a5e3"
    }

    Rectangle {
        id: rectangle2
        color: "#00000000"
        border.color: "#76c4f7"
//        anchors.verticalCenterOffset: 0
//        anchors.topMargin: 0
//        anchors.verticalCenter: rectangle1.verticalCenter
//        anchors.bottom: rectangle1.bottom
//        anchors.top: rectangle1.top
//        anchors.left: rectangle1.right
//        anchors.leftMargin: 6
    }

    TextEdit {
        id: textEdit1
        x: 66
        y: 19
        width: 80
        height: 20
        text: qsTr("Text Edit")
        font.pixelSize: 12
        anchors.top: stepText.top
    }

    Text {
        id: stepText
        x: 16
        y: 19
        text: qsTr("step")
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        smooth: false
        antialiasing: false
        font.pixelSize: 12
    }

    Rectangle {
        id: sliceButton
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
            id: sliceButtonText
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
            id: mouseAreaSliceButton
            hoverEnabled: true
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onEntered: sliceButton.border.width = 2
            onExited: sliceButton.border.width = 1
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
