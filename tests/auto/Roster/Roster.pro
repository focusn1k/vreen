include(../../../vreen.pri)
include(../../../vreencore.pri)

QT += testlib network

TARGET = app

CONFIG += console depend_includepath testcase
qtHaveModule(webkitwidgets) {
    QT += webkitwidgets
} else {
    QT += webengine webenginewidgets
    DEFINES += VREEN_WITH_WEBENGINE
}

LIBS += -lvreen -lvreenoauth
INCLUDEPATH += ../../../include/vreen \
            ../..

HEADERS += \
        *.h

SOURCES += \
        *.cpp

CONFIG(debug, debug|release) {
    BUILD = debug
} else {
    BUILD = release
}

DESTDIR = $$BUILD
OBJECTS_DIR = $$BUILD/.obj
MOC_DIR = $$BUILD/.moc
RCC_DIR = $$BUILD/.qrc
UI_DIR = $$BUILD/.ui
