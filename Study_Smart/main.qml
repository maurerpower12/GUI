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
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import "LoadCards.js" as Loader

ApplicationWindow {
    id: main_window
    visible: true

    property int widthVar:1000
    property int numcard: 0
    property bool menu_visible: false
    property int num_cells_added: 0
    property int num_shake: 50

    height: 768
    width:  widthVar +24

    title: qsTr("Study Smart")
    color: "light grey"


    Component.onCompleted: {
         sq1.visible = false;
         sq2.visible = false;
         sq3.visible = false;
         sq4.visible = false;
         sq5.visible = false;
         sq6.visible = false;
         sq7.visible = false;
         sq8.visible = false;
         sq9.visible = false;
         Loader.facts(); Loader.decksetup();
    }


    Settings {
        id: settings_global
        property alias color: main_window.color
        property alias priloading: loading_canvas.primaryColor
        property alias secondaryloading: loading_canvas.secondaryColor
    }

    Loading {
        id: loading_canvas
        anchors.bottom: parent.bottom
    }
    Loading {
        id: wrong_canvas
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        primaryColor: "grey"
        secondaryColor: "red"
        currentValue: 1
        maximumValue: 2
        text: "Incorrect"

    }
    Loading {
        id: correct_canvas
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        primaryColor: "grey"
        secondaryColor: "light green"
        currentValue: 1
        maximumValue: 2
        text: "Correct"

    }


Dialog {
        id: newDeckDialog
        visible: false
        title: "Create A Deck Card"
        standardButtons: StandardButton.Save | StandardButton.Cancel

        onAccepted: {
            console.log("Title of the Deck: " + textin_deck_title.getText(0,textin_deck_title.length));
            num_cells_added++;
            deckPicker.rows = deckPicker.rows + 1;
            switch(num_cells_added){
            case 1:
                sq1.visible = true;
                tq1.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 2:
                sq2.visible = true;
                tq2.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 2:
                sq2.visible = true;
                tq2.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 3:
                sq3.visible = true;
                tq3.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 4:
                sq4.visible = true;
                tq4.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 5:
                sq5.visible = true;
                tq5.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 6:
                sq6.visible = true;
                tq6.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 7:
                sq7.visible = true;
                tq7.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 8:
                sq8.visible = true;
                tq8.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            case 9:
                sq9.visible = true;
                tq9.text = textin_deck_title.getText(0,textin_deck_title.length);
                break;
            default:
                break;
            }
            console.log("Done");
        }

        Text {
            id: txt_deck_title_dialog
            text: "Title for the Deck: "
        }

        TextField {
            style: TextFieldStyle {
                    textColor: "black"
                    background: Rectangle {
                        radius: 1
                        implicitWidth: newDeckDialog.width
                        implicitHeight: 25
                        border.color: "#333"
                    }
                }

            id: textin_deck_title

            y: 25
            anchors.top: txt_deck_title_dialog.bottom
            text: "..."
            font.capitalization: Font.Capitalize

             onFocusChanged: textin_deck_title.selectAll();
        }
    }


Dialog {
    id: newNoteCardDialog
    visible: false
    title: "Create A New Note Card"
    standardButtons: StandardButton.Save | StandardButton.Cancel

    onAccepted: {
        console.log("Question: " +textin_question.getText(0,textin_question.length)
                            + "\n" + "      Answer: " +textin_answer.getText(0,textin_answer.length));
        FirstCard.setNoteCard(textin_question.getText(0,textin_question.length), textin_answer.getText(0,textin_answer.length));
        note_count.text = FirstCard.currentCard();

        flipable.flipped = !flipable.flipped
        question.visible = !question.visible;
        answer.visible = !answer.visible;

        flipable.flipped = !flipable.flipped
        question.visible = !question.visible;
        answer.visible = !answer.visible;
    }

    Text {
        id: txt_quest
        text: "Question for the Note Card: "
    }

    TextField {
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 1
                    implicitWidth: newNoteCardDialog.width
                    implicitHeight: 25
                    border.color: "#333"
                }
            }

        id: textin_question

        y: 25
        anchors.top: txt_quest.bottom
        text: "..."
        font.capitalization: Font.Capitalize

         onFocusChanged: textin_question.selectAll();
    }

    Text {
        id: txt_answer
        anchors.top: textin_question.bottom
        text: "Answer for the Note Card: "
    }
    TextField {
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 1
                    implicitWidth: newNoteCardDialog.width
                    implicitHeight: 25
                    border.color: "#333"
                }
            }

        id: textin_answer

        anchors.top: txt_answer.bottom
        text: "..."
        font.capitalization: Font.Capitalize

        onFocusChanged: textin_answer.selectAll();
    }
}

