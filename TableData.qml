import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 1.4

Window
{
    width: 2000
    height: 1000
    visible: true
    y: 0
    color: "lightblue"
    title: "Student's Record Table"

    Component.onCompleted: {
        var query = "SELECT * FROM student";
        var result = d_bmanager.execQuery(query);

        for (var i = 0; i < result.length; i++) {
            myModel.append({
                               name: result[i].name,
                               fatherName: result[i].fatherName,
                               motherName: result[i].motherName,
                               mobileNumber: result[i].mobileNumber,
                               selectedGender:result[i].selectedGender,
                               qualification:result[i].qualification,
                               selectedItems:result[i].skills,
                               state:result[i].state,
                               city:result[i].city,
                               landmark:result[i].landmark,
                               pincode:result[i].pincode
                           });
        }
    }

    TableView {
        id: myTable
        anchors.fill: parent
        anchors.margins: 5

        TableViewColumn {
            role: "name"
            title: "Name"
            width: 200
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role: "fatherName"
            title: "Father's Name"
            width: 250
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role: "motherName"
            title: "Mother's Name"
            width: 200
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"mobileNumber"
            title: "Mobile Number"
            width: 150
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"selectedGender"
            title: "Gender"
            width: 100
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"qualification"
            title: "Qualification"
            width: 160
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"skills"
            title: "Skills"
            width: 150
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"state"
            title: "State"
            width: 150
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"city"
            title: "City"
            width: 150
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"landmark"
            title: "Landmark"
            width: 250
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            role:"pincode"
            title: "Pincode"
            width: 150
            horizontalAlignment: Text.AlignHCenter
        }
        model: myModel
    }
}
