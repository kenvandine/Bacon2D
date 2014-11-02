TEMPLATE = lib
CONFIG += qt plugin

QT += quick

TARGET = bacon2dplugin
TARGETPATH = Bacon2D

API_VER=1.0
DESTDIR = $$OUT_PWD/imports/Bacon2D

OBJECTS_DIR = tmp
MOC_DIR = tmp

DEPENDPATH += .
INCLUDEPATH += .
INCLUDEPATH += ../3rdparty/qml-box2d/

DEFINES += STATIC_PLUGIN_BOX2D
include(../3rdparty/qml-box2d/box2d-static.pri)

HEADERS += entity.h \
           scene.h \
           game.h \
           plugins.h \
           spritesheet.h \
           sprite.h \
           spriteanimation.h \
           animationtransition.h \
           animationchangeevent.h \
           layer.h \
           imagelayer.h \
           viewport.h \
           behavior.h \
           scriptbehavior.h \
           scrollbehavior.h \
           scrollbehaviorimpl.h \
           imagelayerscrollbehavior.h \
           layerscrollbehavior.h \
           settings.h

SOURCES += entity.cpp \
           scene.cpp \
           game.cpp \
           plugins.cpp \
           spritesheet.cpp \
           sprite.cpp \
           spriteanimation.cpp \
           animationtransition.cpp \
           layer.cpp \
           imagelayer.cpp \
           viewport.cpp \
           behavior.cpp \
           scriptbehavior.cpp \
           scrollbehavior.cpp \
           imagelayerscrollbehavior.cpp \
           layerscrollbehavior.cpp \
           settings.cpp

QMAKE_POST_LINK = $$QMAKE_COPY $$PWD/qmldir $$OUT_PWD/imports/Bacon2D

!isEmpty(QTPATH): target.path = $$QTPATH/imports/$$TARGETPATH
else: target.path = $$[QT_INSTALL_QML]/$$replace(TARGETPATH, \\., /).$$API_VER
;

qmltypes.path = $$target.path
qmltypes.extra = $$[QT_INSTALL_BINS]/qmlplugindump -notrelocatable Bacon2D $$API_VER $$OUT_PWD/imports  > $$OUT_PWD/imports/Bacon2D/plugins.qmltypes

QMLFILES += $$PWD/PhysicsEntity.qml \
            $$PWD/BoxBody.qml \
            $$PWD/ChainBody.qml \
            $$PWD/CircleBody.qml \
            $$PWD/EdgeBody.qml \
            $$PWD/ImageBoxBody.qml \
            $$PWD/PolygonBody.qml \
            $$PWD/ScreenBoundaries.qml \
            $$PWD/Boundaries.qml \
            $$PWD/RectangleBoxBody.qml \
            $$PWD/plugins.qmltypes \
            $$PWD/qmldir

qmlpluginfiles.path = $$target.path
qmlpluginfiles.files += \
    $$QMLFILES \
    $$OUT_PWD/imports/Bacon2D/*

INSTALLS += target qmltypes qmlpluginfiles
