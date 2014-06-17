import QtQuick 2.2
import Bacon2D 1.0
import "cannon"
import "rope"
import "parallax"
import "behaviors"
import "car"

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
            MenuButton {
                anchors.centerIn: parent
                height: 128
                text: "Bacon2D"
            }
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

        BehaviorScene {
            id: behaviorScene
            anchors.fill: parent
        }

        CarScene {
            id: carScene
            anchors.fill: parent
        }

        Row {
            anchors {
                top: game.top
                topMargin: 5
                right: game.right
                rightMargin: 5
            }
            height: 30
            width: childrenRect.width
            spacing: 10
            MenuButton {
                width: !visible ? 0 : 130
                height: 32
                visible: game.currentScene.physics
                text: game.currentScene.debug ? "Debug: on" : "Debug: off"
                onClicked: game.currentScene.debug = !game.currentScene.debug
            }

            PlayButton {
                id: playButton
                paused: !game.currentScene.running
                width: 32
                height: 32
                onClicked: game.currentScene.running = !game.currentScene.running
            }
        }
    }

    Menu {
        id: menu
        width: 200
        height: parent.height
    }
}
