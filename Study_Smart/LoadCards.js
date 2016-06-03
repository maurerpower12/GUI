

function facts() {
    if(numcard >= 0) {
        resetClear();
    }
    console.log("Facts loaded ");
    FirstCard.setNoteCard("Which athlete has won the most Olympic medals?" , "Michael Phelps");

    FirstCard.setNoteCard( "In the movie \"Back to the Future\", what speed did the DeLorean need to reach in order to achieve time travel?","88 mph" );

    FirstCard.setNoteCard( "Which US president was known as \"The Great Communicator\"?", "Ronald Regan");

    FirstCard.setNoteCard( "What are the four main ingredients in beer?", "Grain, hops, yeast, and water");

    FirstCard.setNoteCard( "Who is remembered for his large and stylish signature on the United States Declaration of Independence?", "John Hancock");

    FirstCard.setNoteCard( "On what two days or dates of the year are the day and night of approximately equal length, everywhere on earth?", "Spring and Fall Equinox / September 21, March 21");

    FirstCard.setNoteCard( "Before the Macintosh computer was released in 1984, which Apple computer model introduced such features as the mouse, and the technology of point and click on visual icons?", "LISA");

     FirstCard.setNoteCard( "Name the northernmost and southernmost cities having teams in major league baseball (whether in the United States or Canada).", "SEATTLE Mariners / Miami FLORIDA MARLINS");

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;


    }

function math() {
    if(numcard >= 0) {
        resetClear();
    }

    console.log("Math loaded ");
    FirstCard.setNoteCard("sqrt(69)?" , "8.3");
    FirstCard.setNoteCard("2+2?" , "4");
    FirstCard.setNoteCard("What is 10*9*8*7*6*5*4*3*2*1 ?" , "3,628,800");
    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
    }

function science() {
    if(numcard >= 0) {
        resetClear();
    }

    console.log("Science loaded");
    FirstCard.setNoteCard("What planet is named for the Roman god of commerce, travel, and thievery?" , "Mercury, messenger of the gods");
    FirstCard.setNoteCard("Name all the planets in our solar system without a moon." , "MERCURY / VENUS");
    FirstCard.setNoteCard("What plant kingdom includes yeasts, molds, and mushrooms?" , "FUNGI");
    FirstCard.setNoteCard("Chemistry: acid will turn litmus paper what color?" , "RED");
    FirstCard.setNoteCard("True or false- most of the dust in your home is made of human skin?" , "True - up to 70%!");
    FirstCard.setNoteCard("Can you lick your elbow?" , " No. Now be honest, did you try?");
    FirstCard.setNoteCard("What is the hardest substance in the human body?" , "Tooth enamel.");

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
}

function history() {
    if(numcard >= 0) {
        resetClear();
    }

    console.log("History loaded");
    FirstCard.setNoteCard("In 1804, Meriwether Lewis and William Clark began the first exploration of the American west, from what city? b. And they followed what river westward for 1,000 miles ? c. And they reached the Pacific in what state?" , "a. St. Louis b. Missouri c. Oregon");
    FirstCard.setNoteCard("Around 1790 Spanish explorers, and later Captain George Vancouver, discovered the San Juan Islands, located today in which state?" , "WASHINGTON");
    FirstCard.setNoteCard("The first Crusade began around the end of which century?" , "11th");
    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
}

function midterm() {
    if(numcard >= 0) {
        resetClear();
    }

    console.log("Midterm loaded");
    FirstCard.setNoteCard("What is the capital of Chile?" , "Santiago");
    FirstCard.setNoteCard("Which US President was responsible for the \"Louisiana Purchase\"?" , "WASHINGTON");
    FirstCard.setNoteCard("In 1701, who invented the seed-planting drill?" , "Jethro Tull");

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
}

function important() {
    if(numcard >= 0) {
        resetClear();
    }

    console.log("Important loaded");
    FirstCard.setNoteCard("What was the name of Henry Ford's only son?" , "Edsel");
    FirstCard.setNoteCard("Who was the number 1 ranked male tennis player the most years during the 1970’s?" , "Jimmy Connors");
    FirstCard.setNoteCard("In which sport would you be judged on your pike or your jack knife?" , "Diving");

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
}

function decksetup(){
    correct_canvas.currentValue = 0;
    correct_canvas.maximumValue = FirstCard.currentCard();
    wrong_canvas.currentValue = 0;
    wrong_canvas.maximumValue = FirstCard.currentCard();

    correct_canvas.text = "Correct"

    //loading canvas stuff
    note_count.text = (numcard+1) + "/" + FirstCard.currentCard();
    loading_canvas.currentValue = numcard+1;
    loading_canvas.maximumValue = FirstCard.currentCard();
}

function resetClear() {
    console.log("reset");
    FirstCard.clear();
    numcard = 0;
    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;

    flipable.flipped = !flipable.flipped
    question.visible = !question.visible;
    answer.visible = !answer.visible;
    note_count.text = (numcard+1) + "/" +FirstCard.currentCard();
    loading_canvas.currentValue = (numcard+1);
    loading_canvas.maximumValue = FirstCard.currentCard();
}
