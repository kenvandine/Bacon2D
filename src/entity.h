/**
 * Copyright (C) 2012 by INdT
 * Copyright (C) 2014 Bacon2D Project
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 * @author Rodrigo Goncalves de Oliveira <rodrigo.goncalves@openbossa.org>
 * @author Roger Felipe Zanoni da Silva <roger.zanoni@openbossa.org>
 */

#ifndef _ENTITY_H_
#define _ENTITY_H_

#include "box2dbody.h"

#include <QtCore/QtGlobal>
#include <QtCore/QTime>
#include <QtQuick/QQuickItem>

class Game;
class Scene;
class Behavior;

class Entity : public QQuickItem
{
    Q_OBJECT

    Q_ENUMS(BodyType)
    Q_PROPERTY(int updateInterval READ updateInterval WRITE setUpdateInterval NOTIFY updateIntervalChanged)
    Q_PROPERTY(Game *game READ game)
    Q_PROPERTY(Behavior *behavior READ behavior WRITE setBehavior NOTIFY behaviorChanged)
    Q_PROPERTY(Box2DBody *body READ body)

    /* Box2DBody properties */
    Q_PROPERTY(float linearDamping READ linearDamping WRITE setLinearDamping NOTIFY linearDampingChanged)
    Q_PROPERTY(float angularDamping READ angularDamping WRITE setAngularDamping NOTIFY angularDampingChanged)
    Q_PROPERTY(BodyType bodyType READ bodyType WRITE setBodyType NOTIFY bodyTypeChanged)
    Q_PROPERTY(bool bullet READ isBullet WRITE setBullet NOTIFY bulletChanged)
    Q_PROPERTY(bool sleepingAllowed READ sleepingAllowed WRITE setSleepingAllowed NOTIFY sleepingAllowedChanged)
    Q_PROPERTY(bool fixedRotation READ fixedRotation WRITE setFixedRotation NOTIFY fixedRotationChanged)
    Q_PROPERTY(bool active READ isActive WRITE setActive)
    Q_PROPERTY(bool awake READ isAwake WRITE setAwake)
    Q_PROPERTY(QPointF linearVelocity READ linearVelocity WRITE setLinearVelocity NOTIFY linearVelocityChanged)
    Q_PROPERTY(float angularVelocity READ angularVelocity WRITE setAngularVelocity NOTIFY angularVelocityChanged)
    Q_PROPERTY(QQmlListProperty<Box2DFixture> fixtures READ fixtures)
    Q_PROPERTY(float gravityScale READ gravityScale WRITE setGravityScale NOTIFY gravityScaleChanged)


public:
    enum BodyType {
        Static = 0,
        Kinematic,
        Dynamic
    };

    Entity(Scene *parent = 0);
    ~Entity();

    int updateInterval() const;
    void setUpdateInterval(const int &updateInterval);

    Scene *scene() const;
    void setScene(Scene *scene);

    Game *game() const;

    Behavior *behavior() const;
    void setBehavior(Behavior *behavior);

    Box2DBody *body() const;

    virtual void update(const int &delta);

    void initialize(Box2DWorld *world);


    /* Box2DBody functions */
    float linearDamping() const;
    void setLinearDamping(float linearDamping);

    float angularDamping() const;
    void setAngularDamping(float angularDamping);

    BodyType bodyType() const;
    void setBodyType(BodyType bodyType);

    bool isBullet() const;
    void setBullet(bool bullet);

    bool sleepingAllowed() const;
    void setSleepingAllowed(bool sleepingAllowed);

    bool fixedRotation() const;
    void setFixedRotation(bool fixedRotation);

    bool isActive() const;
    void setActive(bool active);

    bool isAwake() const;
    void setAwake(bool awake);

    QPointF linearVelocity() const;
    void setLinearVelocity(const QPointF &velocity);

    float angularVelocity() const;
    void setAngularVelocity(float velocity);

    float gravityScale() const;
    void setGravityScale(float gravityScale);

    QQmlListProperty<Box2DFixture> fixtures();

    Q_INVOKABLE void applyForce(const QPointF &force, const QPointF &point);
    Q_INVOKABLE void applyForceToCenter(const QPointF &force);
    Q_INVOKABLE void applyTorque(qreal torque);
    Q_INVOKABLE void applyLinearImpulse(const QPointF &impulse, const QPointF &point);
    Q_INVOKABLE void applyAngularImpulse(qreal impulse);
    Q_INVOKABLE QPointF getWorldCenter() const;
    Q_INVOKABLE QPointF getLocalCenter() const;
    Q_INVOKABLE float getMass() const;
    Q_INVOKABLE void resetMassData();
    Q_INVOKABLE float getInertia() const;
    Q_INVOKABLE QPointF toWorldPoint(const QPointF &localPoint) const;
    Q_INVOKABLE QPointF toWorldVector(const QPointF &localVector) const;
    Q_INVOKABLE QPointF toLocalPoint(const QPointF &worldPoint) const;
    Q_INVOKABLE QPointF toLocalVector(const QPointF &worldVector) const;
    Q_INVOKABLE QPointF getLinearVelocityFromWorldPoint(const QPointF &point) const;
    Q_INVOKABLE QPointF getLinearVelocityFromLocalPoint(const QPointF &point) const;
    Q_INVOKABLE void addFixture(Box2DFixture *fixture);


signals:
    void updateIntervalChanged();
    void behaviorChanged();

    /* Box2DBody signals */
    void linearDampingChanged();
    void angularDampingChanged();
    void bodyTypeChanged();
    void bulletChanged();
    void sleepingAllowedChanged();
    void fixedRotationChanged();
    void linearVelocityChanged();
    void angularVelocityChanged();
    void gravityScaleChanged();
    void positionChanged();


protected:
    virtual void componentComplete();
    virtual void itemChange(ItemChange change, const ItemChangeData &data);
    void initializeEntities(QQuickItem *parent);

private:
    int m_updateInterval;
    QTime m_updateTime;
    Scene *m_scene;
    Behavior *m_behavior;
    Box2DBody *m_body;
};

/*
inline Entity::BodyType Entity::bodyType() const
{
    return static_cast<Entity::BodyType>(m_body->bodyType());
}
*/


#endif /* _ENTITY_H_ */
