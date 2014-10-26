import QtQuick 2.0
import Bacon2D 1.0

Entity {
    id: item

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
    }
}


/*!
  \qmlproperty enumeration PhysicsEntity::bodyType
  \brief This property holds the current body type.
  \table
   \header
     \li {2, 1} \e {Body::BodyType} is an enumeration:
   \header
     \li Type
     \li Description
   \row
     \li Body.Static (default)
     \li A static body does not move under simulation and behaves as if it has infinite mass. Internally, Box2D
         stores zero for the mass and the inverse mass. Static bodies can be moved manually by the user. A static
         body has zero velocity. Static bodies do not collide with other static or kinematic bodies.
   \row
     \li Body.Kinematic
     \li A kinematic body moves under simulation according to its velocity. Kinematic bodies do not respond to
         forces. They can be moved manually by the user, but normally a kinematic body is moved by setting its
         velocity. A kinematic body behaves as if it has infinite mass, however, Box2D stores zero for the mass
         and the inverse mass. Kinematic bodies do not collide with other kinematic or static bodies.
   \row
     \li Body.Dynamic
     \li A dynamic body is fully simulated. They can be moved manually by the user, but normally they move
         according to forces. A dynamic body can collide with all body types. A dynamic body always has finite,
         non-zero mass. If you try to set the mass of a dynamic body to zero, it will automatically acquire a mass
         of one kilogram and it won’t rotate.
  \endtable
*/

/*!
  \qmlproperty float PhysicsEntity::gravityScale
  \brief This property represents the scale to adjust the gravity on
   a single entity.
*/
/*!
  \qmlproperty float PhysicsEntity::linearDamping
  \brief This property is used to reduce the linear velocity.  The damping
   parameter can be larger than 1.0f but the damping effect becomes sensitive
   to the time step when the damping parameter is large.
*/
/*!
  \qmlproperty float PhysicsEntity::angularDamping
  \brief This property is used to reduce the angular velocity. The damping
   parameter can be larger than 1.0f but the damping effect becomes sensitive
   to the time step when the damping parameter is large.
*/
/*!
  \qmlproperty float PhysicsEntity::angularVelocity
  \brief This property holds the angular velocity of the entity.
*/
/*!
  \qmlproperty QPointF PhysicsEntity::linearVelocity
  \brief This property holds the linear velocity of the entity's origin
   in world co-ordinates.
*/
/*!
  \qmlproperty bool PhysicsEntity::bullet
  \brief Game simulation usually generates a sequence of images that are played at some frame rate. This is
   called discrete simulation. In discrete simulation, rigid bodies can move by a large amount in one
   time step. If a physics engine doesn't account for the large motion, you may see some objects incorrectly pass
   through each other. This effect is called tunneling.

   By default, Box2D uses continuous collision detection (CCD) to prevent dynamic bodies from tunneling
   through static bodies. This is done by sweeping shapes from their old position to their new positions.
   The engine looks for new collisions during the sweep and computes the time of impact (TOI) for these
   collisions. Bodies are moved to their first TOI and then the solver performs a sub-step to complete the
   full time step. There may be additional TOI events within a sub-step.

   Normally CCD is not used between dynamic bodies. This is done to keep performance reasonable. In
   some game scenarios you need dynamic bodies to use CCD. For example, you may want to shoot a high
   speed bullet at a stack of dynamic bricks. Without CCD, the bullet might tunnel through the bricks.
   Fast moving objects in Box2D can be labeled as bullets. Bullets will perform CCD with both static and
   dynamic bodies. You should decide what bodies should be bullets based on your game design.
*/

/*!
  \qmlproperty bool PhysicsEntity::sleepingAllowed
  \brief What does sleep mean? Well it is expensive to simulate bodies, so the less we have to simulate the
   better. When a body comes to rest we would like to stop simulating it.

   When Box2D determines that a body (or group of bodies) has come to rest, the body enters a sleep
   state which has very little CPU overhead. If a body is awake and collides with a sleeping body, then the
   sleeping body wakes up. Bodies will also wake up if a joint or contact attached to them is destroyed. You
   can also wake a body manually.

   The sleepingAllowed property lets you specify whether a body can sleep and whether a body is created sleeping.
*/
/*!
  \qmlproperty bool PhysicsEntity::fixedRotation
  \brief You may want a rigid body, such as a character, to have a fixed rotation. Such a body should not rotate,
   even under load. You can use the fixedRotation property to achieve this.
*/

/*!
  \qmlproperty bool PhysicsEntity::active
  \brief Returns true if the PhysicsEntity is active, or False if it is sleeping
*/

/*!
  \qmlproperty bool PhysicsEntity::awake
  \brief Returns True if the PhysicsEntity is awake, or False if it is sleeping.
*/

/*!
  \qmlproperty list<Fixture> PhysicsEntity::fixtures
  \brief This property holds a list of Box2D fixtures contained within the current PhysicsEntity.
*/

/*!
  \qmlmethod void PhysicsEntity::applyForce(const QPointF force, const QPointF point)
*/

/*!
  \qmlmethod void PhysicsEntity::applyForceToCenter(const QPointF &force)
*/

/*!
  \qmlmethod void PhysicsEntity::applyTorque(qreal torque)
*/

/*!
  \qmlmethod void PhysicsEntity::applyLinearImpulse(const QPointF &impulse, const QPointF &point)
*/

/*!
  \qmlmethod void PhysicsEntity::applyAngularImpulse(qreal impulse)
*/

/*!
  \qmlmethod QPointF PhysicsEntity::getWorldCenter() const
*/

/*!
  \qmlmethod QPointF PhysicsEntity::getLocalCenter() const
*/

/*!
  \qmlmethod float PhysicsEntity::getMass() const
*/

/*!
  \qmlmethod float PhysicsEntity::resetMassData()
*/

/*!
  \qmlmethod float PhysicsEntity::getInertia() const
*/

/*!
  \qmlmethod QPointF PhysicsEntity::toWorldPoint(const QPointF &localPoint) const
*/

/*!
  \qmlmethod QPointF PhysicsEntity::toWorldVector(const QPointF &localVector) const
*/

/*!
  \qmlmethod QPointF PhysicsEntity::toLocalPoint(const QPointF &worldPoint) const
*/

/*!
  \qmlmethod QPointF PhysicsEntity::toLocalVector(const QPointF &worldVector) const
*/

/*!
  \qmlmethod QPointF PhysicsEntity::getLinearVelocityFromWorldPoint(const QPointF &point) const
*/

/*!
  \qmlmethod QPointF PhysicsEntity::getLinearVelocityFromLocalPoint(const QPointF &point) const
*/

/*!
  \qmlsignal void PhysicsEntity::bodyCreated()
  \brief Emitted when the Box2D body has finished initialization
*/