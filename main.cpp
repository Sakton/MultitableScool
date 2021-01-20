#include <QQmlDebuggingEnabler>
#include <QtQuick>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "functionality.h"
#include <QQmlContext>
#include <QtQuickWidgets/QQuickWidget>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    auto *cppFunctionality = new Functionality;
    // Функциональный обьект с++
    //Functionality cppFunctionality;
    //загрузка qml части

    QQmlDebuggingEnabler enabler;

    QQmlApplicationEngine engine(QUrl(QLatin1String("qrc:/qml/main.qml")));

    //если список корневых обьектов пуст, выходим с ошибкой
    if (engine.rootObjects().isEmpty()) return -1;

#ifdef QT_DEBUG
    qDebug() << engine.rootObjects();
#endif

    //вызываем корневой контекст и добавляем ему свойство - указатель на обьект класса срр
    engine.rootContext()->setContextProperty("cppFunctionality", cppFunctionality);

    return QGuiApplication::exec();
}

