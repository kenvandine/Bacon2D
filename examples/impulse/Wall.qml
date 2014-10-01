import QtQuick 2.2
import Bacon2D 1.0

Entity {
    id: wall
    bodyType: Body.Static
    fixtures: Box {
        width: wall.width
        height: wall.height
    }
}
