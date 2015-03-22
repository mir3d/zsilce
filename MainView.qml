import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Rectangle {
    id: mainView
    property alias mouseAreaClose: mouseAreaClose
    property alias mouseAreaSlice: mouseAreaSlice
    property alias mouseAreaGCode: mouseAreaGCode
    property alias mouseAreaOpen:  mouseAreaOpen

    property alias sliceButton: sliceButton
    property alias gCodeButton: gCodeButton
    property alias openButton:  openButton
    property alias closeButton: closeButton

    width: 1024
    height: 768
    smooth: false
    enabled: true
    antialiasing: false
    border.color: "#00000000"

    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#ffffff";
        }
        GradientStop {
            position: 0.63;
            color: "#eefcff";
        }
        GradientStop {
            position: 1.00;
            color: "#ffffff";
        }
    }

    Rectangle {
        id: openButton
        width: 65
        height: 25
        color: "#ffffff"
        radius: 5
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 15
        antialiasing: true
        border.color: "#cce9fc"
        Text {
            id: textOpenFile
            x: 8
            y: 20
            width: 39
            height: 26
            text: qsTr("Add")
            font.family: "Verdana"
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.top: parent.top
        }

        MouseArea {
            id: mouseAreaOpen
            hoverEnabled: true
            clip: false
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onEntered: openButton.border.width   = 2
            onExited: openButton.border.width    = 1
        }
    }

    Rectangle {
        id: sliceButton
        y: 51
        width: 65
        height: 25
        color: "#ffffff"
        radius: 5
        enabled: true
        smooth: false
        anchors.left: parent.left
        anchors.leftMargin: 15
        antialiasing: false
        border.color: "#cce9fc"

        Text {
            id: textSliceButton
            x: 8
            y: 20
            width: 39
            height: 26
            text: qsTr("Slice")
            font.family: "Verdana"
            textFormat: Text.PlainText
            enabled: false
            antialiasing: false
            smooth: false
            style: Text.Normal
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.top: parent.top
        }

        MouseArea {
            id: mouseAreaSlice
            smooth: false
            anchors.fill: parent
            hoverEnabled: true
            clip: false

            cursorShape: Qt.PointingHandCursor
            onEntered: sliceButton.border.width = 2
            onExited: sliceButton.border.width  = 1
        }
    }

    Rectangle {
        id: gCodeButton
        y: 86
        width: 65
        height: 25
        color: "#ffffff"
        radius: 5
        anchors.left: parent.left
        anchors.leftMargin: 15
        antialiasing: true
        border.color: "#cce9fc"

        Text {
            id: textGCode
            x: 8
            y: 20
            width: 48
            height: 26
            text: qsTr("G-code")
            font.family: "Verdana"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.top: parent.top
        }

        MouseArea {
            id: mouseAreaGCode
            hoverEnabled: true
            clip: false
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onEntered: gCodeButton.border.width = 2
            onExited: gCodeButton.border.width  = 1
        }
    }

    Rectangle {
        id: closeButton
        y: 121
        width: 65
        height: 25
        color: "#ffffff"
        radius: 5
        anchors.left: parent.left
        anchors.leftMargin: 15
        antialiasing: true
        border.color: "#cce9fc"

        Text {
            id: textCloseButton
            x: 8
            y: 20
            width: 35
            height: 26
            text: qsTr("Close")
            font.family: "Verdana"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.top: parent.top
        }

        MouseArea {
            id: mouseAreaClose
            hoverEnabled: true
            clip: false
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onEntered: closeButton.border.width = 2
            onExited: closeButton.border.width  = 1
        }
    }
}
