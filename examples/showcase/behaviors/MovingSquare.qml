import QtQuick 2.2
import Bacon2D 1.0

Entity {
    width: parent.width
    height: parent.height
    updateInterval: 20

    property string color
    property int hstep: 0
    property int vstep: 0
    property bool alive: true

    behavior: ScriptBehavior {
        script: {
            if (alive) {
                var newX = (entity.x + entity.hstep);
                var newY = (entity.y + entity.vstep);

                if (hstep < 0)
                    entity.x = (newX < -entity.width) ? scene.width : newX;
                else if (hstep > 0)
                    entity.x = (newX > scene.width) ? -entity.width : newX;

                if (vstep < 0)
                    entity.y = (newY < -entity.height) ? scene.height : newY;
                else if (vstep > 0)
                    entity.y = (newY > scene.height) ? -entity.height : newY;
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: parent.color
    }
    MouseArea {
        anchors.fill: parent
        onClicked: alive = !alive
    }
}
