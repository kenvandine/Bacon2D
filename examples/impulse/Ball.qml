import QtQuick 2.2
import Bacon2D 1.0

Entity {
    id: ent
    bodyType: Body.Dynamic
    fixedRotation: false

    fixtures: Circle {
        id: circle
        radius: ent.width / 2
        density: 1;
        friction: 1;
        restitution: 0.5;
    }

    Rectangle {
        id: itemShape
        anchors.fill: parent
        color: "green"
        radius: parent.width / 2
    }
}
