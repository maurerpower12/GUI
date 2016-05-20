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
{
        //m_currentCard++; // acura
}
int Deck::currentCard()
{
    return m_currentCard;
}
QString Deck::getQuestion(int index)
{
    if(m_deck[index] == NULL)
         return QString("You don't have any note cards :(");
    return m_deck[index]->get_question();
}
QString Deck::getAnswer(int index)
{
    if(m_deck[index] == NULL)
           return QString("Nope nothing..");
    return m_deck[index]->get_answer();
}

void Deck::setNoteCard(QString qust, QString anw)
{
     m_deck[m_currentCard] = new notecard(qust, anw);
     m_currentCard++;
}
/**************************************************************
*	  Purpose: Randomly shuffles the cards
*
*         Entry: none.
*
*          Exit:  The deck of cards in a random order every time
*
****************************************************************/
void Deck::Shuffle()
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

void Deck::Clear()
{
    for ( int x(0); x < m_currentCard ; x++ )
    {
        m_deck[x] = nullptr;
    }
    m_currentCard = 0;
}



