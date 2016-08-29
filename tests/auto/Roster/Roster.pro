include(../../../vreen.pri)
include(../../../vreencore.pri)

QT += testlib network

TARGET = app

CONFIG -= app_bundle
CONFIG += console depend_includepath testcase
qtHaveModule(webkitwidgets) {
    QT += webkitwidgets
} else {
    QT += webengine webenginewidgets
    DEFINES += VREEN_WITH_WEBENGINE
}

INCLUDEPATH += ../../../include/vreen \
            ../..

SOURCES += \
        tst_roster.cpp

CONFIG(debug, debug|release) {
    BUILD = debug
    win32 {
        TARGET = $$member(TARGET, 0)d
        LIBS += -lvreend -lvreenoauthd
    }
    macx {
        TARGET = $$member(TARGET, 0)_debug
        LIBS += -lvreen_debug -lvreenoauth_debug
    }
} else {
    BUILD = release
    LIBS += -lvreen -lvreenoauth
}

DESTDIR = $$BUILD
OBJECTS_DIR = $$BUILD/.obj
MOC_DIR = $$BUILD/.moc
RCC_DIR = $$BUILD/.qrc
UI_DIR = $$BUILD/.ui
