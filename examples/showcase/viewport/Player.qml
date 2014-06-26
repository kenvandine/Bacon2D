import QtQuick 2.2
import Bacon2D 1.0

Entity {
    width: 72
    height: 97
    updateInterval: 20

    property int hstep: 0
    property int vstep: 0
    property bool alive: true
    property bool movingRight: true
    property bool movingDown: true
    property string player: "p1"

    behavior: ScriptBehavior {
        script: {
            if (alive) {
                if (hstep > 0) {
                    var newX;
                    if (!movingRight) {
                        newX = (entity.x - entity.hstep);
                        if (newX < scene.x) {
                            entity.x = scene.x;
                            movingRight = true;
                        } else {
                            entity.x = newX;
                        }
                    }
                    else {
                        newX = (entity.x + entity.hstep);
                        if (newX > (scene.width - entity.width)) {
                            entity.x = scene.width - entity.width;
                            movingRight = false;
                        } else {
                            entity.x = newX;
                        }
                    }
                }
                if (vstep > 0) {
                    var newY;
                    if (!movingDown) {
                        newY = (entity.y - entity.vstep);
                        if (newY < scene.y) {
                            entity.y = scene.y;
                            movingDown = true;
                        } else {
                            entity.y = newY;
                        }
                    }
                    else {
                        newY = (entity.y + entity.vstep);
                        if (newY > (scene.height - entity.height)) {
                            entity.y = scene.height - entity.height;
                            movingDown = false;
                        } else {
                            entity.y = newY;
                        }
                    }
                }
            }
        }
    }
    Sprite {
        id: sprite
        anchors.fill: parent
        horizontalMirror: !movingRight
        animation: "walking"
        animations: [
            SpriteAnimation {
                name: "walking"
                source: "images/"+player+"_walking.png"
                frames: 11
                duration: 4000
                running: scene.running && alive
                loops: Animation.Infinite
            }]
    }

    MouseArea {
        anchors.fill: parent
        onClicked: alive = !alive
    }
}
