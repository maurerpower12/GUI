import QtQuick 2.0
MyDialog {
    id: dialog
    property alias inner_text: dialog.inner_txt
    color: "#f2f2f2"
    width: parent.width
    height: parent.height
    radius: 25

    inner_txt: "default"


    MyButton {
        id: btn
        color: "light blue"
        inner_txt: "Quit"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
            MouseArea {
                onClicked: {
                    main_window.close();
                }
            }
    }
}
