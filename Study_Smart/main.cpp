#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSplashScreen>
#include <QMainWindow>
#include "deck.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Splash screen code
    QQmlApplicationEngine engine;
    QPixmap pixmap(":/Splash.jpg");
    QSplashScreen splash(pixmap);
    splash.show();

    app.processEvents();

    //deck all_the_cards;
    notecard first("Which athlete has won the most Olympic medals?", "Michael Phelps");
    notecard second("In the movie \"Back to the Future\", what speed did the DeLorean need to reach in order to achieve time travel?", "88 mph");

    engine.rootContext()->setContextProperty("FirstCard", &first);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QMainWindow window;
    window.show();
    splash.finish(&window);

    return app.exec();
}
