include(../../vreen.pri)
include(../../vreencore.pri)

QT += network qml

DEFINES += VREEN_WITH_OAUTH

INCLUDEPATH += ../../include/vreen
INCLUDEPATH += ../../include/vreen/oauth

TARGET = vreenplugin

LIBS += -lvreen -lvreenoauth

CONFIG(debug, debug|release) {
    BUILD = debug

    win32 {
        TARGET = $$member(TARGET, 0)d
    }
    macx {
        TARGET = $$member(TARGET, 0)_debug
    }
} else {
    BUILD = release
}

DESTDIR = $$VREEN_LIBS_DIR/Vreen/Base
OBJECTS_DIR = $$BUILD/.obj
MOC_DIR = $$BUILD/.moc
RCC_DIR = $$BUILD/.qrc
UI_DIR = $$BUILD/.ui

TEMPLATE = lib
CONFIG += plugin

HEADERS += \
    src/*.h

SOURCES += \
    src/*.cpp

OTHER_FILES += \
    qmldir/*

QMAKE_POST_LINK += $$quote($(COPY) $$toNativeSeparators($$PWD/qmldir/*) $$toNativeSeparators($$VREEN_LIBS_DIR/Vreen/Base)$$escape_expand(\n\t))
