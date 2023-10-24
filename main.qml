import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

Window {
    id: window
    width: 700
    height: 1050
    visible: true
    title: qsTr("Student Registration Form")
    flags: Qt.SplashScreen | Qt.FramelessWindowHint
    color: "#00fa9a"

    property string name: ""
    property string fatherName: ""
    property string motherName: ""
    property string mobileNumber: ""
    property string selectedGender: ""
    property var selectedItems: []
    property string rajya: ""
    property string city: ""
    property string landMark: ""
    property string pinCode: ""

    //Top Heading
    Rectangle{
        id:containerRect
        y: 0
        height: 50
        anchors.left:  parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        color: "#14335a"
        border.color: "#da70d6"
        border.width: 6

        //Heading objectName
        Text{
            width: 245
            height: 29
            anchors.centerIn: parent
            text: "Student Registration Form"
            font.family: "Times New Roman"
            anchors.verticalCenterOffset: -3
            anchors.horizontalCenterOffset: 3
            color: "#fefff6"
            font.pointSize: 20
        }

        Button {
            id: closeButton
            x: 580
            y: 10
            width: 100
            height: 30
            text: qsTr("Close")
            font.bold: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Qt.quit();
                }

                Rectangle{
                    anchors.centerIn:parent
                    width: 98
                    height: 26
                    radius: 5
                    color: "red"
                }
            }
        }
    }

    Rectangle{
        id:containerRect1
        color: "#e6e6fa"
        radius: 6
        border.color: "#f797187f"
        border.width: 2
        anchors.fill: parent
        anchors.rightMargin: 8
        anchors.bottomMargin: 29
        anchors.leftMargin: 9
        anchors.topMargin: 60

        GroupBox {
            id: groupBox
            height: 400
            width: 500
            font.pointSize: 11
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottomMargin: -1
            layer.textureSize.width: 10
            anchors.rightMargin: 15
            anchors.leftMargin: 11
            anchors.topMargin: 5
            title: qsTr("Personal Details")
            spacing: 10

            Label  {
                id: label
                x: 50
                y: 25
                text: qsTr("Name")
            }

            Label {
                id: label1
                x: 50
                y: 65
                text: qsTr("Father's Name")
                rotation: -1.907
            }

            Label {
                id: label2
                x: 50
                y: 110
                text: qsTr("Mother's Name")
            }

            Label {
                id: label3
                x: 50
                y: 155
                text: qsTr("Mobile Number")
            }
            Label {
                id: label4
                x: 50
                y: 200
                width: 49
                height: 30
                text: qsTr("Gender")
            }
            Label {
                id: label5
                x: 50
                y: 250
                text: qsTr("Qualification")
            }
            Label {
                id: label10
                x: 50
                y: 300
                text: qsTr("Skills")
            }

            TextField {
                id: nameTextField
                x: 175
                y: 25
                width: 238
                height: 29
                placeholderText: qsTr("Enter your name")
                onTextChanged: name=text
            }

            TextField {
                id: fatherNameTextField
                x: 175
                y: 65
                width: 238
                height: 29
                placeholderText: qsTr("Enter your Father's name ")
                onTextChanged: fatherName=text
            }

            TextField {
                id: motherNameTextField
                x: 175
                y: 105
                width: 238
                height: 29
                placeholderText: qsTr("Enter your Mother's name ")
                onTextChanged: motherName=text
            }

            TextField {
                id: mobileNumberTextField
                x: 175
                y: 150
                width: 238
                height: 29
                placeholderText: qsTr("Enter your mobile number")
                onTextChanged: mobileNumber=text
            }

            RowLayout{
                x: 165
                y: 190
                scale: 1
                RadioButton{
                    text: "Male"
                    checked: selectedGender==="Male"
                    onClicked: {
                        if(checked) selectedGender="Male"
                    }
                }
                RadioButton{
                    text: "Female"
                    checked: selectedGender==="Female"
                    onClicked: {
                        if(checked) selectedGender="Female"
                    }
                }
            }

            ComboBox {
                id: comboBox
                x: 178
                y: 245
                width: 140
                height: 30
                font.pointSize: 10
                model: ["--Select--","10th","12th","Graduation","Post Graduation"]
            }

            Row{
                spacing: 10
                x: 170
                y: 290

                CheckBox {
                    id: checkBoxC
                    text: qsTr("C")
                }

                CheckBox {
                    id: checkBoxCPlusPlus
                    text: qsTr("C++")
                }

                CheckBox {
                    id: checkBoxQt
                    text: qsTr("Qt")
                }
            }
        }

        GroupBox {
            id: groupBox1
            height: 320
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 13
            anchors.leftMargin: 13
            anchors.topMargin: 450
            title: qsTr("Address")
            font.pointSize: 11
            spacing: 10

            Label {
                id: label6
                x: 50
                y: 20
                width: 53
                height: 20
                text: qsTr("State")
            }
            Label {
                id: label7
                x: 50
                y: 72
                width: 50
                height: 20
                text: qsTr("City")
            }
            Label {
                id: label8
                x: 50
                y: 125
                width: 83
                height: 20
                text: qsTr("Land mark")
            }

            Label {
                id: label9
                x: 50
                y: 175
                width: 61
                height: 20
                text: qsTr("Pincode")
            }

            TextField {
                id: stateTextField
                x: 178
                y: 20
                width: 238
                height: 29
                placeholderText: qsTr("Enter your State")
                onTextChanged: rajya=text
            }
            TextField {
                id: cityTextField
                x: 178
                y: 72
                width: 238
                height: 29
                placeholderText: qsTr("Enter your City ")
                onTextChanged:city=text
            }
            TextField {
                id: landmarkTextField
                x: 175
                y: 126
                width: 238
                height: 29
                placeholderText: qsTr("Enter your Landmark ")
                onTextChanged: landMark=text
            }

            TextField {
                id: pincodeTextField
                x: 175
                y: 176
                width: 238
                height: 29
                placeholderText: qsTr("Enter your Pincode ")
                onTextChanged: pinCode=text
            }

        }

        Button {
            id: button
            x: 220
            y: 720
            width: 99
            height: 37
            text: qsTr("Submit")
            layer.format: ShaderEffectSource.RGB
            font.weight: font.bold
            font.underline: false
            font.strikeout: false
            font.bold: true
            font.family: "Verdana"
            onClicked: {

                //It will show Data From UI to Console
                console.log("Name is :",name)
                console.log("Father's Name is :",fatherName)
                console.log("Mother's Name is :",motherName)
                console.log("Mobile Number is :",mobileNumber)
                console.log("Gender is :",selectedGender)

                var selectedItem=comboBox.currentText
                var selectedIndex=comboBox.currentIndex
                if(selectedIndex==0)
                {
                    console.log("Qualification is :",)
                }
                else
                {
                    console.log("Qualification is :",selectedItem)
                }

                selectedItems=[];
                if(checkBoxC.checked)
                    selectedItems.push(checkBoxC.text)
                if(checkBoxCPlusPlus.checked)
                    selectedItems.push(checkBoxCPlusPlus.text)
                if(checkBoxQt.checked)
                    selectedItems.push(checkBoxQt.text)
                console.log("Skills :",selectedItems.toString())
                console.log("State is :",rajya)
                console.log("City is :",city)
                console.log("Land Mark is :",landMark)
                console.log("Pincode is :",pinCode)

                //Save Data From UI to Text File
                var dataToSave =
                        "Student's Name is : "+ nameTextField.text + "\n" +
                        "Father's Name is : "+ fatherNameTextField.text +"\n"+
                        "Mother's Name is : "+ motherNameTextField.text +"\n"+
                        "Mobile Number is : "+ mobileNumberTextField.text +"\n"+
                        "Gender is : "+ selectedGender +"\n"+
                        "Qualification is : "+ selectedItem.toString() +"\n"+
                        "Skills : "+ selectedItems +"\n"+
                        "State is : "+ stateTextField.text +"\n"+
                        "City is : "+ cityTextField.text +"\n"+
                        "Landmark is : "+ landmarkTextField.text +"\n"+
                        "Pincode is : "+ pincodeTextField.text ;

                if (file_Handler.saveToFile(dataToSave))
                {
                    console.log("Data Saved From UI to Text File Successfully !!!");
                }
                else
                {
                    console.error("Error While Saving Data to File !!!");
                }

                //Save Data From QML to Sqlite
                var skillsTxt = selectedItems.join(":").toString();
                var csv_data =
                        nameTextField.text +"," +
                        fatherNameTextField.text +","+
                        motherNameTextField.text +","+
                        mobileNumberTextField.text +","+
                        selectedGender +","+
                        selectedItem +","+
                        skillsTxt +","+
                        stateTextField.text +","+
                        cityTextField.text +","+
                        landmarkTextField.text +","+
                        pincodeTextField.text ;

                if (d_bmanager.saveToSqlite(csv_data))
                {
                    console.log("Data saved to Sqlite successfully !!!");
                }
                else
                {
                    console.error("Error While Saving Data to Sqlite.");
                }

                //When Click on Save Button It will Display message "Data Saved Successfully !!!" and Main window will close
                var messageDialog = Qt.createQmlObject('import QtQuick.Dialogs 1.2; MessageDialog{}',parent);
                messageDialog.text = "Data Saved Successfully !!!";
                messageDialog.standardButtons = StandardButton.Ok;
                messageDialog.accepted.connect(function(){
                    //Close the window when "OK" button is clicked
                    window.close();
                });
                messageDialog.open();
            }

            Rectangle{
                anchors.centerIn: parent
                width: 99
                height: 37
                color: "green"
                radius: 10
                anchors.verticalCenterOffset: 2
                anchors.horizontalCenterOffset: 0
            }
        }

        StackView{
            id:stackView
            anchors.fill: parent
            initialItem: firstPage
        }

        Button {
            id: button2
            x: 350
            y: 720
            width: 99
            height: 37
            text: qsTr("Show Table")
            layer.format: ShaderEffectSource.RGB
            font.weight: font.bold
            font.underline: false
            font.strikeout: false
            font.bold: true
            font.family: "Verdana"

            onClicked: {
                d_bmanager.showTable()
                stackView.push(secondPage)
            }

            Component{
                id:secondPage
                TableData{}
            }

            Rectangle{
                anchors.centerIn: parent
                width: 99
                height: 37
                color: "green"
                anchors.verticalCenterOffset: 2
                anchors.horizontalCenterOffset: 0
                radius: 10
            }
        }
    }
}
