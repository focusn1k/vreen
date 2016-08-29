include(../../../vreen.pri)

TARGET = audio

TEMPLATE = app

CONFIG -= app_bundle

QT += widgets network qml quick

qtHaveModule(webkitwidgets) {
    QT += webkitwidgets
} else {
    QT += webengine webenginewidgets
    DEFINES += VREEN_WITH_WEBENGINE
}

HEADERS += \
        ../common/declarativeview.h

SOURCES += \
        ../common/declarativeview.cpp \
        ../common/main.cpp

OTHER_FILES += \
        qml/*.qml \

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

