import QtQuick 2.2
import Bacon2D 1.0

Entity {
    id: wall
    BoxBody {
        bodyType: Body.Static
        width: wall.width
        height: wall.height
    }
}
