import QtQuick 2.2
import Bacon2D 1.0
import "cannon"
import "rope"
import "parallax"
import "behaviors"
import "car"
import "viewport"

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
            Column {
                anchors.centerIn: parent
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                    radius: 5
                    height: 200
                    width: 300

                    Image {
                        anchors.centerIn: parent
                        height: 200
                        fillMode: Image.PreserveAspectFit
                        //source: "images/pig-big.png"
                        source: "images/bacon2d-logo-1.png"
                    }
                }

                /*
                MenuButton {
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 128
                    text: "Bacon2D"
                }
                */
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

        ViewportScene {
            id: viewportScene
        }
    }

    Row {
        anchors {
            top: root.top
            topMargin: 5
            right: root.right
            rightMargin: 5
        }
        height: 30
        width: childrenRect.width
        visible: game.currentScene !== undefined
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

    Menu {
        id: menu
        width: 200
        height: parent.height
    }
}
