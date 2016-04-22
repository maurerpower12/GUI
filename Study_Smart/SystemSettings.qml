import QtQuick 2.6

Rectangle {
    id: rect_menu
    //property alias goaway: settingsGoAway.start();
    //property alias presnt: settingsInto2.start();
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
        //font.weight: 15
    }
//        TextInput {
//            id: txtin_color
//            text: "Background Color!"
//            font.weight: Font.DemiBold
//            focus: true
//            Keys.onReturnPressed:
//            {
//                main_window.color = txtin_color.getText(0,txtin_color.length);
//            }
//        }
    Text {
        id: txt_color_title
        text: "Background Color:"
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: txt_settings_title.bottom
    }
    Grid {
        id: colorPicker
        x: 4;
        //anchors.bottom: page.bottom; anchors.bottomMargin: 4
        rows: 2; columns: 3; spacing: 3
        anchors.horizontalCenter: parent.horizontalCenter;
        //anchors.verticalCenterOffset: parent.top
        anchors.top: txt_color_title.bottom
        y: 15

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
