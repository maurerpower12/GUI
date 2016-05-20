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

ApplicationWindow {
    id: main_window
    visible: true

    property int widthVar:1000
    property int numcard: 0
    property bool menu_visible: false
    property int num_cells_added: 0

    Keys.onPressed: { if (event.key === Qt.Key_0 && (event.modifiers & Qt.ControlModifier)) console.log("Yayy"); }

    height: 768
    width:  widthVar +24

    title: qsTr("Study Smart")


    Component.onCompleted: {
        //deckPicker.columns = deckPicker.columns + 1;
        //deckPicker.rows = deckPicker.rows + 1;

         sq1.visible = false;
         sq2.visible = false;
         sq3.visible = false;
         sq4.visible = false;
         sq5.visible = false;
         sq6.visible = false;
         sq7.visible = false;
         sq8.visible = false;
         sq9.visible = false;
         sq10.visible = false;
    }


    Settings {
        id: settings_global
        property alias color: main_window.color
    }


    Dialog {
        id: newDeckDialog
        visible: false
        title: "Create A Deck Card"
        standardButtons: StandardButton.Save | StandardButton.Cancel

        onAccepted: {
            console.log("Title of the Deck: " + textin_deck_title.getText(0,textin_deck_title.length));
            num_cells_added++;
            //TODO fix the below by adding the alg to add new row
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
            case 10:
                sq10.visible = true;
                tq10.text = textin_deck_title.getText(0,textin_deck_title.length);
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
      ToolButton {
        Text {
            id: note_count
            color: "red"

            text: numcard + "/" + FirstCard.currentCard()

            anchors.right: main_window.right
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
        underline_txt: true;
        anchors.horizontalCenter: main_window.horizontalCenter
        anchors.verticalCenter: main_window.verticalCenter
        anchors.centerIn: parent
    }
    back:
    NoteCard
    {
        id: answer
        visible: false;
        underline_txt: false
        anchors.horizontalCenter: main_window.horizontalCenter
        anchors.verticalCenter: main_window.verticalCenter
        anchors.centerIn: parent

        Button {
            text: "Wrong"
            anchors.left: parent.left
            anchors.bottom: parent.bottom

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    answer.color = "red";
                    console.log("Wrong");
                    flipable.flipped = !flipable.flipped
                    question.visible = !question.visible;
                    answer.visible = !answer.visible;
                }
            }
        }
        Button {
            text: "Correct"
             anchors.right: parent.right
             anchors.bottom: parent.bottom
        }
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
        font.pointSize: 35
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

        Rectangle { Text {text:"Math\n 📊"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { math(); note_count.text = numcard + "/" + FirstCard.currentCard();}}}
        Rectangle { Text {text:"Science\n 🔬"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea {anchors.fill: parent;  onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { Text {text:"Important\n‼️"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { Text {text:"Midterm \n📝"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { Text {text:"English\n 📚"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { Text {text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}


        Rectangle { id: sq1; Text {id: tq1; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq2; Text {id: tq2; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq3; Text {id: tq3; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq4; Text {id: tq4; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq5; Text {id: tq5; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq6; Text {id: tq6; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq7; Text {id: tq7; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq8; Text {id: tq8; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq9; Text {id: tq9; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}
        Rectangle { id: sq10; Text {id: tq10; text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); note_count.text = numcard + "/" +FirstCard.currentCard();}}}

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
                FirstCard.Shuffle();

                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;

                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
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
                    radius: 1
                }
            }

        id: add_note_card
        text: "📝 New Note Card"
        z: 100
        anchors.right: parent.right
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
                    radius: 1
                }
            }

        id: add_deck
        text: "📚 New Deck"
        z: 100
        anchors.top: add_note_card.bottom
        anchors.right:  parent.right
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
                    radius: 1
                }
            }
        id: delete_deck
        text: "❌ Remove Cards from Deck"

        z: 100
        anchors.top: add_deck.bottom
        anchors.right:  parent.right
        MouseArea {
            anchors.fill: parent
            onClicked: {
                FirstCard.Clear();
                numcard = 0;
                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;

                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
                note_count.text = (numcard) + "/" +FirstCard.currentCard();
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
            note_count.text = (numcard+1) + "/" +FirstCard.currentCard();
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
            if(FirstCard.currentCard() !== 0) {
            if(answer.visible === true)
            {
                flipable.flipped = !flipable.flipped
                question.visible = !question.visible;
                answer.visible = !answer.visible;
            }
            var max = FirstCard.currentCard();
            if(numcard > 0) {
                console.log("pos" + max);
                numcard--;
                note_count.text = (numcard+1) + "/" +FirstCard.currentCard();
            }
            else {
                numcard = max-1;
                console.log("neg" + max);
            }
            }
        }
    }
}


function facts() {
    if(numcard >= 0) {
        console.log("reset");
        FirstCard.Clear();
        numcard = 0;
        flipable.flipped = !flipable.flipped
        question.visible = !question.visible;
        answer.visible = !answer.visible;

        flipable.flipped = !flipable.flipped
        question.visible = !question.visible;
        answer.visible = !answer.visible;
        note_count.text = (numcard) + "/" +FirstCard.currentCard();
    }
    console.log("Facts loaded"+ numcard);
    FirstCard.setNoteCard("Which athlete has won the most Olympic medals?" , "Michael Phelps");

    FirstCard.setNoteCard( "In the movie \"Back to the Future\", what speed did the DeLorean need to reach in order to achieve time travel?","88 mph" );

    FirstCard.setNoteCard( "Which US president was known as \"The Great Communicator\"?", "Ronald Regan");

    FirstCard.setNoteCard( "What are the four main ingredients in beer?", "Grain, hops, yeast, and water");

    FirstCard.setNoteCard( "Who is remembered for his large and stylish signature on the United States Declaration of Independence?", "John Hancock");

    FirstCard.setNoteCard( "On what two days or dates of the year are the day and night of approximately equal length, everywhere on earth?", "Spring and Fall Equinox / September 21, March 21");

    FirstCard.setNoteCard( "Before the Macintosh computer was released in 1984, which Apple computer model introduced such features as the mouse, and the technology of point and click on visual icons?", "LISA");

     FirstCard.setNoteCard( "Name the northernmost and southernmost cities having teams in major league baseball (whether in the United States or Canada).", "SEATTLE Mariners / Miami FLORIDA MARLINS");

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
    }

function math() {
    if(numcard >= 0) {
        console.log("reset");
        FirstCard.Clear();
        numcard = 0;
        flipable.flipped = !flipable.flipped
        question.visible = !question.visible;
        answer.visible = !answer.visible;

        flipable.flipped = !flipable.flipped
        question.visible = !question.visible;
        answer.visible = !answer.visible;
        note_count.text = (numcard) + "/" +FirstCard.currentCard();
    }

    console.log("Math loaded " + numcard);
    FirstCard.setNoteCard("sqrt(69)?" , "8.3");

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
    }


}
