import QtQuick 2.2
import Bacon2D 1.0
import QtQuick.Controls 1.1


Scene {
    id: scene
    anchors.fill: parent
    physics: true

    Wall {
        id: topWall
        height: 40
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
    }

    Wall {
        id: leftWall
        width: 40
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            bottomMargin: 40
        }
    }

    Wall {
        id: rightWall
        width: 40
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            bottomMargin: 40
        }
    }

    Entity {
        id: ground
        height: 40
        bodyType: Entity.Static
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        fixtures: Box {
            anchors.fill: parent
            friction: 1
            density: 1
        }
        Rectangle {
            anchors.fill: parent
            color: "#AAA"
        }
    }

    Entity {
        id: ramp
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        bodyType: Entity.Static
        width: 300
        height: 30
        fixtures: Polygon {
            vertices: [
                Qt.point(0,30),
                Qt.point(150,0),
                Qt.point(300,30),
                Qt.point(0,30)
            ]
        }
        Canvas {
            id: canvas1
            anchors.fill: parent
            onPaint: {
                var context = canvas1.getContext("2d");
                context.moveTo(0,30);
                context.beginPath();
                context.lineTo(150,0);
                context.lineTo(300,30);
                context.lineTo(0,30);
                context.fillStyle = "#AAA";
                context.fill();
            }
        }
    }

    Entity {
        id: body
        property int speed: 0
        property int k: -1
        x: 600
        y: 520
        width: 180
        height: 40
        bodyType: Entity.Dynamic
        fixtures: Box {
            anchors.fill: parent
            density: 0.8
            friction: 0.5
            restitution: 0.8
        }
        Rectangle {
            anchors.fill: parent
            color: "orange"
        }
    }

    Entity {
        id: wheelA
        x: 720
        y: 520
        width: 48
        height: 48
        bodyType: Entity.Dynamic
        fixtures: Circle {
            radius: parent.width / 2
            anchors.fill: parent
            density: 0.8
            friction: 10
            restitution: 0.1
        }
        Image {
            source: "images/wheel.png"
            anchors.fill: parent
        }
    }

    Entity {
        id: wheelB
        x: 600
        y: 520
        width: 48
        height: 48
        bodyType: Entity.Dynamic
        fixtures: Circle {
            radius: parent.width / 2
            anchors.fill: parent
            density: 0.8
            friction: 10
            restitution: 0.1
        }
        Image {
            source: "images/wheel.png"
            anchors.fill: parent
        }
    }

    WheelJoint {
        id: wheelJointA
        bodyA: body
        bodyB: wheelA
        localAnchorA: Qt.point(150,30)
        localAnchorB: Qt.point(24,24)
        enableMotor: true
        motorSpeed: body.k * body.speed
        maxMotorTorque: torqueSlider.value
        frequencyHz: 10
    }

    WheelJoint {
        id: wheelJointB
        bodyA: body
        bodyB: wheelB
        localAnchorA: Qt.point(40,30)
        localAnchorB: Qt.point(24,24)
        enableMotor: true
        motorSpeed: body.k * body.speed
        maxMotorTorque: torqueSlider.value
        frequencyHz: 10
    }

    Text {
        id: leftMotorState
        x: 180
        y: 50
        width: 200
        text : "Speed: " + speedSlider.value +
               "\nTorque: " + torqueSlider.value
    }

    Slider {
        id: speedSlider
        x: 50
        y: 90
        width: 120
        height: 20
        minimumValue: 0
        maximumValue: 720
        value: 0
        stepSize: 1
        onValueChanged: {
            body.speed = speedSlider.value;
        }
    }

    Slider {
        id: torqueSlider
        x: 50
        y: 120
        width: 120
        height: 20
        minimumValue: 1
        maximumValue: 100
        value: 50
        stepSize: 1
    }

    Rectangle {
        id: leftButton
        x: 50
        y: 150
        width: 30
        height: 30
        color: (body.k > 0 ? "#FFF" : "#DEDEDE")
        border.color: "#999"
        radius: 5
        Image {
            width: 24
            height: 24
            anchors.centerIn: parent
            source: "images/arrow.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    body.k = -1
                }
            }
        }
    }

    Rectangle {
        id: rightButton
        x: 90
        y: 150
        width: 30
        height: 30
        color: (body.k < 0 ? "#FFF" : "#DEDEDE")
        border.color: "#999"
        radius: 5
        Image {
            width: 24
            height: 24
            anchors.centerIn: parent
            source: "images/arrow.png"
            rotation: 180
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    body.k = 1
                }
            }
        }
    }
}
