TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp \
    notecard.cpp \
    deck.cpp

RESOURCES += qml.qrc \
    img.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH =

ICON = ../Study_Smart/ss_ico.icns
#RC_ICONS = ss_ico.icns

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    ../img/Splash.jpg

HEADERS += \
    notecard.h \
    deck.h \
    random.h

