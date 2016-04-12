import QtQuick 2.6

Rectangle {
    id: main_btn
    property alias mouseArea: mouseArea
    width: parent.width / 5
    height: parent.height / 9
    radius: 5



    Text {
        id: name_btn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text:"Note cards"
        font.bold: true
    }


    MouseArea {
        id:mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: {
            color = "red";

        }

        onExited: {
            color = "orange";
        }
        onEntered: {
            color = "light green";
        }
    }

}
