import QtQuick 2.2
import Bacon2D 1.0

Scene {
    id: menuScene
    anchors.fill: parent

    property int bigFontSize: parent.width / 15.0

    FontLoader { id: dPuntillasFont; source: "fonts/d-puntillas-D-to-tiptoe.ttf" }

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Column {
        anchors.fill: parent

        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 80
            text: "Cannon"
            onClicked: game.currentScene = cannonScene
        }

        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 80
            text: "Rope"
            onClicked: game.currentScene = ropeScene
        }

        /*
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.family: dPuntillasFont.name
            font.pointSize: menuScene.bigFontSize
            text: "Cannon"
            MouseArea {
                anchors.fill: parent
                onClicked: game.currentScene = cannonScene
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.family: dPuntillasFont.name
            font.pointSize: menuScene.bigFontSize
            text: "Rope"
            MouseArea {
                anchors.fill: parent
                onClicked: game.currentScene = ropeScene
            }
        }
        */
    }
}