ToolBar {
    id: toolbar_top
    style: ToolBarStyle {
        id: tools
        padding {
            left: 8
            right: 8
            top: 5
            bottom: 5

        }
        background: Rectangle {
            id: tool_bar_rect
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
            MenuItem { text: "Cut"; onTriggered: { console.log("Cut"); } }
            MenuItem { text: "Copy"; onTriggered: { console.log("Copy"); } }
            MenuItem { text: "Paste"; onTriggered: { console.log("Paste"); } }
            MenuItem { text: "Select All"; onTriggered: { console.log("Select All"); } }
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
      ToolButton {
        Text {
            id: note_count
            color: "red"
            visible: false; // turned off because of the loader in bottom right

            text: numcard + "/" + FirstCard.currentCard()

            anchors.right: main_window.right
        }
      }
    }
}


Flipable {
    id: flipable
    width: main_window.width
    height: main_window.height - wrong_btn.height
    anchors.top: toolbar_top.bottom
    property bool flipped: false

    front :
    NoteCard {
        id: question
        visible: true;
        underline_txt: true;
        anchors.horizontalCenter: main_window.horizontalCenter
        anchors.verticalCenter: main_window.verticalCenter
        anchors.centerIn: parent

         RotationAnimation {
             id: rot_right
             target: question;
             from: 0;
             to: 4;
             duration: 100
             running: false
             onStopped: {
                 if(num_shake != 0) {
                         rot_left.start();
                         num_shake--;
                 }
                 else {
                     rot_back_to_normal.start();
                 }
             }
        }
         RotationAnimation {
             id: rot_left
             target: question;
             from: 4;
             to: 0;
             duration: 100
             running: false
             onStopped: {
                 if(num_shake != 0) {
                     rot_right.start();
                     num_shake--;
                 }
             }
        }
         RotationAnimation {
             id: rot_back_to_normal
             target: question;
             from: 4;
             to: 0;
             duration: 100
             running: false
        }

    }

    back:
    NoteCard {
        id: answer
        visible: false;
        underline_txt: false
        anchors.horizontalCenter: main_window.horizontalCenter
        anchors.verticalCenter: main_window.verticalCenter
        anchors.centerIn: parent

        Button {
            id: wrong_btn
            Text {
                text: "❌"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: 50
            height: 25

            MouseArea {
                anchors.fill: parent
                anchors.centerIn: parent
                z: 1000
                onClicked: {
                    var status = FirstCard.isCorrect(numcard);
                    if(status === 0)
                    {
                        FirstCard.setCorrect(2,numcard);
                        wrong_canvas.currentValue = wrong_canvas.currentValue + 1;
                        if(wrong_canvas.currentValue == wrong_canvas.maximumValue) {
                               wrong_canvas.text = "Study More";
                               wrong_canvas.currentValue  = 0;
                        }
                    }
                    else if( status === 2) // the card was wrong
                    {
                        console.log("The card was already wrong");
                    }
                    else { // case for card was correct
                        FirstCard.setCorrect(2,numcard);
                        wrong_canvas.currentValue = wrong_canvas.currentValue + 1;
                        if(correct_canvas.currentValue != 0) // stuff in error canvas
                            correct_canvas.currentValue = correct_canvas.currentValue - 1;
                        if(wrong_canvas.currentValue == wrong_canvas.maximumValue) {
                               wrong_canvas.text = "Study More";
                               wrong_canvas.currentValue  = 0;
                        }
                    }
                }
            }
        }
        Button {
            id: correct_btn
            text: "✅"
             anchors.right: parent.right
             anchors.bottom: parent.bottom
             z:100
             MouseArea {
                 anchors.fill: parent
                 z: flipable.flipped ? 1 : -1  // on top when flipped
                 onClicked: {
                     var status = FirstCard.isCorrect(numcard);
                     if(status === 0)
                     {
                         FirstCard.setCorrect(1,numcard);
                         correct_canvas.currentValue = correct_canvas.currentValue + 1;
                         if(correct_canvas.currentValue == correct_canvas.maximumValue) {
                                correct_canvas.text = "Good Job";
                             // todo play sound here
                         }
                     }
                     else if( status === 2) // the card was wrong
                     {
                         FirstCard.setCorrect(1,numcard);
                         correct_canvas.currentValue = correct_canvas.currentValue + 1;
                         if(wrong_canvas.currentValue != 0) // stuff in error canvas
                             wrong_canvas.currentValue = wrong_canvas.currentValue - 1;
                         if(correct_canvas.currentValue == correct_canvas.maximumValue) {
                                correct_canvas.text = "Good Job";
                             // todo play sound here
                         }
                     }
                     else {
                         console.log("This card was already correct");
                     }
                 }
             }
        }
        Button {
            id: delete_card
            text: "🔥"
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.bottom: parent.bottom
             z:100
             MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     if(FirstCard.currentCard() !== 0)
                        shredInto.start();
                     else
                         console.log("Nothing to delete");

                 }
             }
        }
    }

transform: Rotation {
    id: rotation
    origin.x: flipable.width/2
    origin.y: flipable.height/2
    axis.x: 1;
    axis.y: 0;
    axis.z: 0;     // set axis.y to 1 to rotate around y-axis
    angle: 1;    // the default angle

}

states: State {
    name: "back"
    PropertyChanges { target: rotation; angle: 180; }
    when: flipable.flipped
}

transitions: Transition {
    NumberAnimation { target: rotation; property: "angle"; duration: 1000; }
}

MouseArea {
    anchors.fill: parent
    onClicked: flipable.flipped = !flipable.flipped
    z: flipable.flipped ? -1 : 1  // on top when not flipped
    SwipeArea {
            id: mouse
            anchors.fill: parent
            onMove: {}
            onSwipe: {
                switch (direction) {
                case "up":
                    flipable.flipped = !flipable.flipped
                    question.visible = !question.visible;
                    answer.visible = !answer.visible;
                    break
                case "down":
                    flipable.flipped = !flipable.flipped
                    question.visible = !question.visible;
                    answer.visible = !answer.visible;
                    break
                case "right":
                    menu_visible = !menu_visible;
                    if(menu_visible === true) {
                        settingsInto2.start();
                        inner_hide.visible = true;
                    }
                    else {
                        settingsGoAway.start();
                        inner_hide.visible = false;
                    }

                    break
                case "left":
                    menu_visible = !menu_visible;
                    if(menu_visible === true) {
                        settingsInto2.start();
                        inner_hide.visible = true;
                    }
                    else {
                        settingsGoAway.start();
                        inner_hide.visible = false;
                    }

                    break
                }
            }
            onCanceled: {}
        }

}
}


