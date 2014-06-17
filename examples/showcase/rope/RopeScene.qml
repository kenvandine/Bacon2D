import QtQuick 2.2
import Bacon2D 1.0
import QtQuick.Controls 1.1

Scene {
    id: ropeScene
    anchors.fill: parent
    physics: true

    onInitialized: {
        var prev = leftWall;
        for(var i = 60;i < 740;i += 20) {
            var newLink = linkComponent.createObject(ropeScene.world);
            newLink.color = "orange";
        newLink.x = i;
            newLink.y = 100;
            var newJoint = jointComponent.createObject(ropeScene.world);
            if(i === 60) newJoint.localAnchorA = Qt.point(40,100);
            newJoint.bodyA = prev;
            newJoint.bodyB = newLink;
            prev = newLink;
        }
        newJoint = jointComponent.createObject(ropeScene.world);
        newJoint.localAnchorB = Qt.point(0,100);
        newJoint.bodyA = prev;
        newJoint.bodyB = rightWall;
    }

    Row {
        id: controls
        x: 50
        y: 60
        spacing: 10
        Slider {
            id: lengthSlider
            width: 100
            height: 50
            maximumValue: 50
            minimumValue: 20
            value: 30
        }
    }

    Component {
        id: linkComponent
        Entity {
            width: 20
            height:20
            sleepingAllowed: true
			bodyType: Entity.Dynamic;
            property color color: "#EFEFEF"
            fixtures: Circle {
                radius: parent.width / 2
                anchors.centerIn: parent
                density: 0.5
            }
            Rectangle {
                radius: parent.width / 2
                border.color: "blue"
                color: parent.color
                width: parent.width
                height: parent.height
                smooth: true
            }
        }
    }

    Component {
        id: jointComponent
        RopeJoint {
            localAnchorA: Qt.point(10,10)
            localAnchorB: Qt.point(10,10)
            maxLength: lengthSlider.value
            collideConnected: true
        }
    }

    Wall {
        id: ground
        height: 40
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

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

    Timer {
        id: ballsTimer
        interval: 500
        running: ropeScene.running
        repeat: true
        onTriggered: {
            var newBox = linkComponent.createObject(ropeScene.world);
            newBox.x = 40 + (Math.random() * ropeScene.width - 80);
            newBox.y = 50;
        }
    }
}
