include(../../../vreen.pri)

QT       += network

qtHaveModule(webkitwidgets) {
    QT += webkitwidgets
} else {
    QT += webengine webenginewidgets
    DEFINES += VREEN_WITH_WEBENGINE
}

TEMPLATE = lib
CONFIG += staticlib

TARGET = vreenoauth

SOURCES += $$PWD/*.cpp

PUBLIC_HEADERS += $$PWD/*[^p].h
PRIVATE_HEADERS += $$PWD/*_p.h
HEADERS = $$PWD/*.h


INCLUDEPATH += ../../../include
LIBS += -L../../../libs

CONFIG(debug, debug|release) {
    BUILD = debug
    win32 {
        TARGET = $$member(TARGET, 0)d
        LIBS += -lvreend
    }
    macx {
        TARGET = $$member(TARGET, 0)_debug
        LIBS += -lvreen_debug
    }
} else {
    BUILD = release
    LIBS += -lvreen
}

DESTDIR = $$VREEN_LIBS_DIR
OBJECTS_DIR = $$BUILD/.obj
MOC_DIR = $$BUILD/.moc
RCC_DIR = $$BUILD/.qrc
UI_DIR = $$BUILD/.ui


#include dir
mkpath($$VREEN_INCLUDE_DIR/auth)
QMAKE_POST_LINK += $$quote($(COPY) $$toNativeSeparators($$PWD/*.h) $$toNativeSeparators($$VREEN_INCLUDE_DIR/auth)$$escape_expand(\n\t))
