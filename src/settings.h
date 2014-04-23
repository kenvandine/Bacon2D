#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
#include <QCoreApplication>

class Settings : public QSettings
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = 0) : QSettings(QSettings::UserScope,
    QCoreApplication::instance()->organizationName(), QCoreApplication::instance()->applicationName(), parent)    {}

    Q_INVOKABLE inline void setValue(const QString &key, const QVariant &value) { QSettings::setValue(key, value); emit settingChanged(key);}
    Q_INVOKABLE inline QVariant value(const QString &key, const QVariant &defaultValue = QVariant()) const { return QSettings::value(key, defaultValue); }

signals:
    void settingChanged(const QString& key);
};
#endif // SETTINGS_H
