import QtQuick 2.2

Item {
    id: menuButton
    height: parent.height
    width: parent.width

    property string text
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
    FontLoader { id: dPuntillasFont; source: "fonts/d-puntillas-D-to-tiptoe.ttf" }
    FontLoader { id: ubuntuFont; source: "fonts/Ubuntu-B.ttf" }
    Text {
        anchors.centerIn: parent
        color: "white"
        //font.family: dPuntillasFont.name
        font.family: ubuntuFont.name
        font.bold: true
        font.pointSize: parent.height / 2
        text: menuButton.text
    }
    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: menuButton.clicked()
        onPressed: menuButton.pressed()
        onReleased: menuButton.released()
    }
}
