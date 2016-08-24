include(../../../vreen.pri)

TARGET = dialogs

TEMPLATE = app

QT += widgets network qml quick

qtHaveModule(webkitwidgets) {
    QT += webkitwidgets
} else {
    QT += webengine webenginewidgets
    DEFINES += VREEN_WITH_WEBENGINE
}

HEADERS += \
        ../common/*.h

SOURCES += \
        ../common/*.cpp

OTHER_FILES += \
        qml/*.qml

#include(../../../vreencore.pri)
#LIBS += -lvreenoauth

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

mkpath($$DESTDIR/qml)
QMAKE_POST_LINK += $$quote($(COPY_DIR) $$toNativeSeparators($$PWD/qml/*) $$toNativeSeparators($$DESTDIR/qml)$$escape_expand(\n\t))

