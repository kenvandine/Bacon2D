import QtQuick 2.2
import Bacon2D 1.0

Entity {
    id: ent
    transformOrigin: Item.TopLeft
    CircleBody {
        bodyType: Body.Dynamic
        density: 1
        friction: 1
        restitution: 0.5
        radius: ent.width / 2
    }

    /*
    Body {
        fixedRotation: false
        sleepingAllowed: false
        bodyType: Body.Dynamic
        property alias x: circle.x
        property alias y: circle.y
        property alias radius: circle.radius

        Circle {
            id: circle

            radius: ent.width / 2
            density: 1;
            friction: 1;
            restitution: 0.5;
        }
    }
    */
    
    Rectangle {
        id: itemShape
        anchors.fill: parent
        color: "green"
        radius: parent.width / 2
    }
}
