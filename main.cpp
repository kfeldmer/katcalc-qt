#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "Backend/calculator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Calculator>("com.example", 1, 0, "Calculator");  // Adjust namespace and version

    const QUrl url(u"qrc:/Katronic_Demo_QtQuick/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
