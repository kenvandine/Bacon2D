import QtQuick 2.2
import Bacon2D 1.0
import "cannon"
import "rope"
import "parallax"

Item {
    id: root
    width: 1024
    height: 600

    Game {
        id: game
        anchors.top: parent.top
        anchors.left: menu.right
        width: parent.width - menu.width
        height: parent.height

        Rectangle {
            anchors.fill: parent
            color: "black"
            visible: !game.currentScene || game.currentScene === parallaxScene
        }

        CannonScene {
            id: cannonScene
            anchors.fill: parent
        }

        RopeScene {
            id: ropeScene
            anchors.fill: parent
        }

        ParallaxScene {
            id: parallaxScene
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
        }

        MenuButton {
            anchors {
                top: game.top
                topMargin: 5
                right: game.right
                rightMargin: 5
            }
            width: 130
            height: 30
            visible: game.currentScene.physics
            text: game.currentScene.debug ? "Debug: on" : "Debug: off"
            onClicked: game.currentScene.debug = !game.currentScene.debug
        }


    }

    Menu {
        id: menu
        width: 200
        height: parent.height
    }
}
