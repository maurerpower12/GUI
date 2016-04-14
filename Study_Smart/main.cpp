#include <QApplication>
#include <QQmlApplicationEngine>
#include <QSplashScreen>
#include <QMainWindow>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
       QPixmap pixmap(":/Splash.jpg");
       QSplashScreen splash(pixmap);
       splash.show();
       app.processEvents();


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QMainWindow window;
    window.show();
    splash.finish(&window);

    return app.exec();
}
