#include "dbmanager.h"
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QDebug>

#include <QSqlQuery>
#include <QSqlError>
#include <QSqlRecord>

DbManager::DbManager(QObject *parent) : QObject(parent){}

DbManager::DbManager(const QString &path)
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(path);

    if (!m_db.open())
    {
        qDebug() << "Error: connection with database fail";
    }
    else
    {
        qDebug() << "Database Connected Successfully !!!";
    }
    createTable();
}

DbManager::~DbManager()
{
    if (m_db.isOpen())
    {
        m_db.close();
    }
}

bool DbManager::isOpen() const
{
    return m_db.isOpen();
}

bool DbManager::createTable()
{
    bool success = false;

    QSqlQuery query;

    query.prepare("CREATE TABLE  student (id INTEGER PRIMARY KEY, name TEXT,"
                  "fatherName TEXT, motherName TEXT, mobileNumber TEXT,"
                  "gender TEXT, qualification TEXT, skills TEXT, state TEXT,"
                  "city TEXT, landmark TEXT, pincode TEXT)");
    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'student': one might already exist.";
        success = false;
    }

    return success;
}

bool DbManager::addRecord(const QString &name, const QString &fatherName,
                          const QString &motherName,const QString &mobileNumber,
                          const QString &selectedGender, const QString &qualification,
                          const QString &skills, const QString &state,
                          const QString &city, const QString &landmark,
                          const QString &pincode)
{
    if (isOpen())
    {
        QSqlQuery queryAdd;
        queryAdd.prepare("INSERT INTO student (name, fatherName, motherName, mobileNumber, gender, qualification, skills, state, city, landmark, pincode) "
                         "VALUES (:name, :fatherName, :motherName, :mobileNumber, :gender, :qualification, :skills, :state, :city, :landmark, :pincode)");

        queryAdd.bindValue(":name", name);
        queryAdd.bindValue(":fatherName", fatherName);
        queryAdd.bindValue(":motherName", motherName);
        queryAdd.bindValue(":mobileNumber", mobileNumber);
        queryAdd.bindValue(":gender", selectedGender);
        queryAdd.bindValue(":qualification", qualification);
        queryAdd.bindValue(":skills", skills);
        queryAdd.bindValue(":state", state);
        queryAdd.bindValue(":city", city);
        queryAdd.bindValue(":landmark", landmark);
        queryAdd.bindValue(":pincode", pincode);

        if (queryAdd.exec())
        {
            return true;
        }
        else
        {
            qDebug() << "Data insertion failed: " << queryAdd.lastError();
        }
    }
    else
    {
        qDebug() << "Database is not open!";
    }

    return false;
}

void DbManager::printAllRecords() const
{
    qDebug() << "Persons in Database:";
    QSqlQuery query("SELECT * FROM student");

    if (!query.exec())
    {
        qDebug() << "Error executing query: " << query.lastError().text();
        return;
    }

    while (query.next())
    {
        QString name = query.value("name").toString();
        QString fatherName = query.value("fatherName").toString();
        QString motherName = query.value("motherName").toString();
        QString mobileNumber = query.value("mobileNumber").toString();
        QString selectedGender = query.value("gender").toString();
        QString qualification = query.value("qualification").toString();
        QString skills = query.value("skills").toString();
        QString state = query.value("state").toString();
        QString city = query.value("city").toString();
        QString landmark = query.value("landmark").toString();
        QString pincode = query.value("pincode").toString();

        qDebug() << "Name: " << name;
        qDebug() << "Father's Name: " << fatherName;
        qDebug() << "Mother's Name: " << motherName;
        qDebug() << "Mobile Number: " << mobileNumber;
        qDebug() << "Gender: " << selectedGender;
        qDebug() << "Qualification: " << qualification;
        qDebug() << "Skills: " << skills;
        qDebug() << "State: " << state;
        qDebug() << "City: " << city;
        qDebug() << "Landmark: " << landmark;
        qDebug() << "Pincode: " << pincode;
    }
}

bool DbManager::saveToSqlite(const QString &data)
{
    QStringList list =data.split(",");
    qDebug()<<"Input Data" <<list;

    addRecord(list.at(0),list.at(1),list.at(2),list.at(3),list.at(4),list.at(5), list.at(6), list.at(7),
              list.at(8), list.at(9), list.at(10));

    printAllRecords();
}

bool DbManager::showTable()
{
    qDebug() << "Persons in Database:";
    QSqlQuery query("SELECT * FROM student");


    while (query.next())
    {
        QString name = query.value("name").toString();
        QString fatherName = query.value("fatherName").toString();
        QString motherName = query.value("motherName").toString();
        QString mobileNumber = query.value("mobileNumber").toString();
        QString selectedGender = query.value("gender").toString();
        QString selectedItem = query.value("qualification").toString();
        QString selectedItems = query.value("skills").toString();
        QString state  = query.value("state").toString();
        QString city  = query.value("city").toString();
        QString landmark  = query.value("landmark").toString();
        QString pincode  = query.value("pincode").toString();

        qDebug() << "Name For Table : " << name;
        qDebug() << "Father's Name For Table : " << fatherName;
        qDebug() << "Mother's Name For Table : " << motherName;
        qDebug() << "Mobile Number For Table : " << mobileNumber;
        qDebug() << "Gender For Table : " << selectedGender;
        qDebug() << "Qualification For Table : " << selectedItem;
        qDebug() << "Skills For Table : " << selectedItems;
        qDebug() << "State For Table : " << state;
        qDebug() << "Landmark For Table : " << landmark;
        qDebug() << "Pincode For Table : " << pincode;

    }

    return true;
}

QList<QVariantMap> DbManager::execQuery(const QString& query)
{
    QList<QVariantMap> results;

    if (isOpen())
    {
        QSqlQuery sqlQuery(query);

        if (sqlQuery.exec())
        {
            while (sqlQuery.next())
            {
                QVariantMap row;
                row["name"] = sqlQuery.value("name").toString();
                row["fatherName"] = sqlQuery.value("fatherName").toString();
                row["motherName"] = sqlQuery.value("motherName").toString();
                row["mobileNumber"] = sqlQuery.value("mobileNumber").toString();
                row["selectedGender"] = sqlQuery.value("gender").toString();
                row["qualification"] = sqlQuery.value("qualification").toString();
                row["skills"] = sqlQuery.value("skills").toString();
                row["state"] = sqlQuery.value("state").toString();
                row["city"] = sqlQuery.value("city").toString();
                row["landmark"] = sqlQuery.value("landmark").toString();
                row["pincode"] = sqlQuery.value("pincode").toString();

                results.append(row);
            }
        }
        else
        {
            qDebug() << "Query execution failed: " << sqlQuery.lastError();
        }
    }
    else
    {
        qDebug() << "Database is not open!";
    }

    return results;
}



