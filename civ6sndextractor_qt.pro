QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    codebook.cpp \
    crc.cpp \
    main.cpp \
    revorb.cpp \
    soundextract.cpp \
    tinyxml2.cpp \
    wwriff.cpp

HEADERS += \
    Bit_stream.h \
    codebook.h \
    crc.h \
    errors.h \
    ogg/ogg.h \
    ogg/os_types.h \
    soundextract.h \
    tinyxml2.h \
    vorbis/codec.h \
    wwriff.h

FORMS += \
    soundextract.ui


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    .gitignore \
    COPYING \




win32: LIBS += -L$$PWD/lib/ -logg

INCLUDEPATH += $$PWD/ogg
DEPENDPATH += $$PWD/ogg

win32:!win32-g++: PRE_TARGETDEPS += $$PWD/lib/ogg.lib
else:win32-g++: PRE_TARGETDEPS += $$PWD/lib/libogg.a

win32: LIBS += -L$$PWD/lib/ -lvorbis

INCLUDEPATH += $$PWD/vorbis
DEPENDPATH += $$PWD/vorbis

win32:!win32-g++: PRE_TARGETDEPS += $$PWD/lib/vorbis.lib
else:win32-g++: PRE_TARGETDEPS += $$PWD/lib/libvorbis.a