Image {
    id: shredder_img
    source: "../images/shredf.png"
    anchors.horizontalCenter: parent.horizontalCenter
    visible: true
    width: question.width + 20
    height: question.height + 100
    y: parent.height + 100
    z: 100
    NumberAnimation {
        id: shredGoAway;
        target: shredder_img;
        easing.type: Easing.Linear;

        property: "y";
        to: main_window.height + 100;
        duration: 1000;
        onStopped: {
            rot_back_to_normal.start();
            num_shake = 50; // make sure to reset
            shredder_img.visible = false;
            //loading canvas stuff

            note_count.text = numcard + "/" + FirstCard.currentCard();
            loading_canvas.currentValue = numcard ;
            loading_canvas.maximumValue = FirstCard.currentCard();

            correct_canvas.maximumValue = FirstCard.currentCard();
            wrong_canvas.maximumValue = FirstCard.currentCard();


        }
    }


    NumberAnimation {
        id: shredInto;
        target: shredder_img;
        easing.type: Easing.Linear;
        running: false;
        property: "y";
        to: 310;
        duration: 10000;
        onStarted: {
            shredder_img.visible = true;
            shreditInto.start();

            rot_right.start();
            flipable.flipped = !flipable.flipped
            question.visible = !question.visible;
            answer.visible = !answer.visible;
        }

        onStopped: {
            console.log("Deleted card: " + numcard);
            FirstCard.deleteCard(numcard);
            // flip the card
            flipable.flipped = !flipable.flipped
            question.visible = !question.visible;
            answer.visible = !answer.visible;

            flipable.flipped = !flipable.flipped
            question.visible = !question.visible;
            answer.visible = !answer.visible;

            shredGoAway.start();
            shreded_img.visible = false;
        }
    }

}

