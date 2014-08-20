import QtQuick 2.2
import Bacon2D 1.0

Entity {
    body.bodyType: Body.Static
    body.fixtures: Box { anchors.fill: parent }
    Component.onCompleted: {
        print ("BODY: " + body.world);
    }
}
