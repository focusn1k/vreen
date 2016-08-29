#-------------------------------------------------
#
# Project created by QtCreator 2012-03-21T01:27:28
#
#-------------------------------------------------

include(../../vreen.pri)

QT       += network

TARGET = vreen
TEMPLATE = lib
CONFIG += lib

DEFINES += VK_LIBRARY

SOURCES += $$PWD/*.cpp

PUBLIC_HEADERS += $$PWD/*[^p].h
PRIVATE_HEADERS += $$PWD/*_p.h

HEADERS = $$PWD/*.h

isEmpty( PREFIX ):INSTALL_PREFIX = /usr
else:INSTALL_PREFIX = $${PREFIX}

VK_INSTALL_HEADERS = $${INSTALL_PREFIX}/include
contains(QMAKE_HOST.arch, x86_64) {
	VK_INSTALL_LIBS = $${INSTALL_PREFIX}/lib64
} else {
	VK_INSTALL_LIBS = $${INSTALL_PREFIX}/lib
}

symbian {
    MMP_RULES += EXPORTUNFROZEN
    TARGET.UID3 = 0xE7156367
    TARGET.CAPABILITY = 
    TARGET.EPOCALLOWDLLDATA = 1
    addFiles.sources = vreen.dll
    addFiles.path = !:/sys/bin
    DEPLOYMENT += addFiles
}


CONFIG(debug, debug|release) {
    BUILD = debug

    win32 {
        TARGET = $$member(TARGET, 0)d
    }
    macx {
        TARGET = $$member(TARGET, 0)_debug
    }
} else {
    BUILD = release
}

DESTDIR = $$VREEN_LIBS_DIR
OBJECTS_DIR = $$BUILD/.obj
MOC_DIR = $$BUILD/.moc
RCC_DIR = $$BUILD/.qrc
UI_DIR = $$BUILD/.ui

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else:!isEmpty(MEEGO_VERSION_MAJOR) {
        target.path = /opt/nonameIM/lib
    } else {
        target.path = $$VK_INSTALL_LIBS

        installHeaders.files = $$PUBLIC_HEADERS
        installHeaders.path = $$VK_INSTALL_HEADERS/vk
        INSTALLS += installHeaders
    }
    INSTALLS += target
}

unix {
    QMAKE_CXXFLAGS += -std=c++0x \
        -fvisibility=hidden \
        -Wall -Wextra \
        -Wno-cast-align \
        -O2 -finline-functions
}

#include dir
mkpath($$VREEN_INCLUDE_DIR/private)
QMAKE_POST_LINK += $$quote($(COPY) $$toNativeSeparators($$PWD/*.h) $$toNativeSeparators($$VREEN_INCLUDE_DIR)$$escape_expand(\n\t))
QMAKE_POST_LINK += $$quote($(COPY) $$toNativeSeparators($$PWD/*_p.h) $$toNativeSeparators($$VREEN_INCLUDE_DIR/private)$$escape_expand(\n\t))
