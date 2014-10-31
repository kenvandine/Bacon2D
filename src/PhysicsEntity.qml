import QtQuick 2.0
import Bacon2D 1.0

Entity {
    id: item

    transformOrigin: Item.TopLeft
    property alias body: itemBody

    // Body properties
    property alias world: itemBody.world
    property alias target: itemBody.target

    property alias linearDamping: itemBody.linearDamping
    property alias angularDamping: itemBody.angularDamping
    property alias angularVelocity: itemBody.angularVelocity
    property alias linearVelocity: itemBody.linearVelocity
    property alias bodyType: itemBody.bodyType
    property alias active: itemBody.active
    property alias gravityScale: itemBody.gravityScale
    property alias bullet: itemBody.bullet
    property alias sleepingAllowed: itemBody.sleepingAllowed
    property alias fixedRotation: itemBody.fixedRotation
    property alias awake: itemBody.awake
    property alias fixtures: itemBody.fixtures

    function applyForce(force, point) {
        itemBody.applyForce(force, point);
    }

    function applyForceToCenter(force) {
        itemBody.applyForceToCenter(force);
    }

    function applyTorque(torque) {
        itemBody.applyTorque(torque);
    }

    function applyLinearImpulse(impulse, point) {
        itemBody.applyLinearImpulse(impulse, point);
    }

    function applyAngularImpulse(impulse) {
        itemBody.applyAngularImpulse(impulse);
    }

    function getWorldCenter() {
        return itemBody.getWorldCenter();
    }

    function getWorldCenter() {
        return itemBody.getLocalCenter();
    }

    function getMass() {
        return itemBody.getMass();
    }

    function resetMassData() {
        return itemBody.resetMassData();
    }

    function getInertia() {
        return itemBody.getInertia();
    }

    function toWorldPoint(localPoint) {
        return itemBody.toWorldPoint(localPoint);
    }

    function toWorldVector(localVector) {
        return itemBody.FIXME();
    }

    function toLocalPoint(worldPoint) {
        return itemBody.toLocalPoint(worldPoint);
    }

    function toLocalVector(worldVector) {
        return itemBody.toLocalVector(worldVector);
    }

    function getLinearVelocityFromWorldPoint(point) {
        return itemBody.getLinearVelocityFromWorldPoint(point);
    }

    function getLinearVelocityFromLocalPoint(point) {
        return itemBody.getLinearVelocityFromLocalPoint(point);
    }

    signal bodyCreated()

    Body {
        id: itemBody
        world: scene.world
        target: item
        signal beginContact(Fixture other)
        signal endContact(Fixture other)
    }
}


