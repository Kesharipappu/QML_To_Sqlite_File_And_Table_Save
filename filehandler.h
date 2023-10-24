#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QObject>

class FileHandler : public QObject
{
    Q_OBJECT
public:
    explicit FileHandler(QObject *parent = nullptr);

    /*Constructor sets up connection with db and opens it
 path - absolute path to db file*/

public slots:
    //It will Save Data From QML UI to File
    Q_INVOKABLE bool saveToFile(const QString &data);

};

#endif // FILEHANDLER_H

