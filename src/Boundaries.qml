import QtQuick 2.0
import Bacon2D 1.0

/*
  This body places 2-pixel wide invisible static bodies around the screen,
  to avoid stuff getting out.
*/

Entity {
    id: item

    transformOrigin: Item.TopLeft
    property alias body: itemBody

    // Body properties
    property alias world: itemBody.world

    // Fixture properties
    property alias density: itemBody.density
    property alias friction: itemBody.friction
    property alias restitution: itemBody.restitution
    property alias sensor: itemBody.sensor
    property alias groupIndex: itemBody.groupIndex
    property alias categories: itemBody.categories

    Body {
        id: itemBody
        world: scene.world
        target: item
        bodyType: Body.Static
        property real density
        property real friction
        property real restitution
        property bool sensor
        property int groupIndex: 1
        property int categories: Fixture.Category1
        
        signal beginContact(Fixture other)
        signal endContact(Fixture other)

        Box {
            x: item.parent.x
            y: item.parent.y + item.parent.height
            width: item.parent.width
            height: 2
            density: itemBody.density
            friction: itemBody.friction
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            groupIndex: itemBody.groupIndex
            categories: itemBody.categories
        }
        Box {
            x: item.parent.x
            y: item.parent.y - height
            height: 2
            width: item.parent.width
            density: itemBody.density
            friction: itemBody.friction
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            groupIndex: itemBody.groupIndex
            categories: itemBody.categories
        }
        Box {
            x: item.parent.x - width
            y: item.parent.y
            width: 2
            height: item.parent.height
            density: itemBody.density
            friction: itemBody.friction
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            groupIndex: itemBody.groupIndex
            categories: itemBody.categories
        }
        Box {
            x: item.parent.x + item.parent.width
            y: item.parent.y
            width: 2
            height: item.parent.height
            density: itemBody.density
            friction: itemBody.friction
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            groupIndex: itemBody.groupIndex
            categories: itemBody.categories
        }
    }
}
