#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <filehandler.h>
#include <dbmanager.h>

static const QString path = "example.db";

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    FileHandler fileHandler;

    DbManager dbManager(path);

    engine.rootContext()->setContextProperty("file_Handler", &fileHandler);

    engine.rootContext()->setContextProperty("d_bmanager", &dbManager);

    // Fetch data from the database
    QString query = "SELECT * FROM student";
    QList<QVariantMap> result = dbManager.execQuery(query);

    // Pass the data as a model to the QML context
    QQmlContext *ctx = engine.rootContext();
    ctx->setContextProperty("myModel", QVariant::fromValue(result));

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
