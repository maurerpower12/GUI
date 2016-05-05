#include "Deck.h"

/**************************************************************
*	  Purpose: Creates the deck of cards
*
*         Entry: none.
*
*          Exit:  A deck of cards in order by suit and number
*
****************************************************************/
Deck::Deck() : m_currentCard(0)
{
        m_deck[m_currentCard] = new notecard("Which athlete has won the most Olympic medals?", "Michael Phelps");
        m_currentCard++;
        m_deck[m_currentCard] = new notecard("In the movie \"Back to the Future\", what speed did the DeLorean need to reach in order to achieve time travel?", "88 mph");
        m_currentCard++;
        m_deck[m_currentCard] = new notecard("Which US president was known as \"The Great Communicator\"?", "Ronald Regan");
        m_currentCard++;
        m_deck[m_currentCard] = new notecard("What are the four main ingredients in beer?", "Grain, hops, yeast, and water");
        m_currentCard++;
        m_deck[m_currentCard] = new notecard("Who is remembered for his large and stylish signature on the United States Declaration of Independence?", "John Hancock");
        m_currentCard++;
        m_deck[m_currentCard] = new notecard("On what two days or dates of the year are the day and night of approximately equal length, everywhere on earth?", "Spring and Fall Equinox / September 21, March 21");
        m_currentCard++;
        m_deck[m_currentCard] = new notecard("Before the Macintosh computer was released in 1984, which Apple computer model introduced such features as the mouse, and the technology of point and click on visual icons?", "LISA");
        m_currentCard++;
        m_deck[m_currentCard] = new notecard("Name the northernmost and southernmost cities having teams in major league baseball (whether in the United States or Canada).", "SEATTLE Mariners / Miami FLORIDA MARLINS");
        m_currentCard++;
        m_currentCard++; // acura
}
int Deck::currentCard()
{
    return m_currentCard;
}
QString Deck::getQuestion(int index)
{
    return m_deck[index]->get_question();
}
QString Deck::getAnswer(int index)
{
    return m_deck[index]->get_answer();
}


