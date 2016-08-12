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
HEADERS = $$PUBLIC_HEADERS \
    $$PRIVATE_HEADERS


INCLUDEPATH += ../../../include
LIBS += -L../../../libs -lvreen

unix:{
    QMAKE_POST_LINK = $(MKDIR) $$VREEN_LIBS_DIR
    $$escape_expand(\\n\\t)
    QMAKE_POST_LINK += && $(COPY) $$PWD/*.a $$VREEN_LIBS_DIR
    $$escape_expand(\\n\\t)
}
