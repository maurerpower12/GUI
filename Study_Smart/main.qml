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
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.3
import QtQuick.Dialogs 1.2

import "fontawesome.js" as FontAwesome

ApplicationWindow {
    id: main_window
    visible: true
    height: 768
    property int widthVar:1000
    property bool menu_visible: false
    width:  widthVar +24
    title: qsTr("Study Smart")
    property int numcard: 0
    Settings
    {
        id: settings_global
        property alias color: main_window.color
    }
    MessageDialog {
        id: newDeckDialog
        standardButtons: StandardButton.Ok | StandardButton.Cancel
        title: "Create A New Deck"
        text: "What will be the topic of this deck of notecards: "
        onAccepted: {
            console.log("New Deck Made.")
        }
        Component.onCompleted: visible = false
    }
    MessageDialog {
        id: newNoteCardDialog
        standardButtons: StandardButton.Ok | StandardButton.Cancel
        title: "Create A New Note Card"
        text: "Question for the Note Card: "
        onAccepted: {
            console.log("New Card Made.")
        }
        Component.onCompleted: visible = false
    }

//   Image {
//       source: "../Study_Smarter_Git/Study_Smart/logo_ss.png"
//   }


    ToolBar {
        id: toolbar_top
        style: ToolBarStyle {
            padding {
                left: 8
                right: 8
                top: 5
                bottom: 5

            }
            background: Rectangle {
                implicitWidth: main_window.width
                implicitHeight: 50
                color: "black"
            }
        }
        MenuBar {
                Menu {
                    title: "File"
                    MenuItem { text: "New Deck.."; onTriggered: newDeckDialog.open();}
                    MenuItem { text: "New Note Card.."; onTriggered: newNoteCardDialog.open(); }
                    MenuItem { text: "Save"; onTriggered: console.log("Save Called");}
                }
                Menu {
                     title: "Edit"
                     MenuItem { text: "Cut" }
                     MenuItem { text: "Copy" }
                     MenuItem { text: "Paste" }
                     MenuItem { text: "Select All" }
                 }
        }

        RowLayout {
            ToolButton {
                Image {
                    id: logo_ss
                    source: "/logo_ss.png"
                    width: 50
                    height: 50

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                           logo_ss.opacity = 0.5
                        }

                        onExited: {
                             logo_ss.opacity = 1
                        }

                        onClicked: {
                            menu_visible = !menu_visible;
                            if(menu_visible === true) {
                                settingsInto2.start();
                                inner_hide.visible = true;
                            }
                            else {
                                settingsGoAway.start();
                                inner_hide.visible = false;
                            }
                        }
                    }
                }
            }
        }
    }


    Flipable {
        id: flipable
        width: main_window.width
        height: main_window.height
        anchors.top: toolbar_top.bottom
        property bool flipped: false

        front :
            NoteCard
        {
            id: question
            visible: true;
            anchors.horizontalCenter: main_window.horizontalCenter
            anchors.verticalCenter: main_window.verticalCenter
            anchors.centerIn: parent
        }
    back:
    NoteCard
    {
        id: answer
        visible: false;
        anchors.horizontalCenter: main_window.horizontalCenter
        anchors.verticalCenter: main_window.verticalCenter
        anchors.centerIn: parent
    }

transform: Rotation {
    id: rotation
    origin.x: flipable.width/2
    origin.y: flipable.height/2
    axis.x: 1;
    axis.y: 0;
    axis.z: 0;     // set axis.y to 1 to rotate around y-axis
    angle: 0;    // the default angle
}

states: State {
    name: "back"
    PropertyChanges { target: rotation; angle: 180;  }
    when: flipable.flipped
}

transitions: Transition {
    NumberAnimation { target: rotation; property: "angle"; duration: 400; }
}

MouseArea {
    anchors.fill: parent
    onClicked:
    {
        flipable.flipped = !flipable.flipped
        question.visible = !question.visible;
        answer.visible = !answer.visible;
    }
}
}

