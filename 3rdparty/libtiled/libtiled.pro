CONFIG += static
OBJECTS_DIR = .obj

TEMPLATE = lib
TARGET = tiled
LIBS += -lz

DEFINES += QT_NO_CAST_FROM_ASCII \
    QT_NO_CAST_TO_ASCII
DEFINES += TILED_LIBRARY
contains(QT_CONFIG, reduce_exports): CONFIG += hide_symbols

SOURCES += compression.cpp \
    gidmapper.cpp \
    imagelayer.cpp \
    isometricrenderer.cpp \
    layer.cpp \
    map.cpp \
    mapobject.cpp \
    mapreader.cpp \
    maprenderer.cpp \
    mapwriter.cpp \
    objectgroup.cpp \
    orthogonalrenderer.cpp \
    properties.cpp \
    staggeredrenderer.cpp \
    tile.cpp \
    tilelayer.cpp \
    tileset.cpp
HEADERS += compression.h \
    gidmapper.h \
    imagelayer.h \
    isometricrenderer.h \
    layer.h \
    map.h \
    mapobject.h \
    mapreader.h \
    mapreaderinterface.h \
    maprenderer.h \
    mapwriter.h \
    mapwriterinterface.h \
    object.h \
    objectgroup.h \
    orthogonalrenderer.h \
    properties.h \
    staggeredrenderer.h \
    terrain.h \
    tile.h \
    tiled.h \
    tiled_global.h \
    tilelayer.h \
    tileset.h \
    logginginterface.h
