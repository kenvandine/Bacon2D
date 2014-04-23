#include "settings.h"


Settings::Settings(QObject *parent) : QSettings(QSettings::UserScope,
    QCoreApplication::instance()->organizationName(), QCoreApplication::instance()->applicationName(), parent = 0)
{
}
/*
Settings::Settings(const QString &organization, const QString &application, QObject *parent)
{
    QSettings m_settings(organization, application, parent);
}
*/

QVariant Settings::value(const QString &key)
{
    return m_settings->value(key);
}

void Settings::setValue(const QString &key, const QVariant &value)
{
    m_settings->setValue(key, value);
    emit settingChanged(key);
}

