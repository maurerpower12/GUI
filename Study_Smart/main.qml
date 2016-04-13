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

//    MyDialog {
//        id: retest
//    }
    Splash {
        id: begin
        inner_text: "Welcome to Study Smart! We are about to change the way in which you learn. Not only that, but we will change the way you memorize all of the things in your life!"
       // inner_text: " "
        z: 10
    }
    Splash {
        id: behind
        inner_text: "Hello From the other side"
        z: -1
    }
}
