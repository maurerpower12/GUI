TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp \
    notecard.cpp \
    deck.cpp

RESOURCES += qml.qrc \
    img.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    ../img/Splash.jpg \
    img.qml

HEADERS += \
    notecard.h \
    deck.h \
    random.h

RC_ICONS = ../Study_Smarter_Git/Study_Smart/ss.icns
