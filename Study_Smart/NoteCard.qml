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
            if(question.visible) {
                acura_question.visible = false;
                if(numcard !== 8) {
                    FirstCard.getQuestion(numcard);
                }
                else if(numcard == 8) {
                    acura_question.visible = true;
//                    ti_usernamefield.text = "Company logo?"
//                    ti_usernamefield.z = 100
                }
            }

            else {
                acura_question.visible = false;
                if(numcard !== 8 ) {
                    FirstCard.getAnswer(numcard);
                }
                 else if(numcard == 8) {
//                    console.log("flip acura");
//                    //answer.visible = true
//                     acura_question.visible = false;
                     //ti_usernamefield.text = "Company logo: Acura"
                    text = "Company Logo"
                 }
            }
        }
        focus: true
        font.pixelSize: 20
        width: rect_notecard.width
        wrapMode: Text.WordWrap
        anchors.horizontalCenter: rect_notecard.horizontalCenter
        anchors.verticalCenter: rect_notecard.verticalCenter
        anchors.centerIn: parent

        Keys.onReturnPressed:
        {
            //FirstCard.set_question(ti_usernamefield.text);
            ti_usernamefield.text = FirstCard.getQuestion(numcard);
        }

    }


    Image {
        id: acura_question
        source: "Acura.jpg"
        anchors.fill: parent
        visible: false;
    }
    Image {
        id: nissan_question
        source: "Nissan.jpg"
        anchors.fill: parent
        visible: false;
    }

    function displayImageQuestion() {
        switch (numcard ){
            case 8:
            acura_question.visible = true;
                break;

        }
    }
}
