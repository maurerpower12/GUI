///*************************************************************
//* Author:         Joseph Maurer
//* Filename:		main.qml
//* Lab:            lab 2
//* Project name:   study smart
//* Date Created:	04/07/16
//* Modifications:
//              04/07/16 Made changes for lab 2 splash screen
//              04/08/16 Made the Notification animations
//**************************************************************\


import QtQuick 2.6
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2

ApplicationWindow {
    visible: true
    height: 768
    property int widthVar:1000
    width:  widthVar +24

    title: qsTr("Study Smart")

    Dialog {
        MyButton {
               color: "light blue"
               anchors.centerIn: parent
           }
    }

    MyButton {
        color: "light blue"
        anchors.centerIn: parent
    }

    Notification {
        not_color: "light blue"
        inner_txt: "Notifications can be displayed to the user using this method! Click the 'x' over there to make it go away---->"
        time_in: 500
    }


}
