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
    id: main_window
    visible: true
    height: 768
    property int widthVar:1000
    width:  widthVar +24

    title: qsTr("Study Smart")

    Splash {
        id: begin
        inner_text: "Welcome to Study Smart!"
    }



    NoteCard
    {
        id: question
        visible: true;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    NoteCard
    {
        id: answer
        visible: false;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

    }

    Rectangle {
        id: rect_menu
        height: parent.height
        width: 350

        //anchors.right: parent.right
        x: -350
        color: "light grey"
        //visible: false

        Behavior on opacity { NumberAnimation { duration: 1300 } }
        border.width: 5
        //anchors.margins: -10
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //rect_menu.visible = false;
            }
        }
//        PropertyAnimation {
//            Component.onCompleted: {
//                rect_menu.visible = true;
//                settingsinto.start();
//            }

//            id: settingsinto;
//            target: rect_menu;
//            easing.type: Easing.Linear;

//            property: "x";
//            to: 0
//            duration: 100;
//        }
        NumberAnimation {
            id: settingsGoAway;
            target: rect_menu;
            easing.type: Easing.Linear;

            property: "x";
            to: -350;
            duration: 100;
            onStopped: rect_menu.visible = false;
        }
        NumberAnimation {
            id: settingsInto2;
            target: rect_menu;
            easing.type: Easing.Linear;

            property: "x";
            to: 0;
            duration: 100;
            onStopped: rect_menu.visible = true;
        }
    }

    // End front facing stuff


    Button {
        text: "Flip over card"
        anchors.right: parent.right

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(question.visible)
                {
                    question.visible = false;
                    answer.visible = true;
                }
                else
                {
                    question.visible = true;
                    answer.visible = false;
                }
            }
        }
    }

    Button {
        text: "Next Notecard"
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Next...");
            }
        }
    }

    Button {
        text: "menu"
        //anchors.right: parent.right
        anchors.left: rect_menu.right
        //anchors.left: parent.left
        MouseArea {
            anchors.fill: parent
            onClicked: {
                settingsInto2.start();
                if(rect_menu.visible === true) {
                    settingsGoAway.start();

                }
                else {
                    settingsInto2.start();
                }
            }
        }
    }
}
