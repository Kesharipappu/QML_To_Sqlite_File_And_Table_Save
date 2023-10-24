#include "filehandler.h"
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QDebug>

FileHandler::FileHandler(QObject *parent) : QObject(parent){

}
bool FileHandler::saveToFile(const QString &data)
{
    QString fileName = QDateTime::currentDateTime().toString("dd-mm-yyyy-hh-mm-ss");
    fileName +=".txt";

    //Address where Text file will be store
    QFile file("C:/Users/PAPPU KUMAR KESHARI/OneDrive/Desktop/"+fileName);
    if(!file.open(QIODevice::WriteOnly | QIODevice::Text))

        return false;

    QTextStream stream(&file);
    stream << data;
    file.close();

    return true;
}

