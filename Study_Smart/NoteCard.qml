import QtQuick 2.6


//Rectangle {
//    id: rect_notecard
//    property alias underline_txt: ti_usernamefield.font.underline

//    width: parent.width / 2
//    height: parent.height / 3
//    radius: 5
//    TextInput
//    {
//        id: ti_usernamefield
//        text:
//        {
//            if(question.visible) {
//                acura_question.visible = false;
//                    FirstCard.getQuestion(numcard);
//            }

//            else {
//                acura_question.visible = false;
//                    FirstCard.getAnswer(numcard);
//            }
//        }
//        focus: true
//        font.pixelSize: 20
//        width: rect_notecard.width
//        wrapMode: Text.WordWrap
//        anchors.horizontalCenter: rect_notecard.horizontalCenter
//        anchors.verticalCenter: rect_notecard.verticalCenter
//        anchors.centerIn: parent

//        Keys.onReturnPressed:
//        {
//            //FirstCard.set_question(ti_usernamefield.text);
//            ti_usernamefield.text = FirstCard.getQuestion(numcard);
//        }

//    }


////    Image {
////        id: acura_question
////        source: "Acura.jpg"
////        anchors.fill: parent
////        visible: false;
////    }
////    Image {
////        id: nissan_question
////        source: "Nissan.jpg"
////        anchors.fill: parent
////        visible: false;
////    }

////    function displayImageQuestion() {
////        switch (numcard ){
////            case 8:
////            acura_question.visible = true;
////                break;

////        }
////    }

//}




Rectangle {
    id: rect_notecard
    property alias underline_txt: txt_q_or_a.font.underline
    property alias txt_in: txt_q_or_a.selectedText
    width: parent.width / 2
    height: parent.height / 3
    radius: 5
        TextInput
        {
            id: txt_q_or_a
            text: {
            if(question.visible) {
             FirstCard.getQuestion(numcard);
            }

            else {
               FirstCard.getAnswer(numcard);
            }
           }
            //text: "hi"
            focus: true
            font.pixelSize: 20
            width: rect_notecard.width
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: rect_notecard.horizontalCenter
            anchors.verticalCenter: rect_notecard.verticalCenter
            anchors.centerIn: parent
        }

}
