import QtQuick 2.6

Rectangle {
    id: rect_notecard

    width: parent.width / 2
    height: parent.height / 3
    radius: 5

    TextInput
    {
        id: ti_usernamefield
        text:
        {
            if(question.visible)
                FirstCard.get_question();
            else
                FirstCard.get_answer();
        }
        focus: true
        font.pixelSize: 20
       // wrapMode: ti_usernamefield.Wrap
        anchors.horizontalCenter: rect_notecard.horizontalCenter
        anchors.verticalCenter: rect_notecard.verticalCenter
        anchors.centerIn: parent

        Keys.onReturnPressed:
        {
            FirstCard.set_question(ti_usernamefield.text);
            ti_usernamefield.text = FirstCard.get_question();
        }

    }
}
