import QtQuick 2.0


Rectangle {
    id: notification
    property alias not_color: notification.color
    property alias inner_txt: inner_text.text
    property alias time_in: animateInto.duration
    property alias inner_font: inner_text.font.family


    width: parent.width
    height: 100
    y:-100
    radius: 15

    Text {
        id: inner_text
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 3
        text: "Welcome to Study Smart!"
        font.pointSize: 12
        color: "black"
    }


//    MyButton {
//        id: btn
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.right: parent.right;
//        anchors.rightMargin: 10
//        inner_txt: "Exit"

//        color: not_color
//        MouseArea {
//                  anchors.fill: parent
//                  onClicked: {

//                      animateGoAway.start();
//                  }
//              }
//    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right;
        anchors.rightMargin: 10
        text: "X"
        font.family: "Copperplate Gothic Light"

        font.pointSize: 15
        color: "black"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                animateGoAway.start()
            }
        }
    }

    PropertyAnimation {
        Component.onCompleted: {
            notification.visible = true;
            animateInto.start();
        }

        id: animateInto;
        target: notification;
        easing.type: Easing.Linear

        property: "y";
        from: -100
        to: 10
        duration: 1000
    }

    NumberAnimation {
        id: animateGoAway;
        target: notification;
        easing.type: Easing.Linear

        property: "y";
        from: 10
        to: -100
        duration: 1000
        onStopped: notification.visible = false;
   }

   Timer {
        interval: 5000; running: true; repeat: false
        onTriggered: {
            animateGoAway.start();
        }
   }

}




