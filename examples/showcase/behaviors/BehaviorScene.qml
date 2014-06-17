import QtQuick 2.2
import Bacon2D 1.0

Scene {
    id: scene
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    MovingSquare {
        width: 50
        height: 50
        y: parent.y + height
        color: "red"
        hstep: 5
    }

    MovingSquare {
        width: 50
        height: 50
        y: parent.y + (parent.height - (height * 2))
        color: "blue"
        hstep: -5

    }

    MovingSquare {
        width: 50
        height: 50
        x: parent.x + width
        color: "green"
        vstep: -5
    }

    MovingSquare {
        width: 50
        height: 50
        x: parent.x + (parent.width - (width * 2))
        color: "yellow"
        vstep: 5
    }
}
