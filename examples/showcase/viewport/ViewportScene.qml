import QtQuick 2.2
import Bacon2D 1.0

Scene {
    id: scene
    height: parent.height * 1.5
    width: parent.width * 1.5
    viewport: Viewport {
        xOffset: red.x - 100
        yOffset: blue.y - 100
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Image {
        anchors.fill: parent
        source: "images/stars.png"
        fillMode: Image.Tile
    }

    Player {
        id: red
        y: parent.height / 2
        player: "p1"
        hstep: 5
    }

    Player {
        id:  blue
        y: parent.height / 2
        x: parent.width/2
        player: "p2"
        vstep: 5
    }
}
