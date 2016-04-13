import QtQuick 2.5

Rectangle {
    property alias mouseArea:mouseArea
    property real  maximumDragX:0
    property real  maximumDragY:0
    property alias drag:mouseArea.drag
    property alias inner_txt: not.inner_txt
    property alias btn_txt: btn.inner_txt

    id: outer
    width: parent.width / 2
    height: parent.height / 2
    radius: 5
    color: "white"

    MyButton {
        id: btn
        color: "light blue"
        inner_txt: "Edge"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }

    Notification {
        id: not
        not_color: "light blue"
        inner_txt: "Inside the rectangle"
        time_in: 1000

        MouseArea {
            id:mouseArea
            anchors.fill: parent
            drag.target: parent
            drag.maximumX: outer.width
            drag.maximumY: outer.height
        }
    }
}
