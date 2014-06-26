import QtQuick 2.2
import Bacon2D 1.0

Item {
    id: menu
    width: parent.width
    height: parent.height

    property int bigFontSize: 36

    FontLoader { id: dPuntillasFont; source: "fonts/d-puntillas-D-to-tiptoe.ttf" }

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Column {
        anchors.fill: parent

        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: bigFontSize
            text: "Cannon"
            onClicked: game.currentScene = cannonScene
        }

        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: bigFontSize
            text: "Rope"
            onClicked: game.currentScene = ropeScene
        }

        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: bigFontSize
            text: "Parallax"
            onClicked: game.currentScene = parallaxScene
        }

        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: bigFontSize
            text: "Behaviors"
            onClicked: game.currentScene = behaviorScene
        }

        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: bigFontSize
            text: "Car"
            onClicked: game.currentScene = carScene
        }
        MenuButton {
            anchors.horizontalCenter: parent.horizontalCenter
            height: bigFontSize
            text: "Viewport"
            onClicked: game.currentScene = viewportScene
        }
    }
}
