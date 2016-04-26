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
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import "fontawesome.js" as FontAwesome

ApplicationWindow {
    id: main_window
    visible: true
    height: 768
    property int widthVar:1000
    width:  widthVar +24

    Settings
    {
        id: settings_global
        property alias color: main_window.color
    }

    title: qsTr("Study Smart")

    ToolBar {
        RowLayout {
            ToolButton {
                id: tool_logo
                text: 'menu'
                Layout.alignment: Qt.AlignCenter
                anchors.left: rect_menu.right
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
    }

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

    Rectangle {
        id: rect_menu
        height: parent.height
        width: 350
        x: -350
        z: 1000
        color: "grey"

        Behavior on opacity { NumberAnimation { duration: 1300 } }
        border.width: 2
        Text {
            id: txt_settings_title
            text: "Settings"
            anchors.horizontalCenter: parent.horizontalCenter;
        }
        Text {
            id: txt_color_title
            text: "Background Color:"
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: txt_settings_title.bottom
        }
        Grid {
            id: colorPicker
            x: 4;
            rows: 2; columns: 3; spacing: 3
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: txt_color_title.bottom

            Rectangle { color: "#ea7272"; width: 50; height: 50; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color} }
            Rectangle { color: "light green"; width: 50; height: 50; MouseArea {anchors.fill: parent; onClicked: main_window.color = parent.color }}
            Rectangle { color: "light blue"; width: 50; height: 50; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color }}
            Rectangle { color: "light grey"; width: 50; height: 50; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color }}
            Rectangle { color: "steelblue"; width: 50; height: 50; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color }}
            Rectangle { color: "black"; width: 50; height: 50; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color }}

        }

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

//  Button {
//      text: "menu"
//      anchors.left: rect_menu.right
//      y: 40
//      MouseArea {
//          anchors.fill: parent
//          onClicked: {
//              settingsInto2.start();
//              if(rect_menu.visible === true) {
//                  settingsGoAway.start();
//              }
//              else {
//                   settingsInto2.start();
//              }
//          }
//      }
//  }
    // End front facing stuff


    Button {
        text: "Flip over card"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
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
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Next...");
            }
        }
    }

}