Image {
    id: shreded_img
    visible: true
    anchors.horizontalCenter: parent.horizontalCenter
    source: "../images/shredit.png"
    z: 1
    y: parent.height + 120
    width: question.width
    height: main_window.height + 500

    NumberAnimation {
        id: shreditInto;
        target: shreded_img;
        easing.type: Easing.Linear;
        running: false;
        property: "y";
        to: 310;
        duration: 10000;
        onStarted: {
            console.log("here");
            shreded_img.visible = true;
        }
        onStopped: {
            shreditGoAway.start();
        }
    }
    NumberAnimation {
        id: shreditGoAway;
        target: shreded_img;
        easing.type: Easing.Linear;

        property: "y";
        to: main_window.height + 120;
        duration: 1000;
        onStopped: {

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
        font.pointSize: 35
        id: txt_settings_title
        text: "Settings"
        anchors.horizontalCenter: parent.horizontalCenter;
    }

    Button {
        style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 35
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    color: "light grey"
                    radius: 3
                }
            }

        id: add_note_card
        text: " 📝 New Note Card "
        z: 100
        //anchors.right: parent.right
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: parent.verticalCenter
        anchors.top: txt_settings_title.bottom
        MouseArea {
            anchors.fill: parent
            onClicked: {
                newNoteCardDialog.open();
            }
        }
    }
    Button {
        style: ButtonStyle {

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 35
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    color: "light grey"
                    radius: 3
                }
            }

        id: add_deck
        text: "   📚 New Deck   "
        z: 100
        anchors.top: add_note_card.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea {
            anchors.fill: parent
            onClicked: {
                newDeckDialog.open();
            }
        }
    }
    Button {
        style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 35
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    color: "light grey"
                    radius: 3
                }
            }
        id: delete_deck
        text: "❌ Remove All Cards"

        z: 100
        anchors.top: add_deck.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea {
            anchors.fill: parent
            onClicked: {
                FirstCard.clear();
                numcard = 0;
                loading_canvas.currentValue = 0;

                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;

                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
                note_count.text = (numcard+1) + "/" +FirstCard.currentCard();
                loading_canvas.currentValue = numcard+1;

                correct_canvas.currentValue = 0;
                correct_canvas.maximumValue = FirstCard.currentCard();
                wrong_canvas.currentValue = 0;
                wrong_canvas.maximumValue = FirstCard.currentCard();
            }
        }
    }



    Text {
        id: txt_color_title
        text: "\nBackground Color:"
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: delete_deck.bottom
    }
    Grid {
        id: colorPicker
        x: 4;
        rows: 2; columns: 3; spacing: 3
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: txt_color_title.bottom

        Rectangle { id: red; color: "#ea7272"; width: 80; height: 80; MouseArea { anchors.fill: parent; hoverEnabled: true;  onEntered: { red.opacity = 0.5; } onExited: { red.opacity = 1; } onClicked: { main_window.color = parent.color; loading_canvas.secondaryColor = "light blue"; loading_canvas.primaryColor = "grey";  } } }
        Rectangle { id: green; color: "light green"; width: 80; height: 80; MouseArea {anchors.fill: parent; onClicked: { main_window.color = parent.color; loading_canvas.secondaryColor = "#ea7272"; loading_canvas.primaryColor = "grey";  } hoverEnabled: true;  onEntered: { green.opacity = 0.5; } onExited: { green.opacity = 1; }}}
        Rectangle { id: blue; color: "light blue"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: { main_window.color = parent.color; loading_canvas.secondaryColor = "light green"; loading_canvas.primaryColor = "grey";  } hoverEnabled: true;  onEntered: { blue.opacity = 0.5; } onExited: { blue.opacity = 1; } }}
        Rectangle { id: grey; color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: { main_window.color = parent.color; loading_canvas.secondaryColor = "steelblue"; loading_canvas.primaryColor = "grey";  } hoverEnabled: true;  onEntered: { grey.opacity = 0.5; } onExited: { grey.opacity = 1; } }}
        Rectangle { id: steelblue; color: "steelblue"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: { main_window.color = parent.color; loading_canvas.secondaryColor = "red"; loading_canvas.primaryColor = "grey";  } hoverEnabled: true;  onEntered: { steelblue.opacity = 0.5; } onExited: { steelblue.opacity = 1; } }}
        Rectangle { id:black; color: "black"; width: 80; height: 80; MouseArea { anchors.fill: parent; onClicked: { main_window.color = parent.color; loading_canvas.secondaryColor = "gold"; loading_canvas.primaryColor = "grey"; } hoverEnabled: true;  onEntered: { black.opacity = 0.5; } onExited: { black.opacity = 1; } }}


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

        Rectangle { Text {text:"Math\n 📊"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.math(); Loader.decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Science\n 🔬"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea {anchors.fill: parent;  onPressed: { Loader.science(); Loader.decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Important\n‼️"; font.pointSize: 19; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.important(); Loader.decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Midterm \n📝"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  onPressed: { Loader.midterm(); Loader.decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"History \n 📚"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  onPressed: { Loader.history(); Loader.decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.facts(); Loader.decksetup();} onPressAndHold: { parent.visible = false; }}}


        Rectangle { id: sq1; Text {id: tq1; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq2; Text {id: tq2; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq3; Text {id: tq3; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq4; Text {id: tq4; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq5; Text {id: tq5; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq6; Text {id: tq6; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq7; Text {id: tq7; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq8; Text {id: tq8; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}
        Rectangle { id: sq9; Text {id: tq9; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { Loader.decksetup();}}}

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

        id: shuffle
        text: "Shuffle"
        z: 100
        anchors.bottom: parent.bottom
        MouseArea {
            anchors.fill: parent
            onClicked: {
                FirstCard.shuffle();

                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;

                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
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



//// End front facing stuff


Button {
    id: next_card
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
            if(FirstCard.currentCard() !== 0) {
                if(answer.visible === true) // hide the next answer
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
                note_count.text = (numcard+1) + "/" +FirstCard.currentCard();

                loading_canvas.currentValue = (numcard+1);
                loading_canvas.maximumValue = FirstCard.currentCard();

            }
        }
    }
}

Button {
    id: back_card
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
            if(FirstCard.currentCard() !== 0) {
            if(answer.visible === true)
            {
                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
            }
            var max = FirstCard.currentCard();
            if(numcard > 0) {
                numcard--;
                note_count.text = (numcard+1) + "/" +FirstCard.currentCard();
                loading_canvas.currentValue = (numcard+1);
                loading_canvas.maximumValue = FirstCard.currentCard();
            }
            else {
                numcard = max-1;
                note_count.text = (numcard+1) + "/" +FirstCard.currentCard();
                loading_canvas.currentValue = (numcard+1);
                loading_canvas.maximumValue = FirstCard.currentCard();
            }
            }
        }
    }
}

}
