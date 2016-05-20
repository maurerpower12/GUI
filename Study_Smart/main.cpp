#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSplashScreen>
#include <QMainWindow>
#include "deck.h"

#ifdef Q_OS_MAC

#endif

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Splash screen code
    QQmlApplicationEngine engine;
    QPixmap pixmap(":/Splash.jpg");
    //QWindow win;
    QSplashScreen splash(pixmap);
    splash.show();

    // Settings code
    QCoreApplication::setApplicationName("Study_Smart");
    QCoreApplication::setOrganizationName("MaurerPower");
    QCoreApplication::setOrganizationDomain(".com");

    app.setWindowIcon(QIcon("qrc:/ss_ico sm.ico"));

    app.processEvents();

    Deck first;

    engine.rootContext()->setContextProperty("FirstCard", &first);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QMainWindow window;
    window.show();
    splash.finish(&window);
    window.hide();

    return app.exec();
}
