include(../../../vreen.pri)

QT += network

TEMPLATE = lib
CONFIG += staticlib


TARGET = vreendirectauth

SOURCES += $$PWD/*.cpp

PUBLIC_HEADERS += $$PWD/*[^p].h
PRIVATE_HEADERS += $$PWD/*_p.h
HEADERS = $$PUBLIC_HEADERS \
    $$PRIVATE_HEADERS

DEFINES += VREEN_DIRECTAUTH_CLIENT_ID=\\\"String\\\"
DEFINES += VREEN_DIRECTAUTH_CLIENT_SECRET=\\\"String\\\"
DEFINES += VREEN_DIRECTAUTH_CLIENT_NAME=\\\"String\\\"

INCLUDEPATH += ../../../include
LIBS += -L../../../libs

CONFIG(debug, debug|release) {
    BUILD = debug
    DESTDIR = $$BUILD
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
    DESTDIR = $$BUILD
    LIBS += -lvreen
}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.ui

#include dir
mkpath($$VREEN_INCLUDE_DIR/direct)
QMAKE_POST_LINK += $$quote($(COPY) $$toNativeSeparators($$PWD/*.h) $$toNativeSeparators($$VREEN_INCLUDE_DIR/direct)$$escape_expand(\n\t))

win32:{
    QMAKE_POST_LINK += $$quote($(COPY) $$toNativeSeparators($$PWD/$$BUILD/*.lib) $$toNativeSeparators($$VREEN_LIBS_DIR)$$escape_expand(\n\t))
}

unix:{
    QMAKE_POST_LINK += $$quote($(COPY) $$toNativeSeparators($$PWD/$$BUILD/*.a) $$toNativeSeparators($$VREEN_LIBS_DIR)$$escape_expand(\n\t))
}
