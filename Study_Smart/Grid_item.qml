import QtQuick 2.0

Item {
    Rectangle { Text {id:inner_deck_name; text:"\n 📓"; font.pointSize: 20; } color: "light grey"; width: 80; height: 80; MouseArea { id:grid_item_ma; anchors.fill: parent; onPressed: { facts(); note_count.text = FirstCard.currentCard();}}}

}
