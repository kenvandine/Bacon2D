import QtQuick 2.0
import Bacon2D 1.0

/*
  This body places 32-pixel wide invisible static bodies around the screen,
  to avoid stuff getting out.
*/

Entity {
    id: item

    property variant screen: scene
    transformOrigin: Item.TopLeft
    property alias body: itemBody

    // Body properties
    property alias world: itemBody.world
    property alias linearDamping: itemBody.linearDamping
    property alias angularDamping: itemBody.angularDamping
    property alias bodyType: itemBody.bodyType
    property alias bullet: itemBody.bullet
    property alias sleepingAllowed: itemBody.sleepingAllowed
    property alias fixedRotation: itemBody.fixedRotation
    property alias active: itemBody.active
    property alias awake: itemBody.awake
    property alias linearVelocity: itemBody.linearVelocity
    property alias angularVelocity: itemBody.angularVelocity
    property alias fixtures: itemBody.fixtures
    property alias gravityScale: itemBody.gravityScale


    Body {
        id: itemBody
        world: scene.world
        target: item
        signal beginContact(Fixture other)
        signal endContact(Fixture other)

        Box {
            y: screen.height
            width: screen.width
            height: 32
        }
        Box {
            y: -32
            height: 32
            width: screen.width
        }
        Box {
            x: -32
            width: 32
            height: screen.height
        }
        Box {
            x: screen.width
            width: 32
            height: screen.height
        }
    }
}
