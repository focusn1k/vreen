include(../../../vreen.pri)

QT += widgets network

qtHaveModule(webkitwidgets) {
    QT += webkitwidgets
} else {
    QT += webengine webenginewidgets
    DEFINES += VREEN_WITH_WEBENGINE
}

TARGET = phonefetcher

TEMPLATE = app

HEADERS = *.h

SOURCES = *.cpp

include(../../../vreencore.pri)
LIBS += -lvreenoauth -lvreen

CONFIG(debug, debug|release) {
    BUILD = debug
} else {
    BUILD = release
}

DESTDIR = $$VREEN_BUILD_TREE/examples/$$TARGET
OBJECTS_DIR = $$BUILD/.obj
MOC_DIR = $$BUILD/.moc
RCC_DIR = $$BUILD/.qrc
UI_DIR = $$BUILD/.ui
