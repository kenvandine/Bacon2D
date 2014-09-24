import QtQuick 2.2
import Bacon2D 1.0

Entity {
    ImageBoxBody {
        anchors.fill: parent
        source: "images/wall.jpg"
        fillMode: Image.Tile
 
        world: scene.world

        friction: 1
        density: 1
    }
}
