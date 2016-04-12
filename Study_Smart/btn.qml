import QtQuick 2.6

Rectangle {
    id: main_btn
    width: parent.width / 2
    height: parent.height

    Text {
        id: name_btn
        horizontalAlignment: main_btn.horizontalCenter
        verticalAlignment: main_btn.verticalCenter
        text:"Note cards"
        font.bold: true
    }
}
