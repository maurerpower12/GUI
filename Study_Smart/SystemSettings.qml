import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4


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

        Rectangle { Text {text:"Math\n 📊"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { math(); decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Science\n 🔬"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea {anchors.fill: parent;  onPressed: { science(); decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Important\n‼️"; font.pointSize: 19; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { important(); decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Midterm \n📝"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  onPressed: { midterm(); decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"History \n 📚"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent;  onPressed: { history(); decksetup(); } onPressAndHold: { parent.visible = false; }}}
        Rectangle { Text {text:"Facts\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { facts(); decksetup();} onPressAndHold: { parent.visible = false; }}}


        Rectangle { id: sq1; Text {id: tq1; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq2; Text {id: tq2; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq3; Text {id: tq3; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq4; Text {id: tq4; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq5; Text {id: tq5; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq6; Text {id: tq6; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq7; Text {id: tq7; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq8; Text {id: tq8; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}
        Rectangle { id: sq9; Text {id: tq9; text:"📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { anchors.fill: parent; onPressed: { decksetup();}}}

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

