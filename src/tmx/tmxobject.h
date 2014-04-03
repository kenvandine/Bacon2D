#ifndef TMXOBJECT_H
#define TMXOBJECT_H

#include <libtiled/object.h>
#include <libtiled/properties.h>

#include <QtCore/QMap>
#include <QtCore/QObject>
#include <QtCore/QString>

class TMXObject : public QObject
{
    Q_OBJECT

public:
    explicit TMXObject(Tiled::Object *tiledObject, QObject *parent = 0)
        : QObject(parent), m_tiledObject(tiledObject) {}

    Tiled::Object *tiledObject() { return m_tiledObject; }
    void setTiledObject(Tiled::Object *tiledObject) { m_tiledObject = tiledObject; }

    QString property(const QString &name) const { return m_tiledObject->property(name); }
    void setProperty(const QString &name, const QString &value) { m_tiledObject->setProperty(name, value); }

private:
    Tiled::Object *m_tiledObject;
};

#endif // TMXOBJECT_H
