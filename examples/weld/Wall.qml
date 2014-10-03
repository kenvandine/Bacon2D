import QtQuick 2.2
import Bacon2D 1.0

Entity {
    bodyType: Body.Static
    fixtures: Box {
        friction: 1
        density: 1
    }
    Image {
        source: "images/wall.jpg"
        fillMode: Image.Tile
        anchors.fill: parent
    }
}
