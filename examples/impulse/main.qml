import QtQuick 2.2
import Bacon2D 1.0

Game {
    id: game
    width: 800
    height: 600
    focus: true
    currentScene: scene

    Scene {
        id: scene
        anchors.fill: parent
        physics: true

        ScreenBoundaries {}

        Ball {
            id: ball
            x: parent.width /2
            y: parent.height /2
            rotation: 0
            width: 100
            height: 100
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                ball.body.applyLinearImpulse(
                    Qt.point((mouseX - ball.x),
                             (mouseY - ball.y)),
                    Qt.point(ball.x, ball.y))
            }
        }

        Rectangle {
            id: debugButton
            x: 50
            y: 10
            width: 120
            height: 30
            Text {
                id: debugButtonText
                text: scene.debug ? "Debug view: on" : "Debug view: off"
                anchors.centerIn: parent
            }
            color: "#DEDEDE"
            border.color: "#999"
            radius: 5
            MouseArea {
                anchors.fill: parent
                onClicked: scene.debug = !scene.debug
            }
        }
    }
}

