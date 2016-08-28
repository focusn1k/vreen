include(../../../vreen.pri)

QT += widgets network

qtHaveModule(webkitwidgets) {
    QT += webkitwidgets
} else {
    QT += webengine webenginewidgets
    DEFINES += VREEN_WITH_WEBENGINE
}

TARGET = phonefetcher

CONFIG -= app_bundle

TEMPLATE = app

HEADERS = *.h

SOURCES = *.cpp

include(../../../vreencore.pri)

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

DESTDIR = $$VREEN_BUILD_TREE/examples/$$TARGET
OBJECTS_DIR = $$BUILD/.obj
MOC_DIR = $$BUILD/.moc
RCC_DIR = $$BUILD/.qrc
UI_DIR = $$BUILD/.ui
