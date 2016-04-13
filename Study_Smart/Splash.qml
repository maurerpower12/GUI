import QtQuick 2.0
MyDialog {
    id: dialog
    property alias inner_text: dialog.inner_txt
    color: "grey"
    width: parent.width
    height: parent.height

    radius: 25

    inner_txt: "default"
    btn_txt: "Okay"
}
