#include "Deck.h"

/**************************************************************
*	  Purpose: Init var
*
*         Entry: none.
*
*          Exit:  current number of cards is 0
*
****************************************************************/
Deck::Deck() : m_currentCard(0)
{}
int Deck::currentCard()
{
    return m_currentCard;
}
/**************************************************************
*	  Purpose: Returns the string of the question at the
*           index passed in. Its a QString to make it easier to
*           display.
*
*         Entry: A valid index into the array.
*
*          Exit: NULL if not found, otherwise the question.
*
****************************************************************/
QString Deck::getQuestion(int index)
{
    if(m_deck[index] != NULL)
        return m_deck[index]->get_question();
    else
        return NULL;
}
/**************************************************************
*	  Purpose: Returns the string of the answer at the
*           index passed in. Its a QString to make it easier to
*           display.
*
*         Entry: A valid index into the array.
*
*          Exit: NULL if not found, otherwise the answer.
*
****************************************************************/
QString Deck::getAnswer(int index)
{
    if(m_deck[index] != NULL)
        return m_deck[index]->get_answer();
    else
        return NULL;
}
/**************************************************************
*	  Purpose: Sets the note cards question and answer.
*
*         Entry: A valid istring for the q and a.
*
*          Exit: Update m_deck.
*
****************************************************************/
void Deck::setNoteCard(QString qust, QString anw)
{
     m_deck[m_currentCard] = new notecard(qust, anw);
     m_currentCard++;
}
/**************************************************************
*	  Purpose: Shuffles the cards positions in the array
*
*         Entry: None.
*
*          Exit: A shuffled deck of note cards.
*
****************************************************************/
void Deck::shuffle()
{
    notecard * temp = nullptr;// temp to find manipulate cards
    int number = 0;	//random number ditributed

        for ( int x(0); x < m_currentCard ; x++ )
        {
            number = rand.GetRandom(m_currentCard); // Get random integer
            temp = m_deck[x];		// move value over to temp
            m_deck[x] = m_deck[number]; // reassign previously moved
            m_deck[number] = temp; // push into new location
        }
}
/**************************************************************
*	  Purpose: Clears the memory for the deck
*
*         Entry: A deck with notecards in it.
*
*          Exit: A reset deck.
*
****************************************************************/
void Deck::clear()
{
    for ( int x(0); x < m_currentCard ; x++ )
    {
        delete m_deck[x];
        m_deck[x] = nullptr;
    }
    m_currentCard = 0;
}
/**************************************************************
*	  Purpose: Mark the current notecard as correct
*
*     Entry: A valid index into the array, and a bool
*               to set it to.
*     Exit: Sets the underlying var to the passed val.
*
****************************************************************/
void Deck::setCorrect(int correct, int index)
{
    if(m_deck[index] != NULL) {
        m_deck[index]->set_correct(correct);
    }
}
/**************************************************************
*	  Purpose: Returns the status of the card.
*
*         Entry: A valid index into the array.
*
*          Exit: NULL if not found, otherwise the question.
*
****************************************************************/
int Deck::isCorrect(int index)
{
    if(m_deck[index] != NULL) {
        return m_deck[index]->is_correct();
    }
    else
        return false;
}
/**************************************************************
*	  Purpose: Deletes a card in the deck and then cleans up
*                around it.
*
*         Entry: A valid index into the array.
*
*          Exit: NULL if not found, otherwise the card is deleted.
*
****************************************************************/
void Deck::deleteCard(int index)
{
    if(m_deck[index] != NULL) {
        delete m_deck[index];
        m_deck[index] = nullptr;
        cleanUp();
        m_currentCard--;
    }
}
/**************************************************************
*	  Purpose: Condenses the deck so there isn't open spaces.
*
*         Entry: None.
*
*          Exit: None.
*
****************************************************************/
void Deck::cleanUp()
{
    for ( int x(0); x < m_currentCard ; x++ )
    {
        if(m_deck[x] == nullptr)
        {
            int empty_spot = x;
            for ( int a(x+1); a < m_currentCard ; a++ )
            {
                m_deck[empty_spot] = m_deck[a];
                empty_spot++;
            }
        }
    }
}
/**************************************************************
*	  Purpose: Clean up the deck on finish
*
*         Entry: None.
*
*          Exit: None.
*
****************************************************************/
Deck::~Deck()
{
    for ( int x(0); x < m_currentCard ; x++ )
    {
        delete m_deck[x];
        m_deck[x] = nullptr;
        m_currentCard--;
    }
    m_currentCard = 0;
}