Rectangle {
    id: rect_menu
    height: parent.height
    width: parent.width
    x: -parent.width
    z: 1000
    color: "#FF808080"
    opacity: 0.9
    Behavior on opacity { NumberAnimation { duration: 1300 } }
    border.width: 2
    border.color: "light grey"


    Text {
        id: txt_settings_title
        text: "Settings"
        anchors.horizontalCenter: parent.horizontalCenter;
    }
    Text {
        id: txt_color_title
        text: "\nBackground Color:"
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: txt_settings_title.bottom
    }
    Grid {
        id: colorPicker
        x: 4;
        rows: 2; columns: 3; spacing: 3
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: txt_color_title.bottom

        Rectangle { id: red; color: "#ea7272"; width: 80; height: 80; MouseArea { anchors.fill: parent; hoverEnabled: true;  onEntered: { red.opacity = 0.5; } onExited: { red.opacity = 1; } onClicked: main_window.color = parent.color} }
        Rectangle { id: green; color: "light green"; width: 80; height: 80; MouseArea {anchors.fill: parent; onClicked: main_window.color = parent.color; hoverEnabled: true;  onEntered: { green.opacity = 0.5; } onExited: { green.opacity = 1; }}}
        Rectangle { id: blue; color: "light blue"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color; hoverEnabled: true;  onEntered: { blue.opacity = 0.5; } onExited: { blue.opacity = 1; } }}
        Rectangle { id: grey; color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color; hoverEnabled: true;  onEntered: { grey.opacity = 0.5; } onExited: { grey.opacity = 1; } }}
        Rectangle { id: steelblue; color: "steelblue"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color; hoverEnabled: true;  onEntered: { steelblue.opacity = 0.5; } onExited: { steelblue.opacity = 1; } }}
        Rectangle { id:black; color: "black"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: main_window.color = parent.color; hoverEnabled: true;  onEntered: { black.opacity = 0.5; } onExited: { black.opacity = 1; } }}


    }
    Text {
        id: txt_deck_title
        text: "\n\nPick a Deck of notecards:"
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: colorPicker.bottom
    }
    Grid {
        id: deckPicker
        x: 4;
        rows: 2; columns: 3; spacing: 3
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: txt_deck_title.bottom

        Rectangle { Text {text:"Math"} color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; } }
        Rectangle { Text {text:"Science"} color: "light grey"; width: 80; height: 80; MouseArea {anchors.fill: parent;  }}
        Rectangle { Text {text:"Important"} color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; }}
        Rectangle { Text {text:"Midterm"} color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  }}
        Rectangle { Text {text:"English"} color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  }}
        Rectangle { Text {text:"Facts"} color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  }}

    }
    Button {
        id: inner_hide
        text: "←"
        z: 100
        anchors.left: parent.left
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menu_visible = !menu_visible;
                if(menu_visible) {
                    settingsInto2.start();
                }
                else {
                    settingsGoAway.start();
                }
            }
        }
    }

    Button {
        id: add_note_card
        text: "📝"
        z: 100
        anchors.right: parent.right
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Add A New Note Card");
            }
        }
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



// End front facing stuff


Button {
    text: "👉"
    width: 50
    height: 50
    anchors.right: parent.right
    style: ButtonStyle {
        label: Text {
            renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: 30
            color: "blue"
            text: control.text
        }
    }
    anchors.verticalCenter: parent.verticalCenter
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(answer.visible === true)
            {
                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
            }

            var max = FirstCard.currentCard();
            if(numcard !== (max-1)) {
                numcard++;
            }
            else {
                numcard = 0;
            }
        }
    }
}

Button {
    text: "👈"
    width: 50
    height: 50
    style: ButtonStyle {
        label: Text {
            renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: 30
            color: "blue"
            text: control.text
        }
    }
    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(answer.visible === true)
            {
                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
            }
            var max = FirstCard.currentCard();
            if(numcard !== 0)
            numcard--;
            else {
                numcard = max-1;
            }
        }
    }
}
}
