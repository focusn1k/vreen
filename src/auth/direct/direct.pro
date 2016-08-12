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
LIBS += -L../../../libs -lvreen
unix:{
    QMAKE_POST_LINK = $(MKDIR) $$VREEN_LIBS_DIR
    $$escape_expand(\\n\\t)
    QMAKE_POST_LINK += && $(COPY) $$PWD/*.a $$VREEN_LIBS_DIR
    $$escape_expand(\\n\\t)
}
