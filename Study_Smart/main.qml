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

//    Splash {
//        id: begin
//        inner_text: "Welcome to Study Smart!"
//    }



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

    Button {
        text: "Flip over card"

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
}
