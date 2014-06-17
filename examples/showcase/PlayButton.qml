import QtQuick 2.2

Item {
    id: playButton
    height: parent.height
    width: parent.width

    property string text
    property bool paused
    signal clicked
    signal pressed
    signal released
    opacity: area.pressed ? 0.5 : 1.0

    Rectangle {
        anchors.fill: parent
        color: "black"
        radius: 5
        opacity: 0.8
    }
    Image {
        anchors.centerIn: parent
        height: parent.height * 0.5
        width: height
        source: playButton.paused ? "images/play.png" : "images/pause.png"
    }
    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: playButton.clicked()
        onPressed: playButton.pressed()
        onReleased: playButton.released()
    }
}
