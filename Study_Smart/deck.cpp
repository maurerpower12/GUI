#include "deck.h"


deck::deck()
{
    m_num_cards = 0;
}

void deck::add_notecard(notecard pass)
{
    pass.get_question();
    // Find out if I need to use a QList or stl List
    //m_deck.push_front(pass);

    //m_deck.append(pass);

    m_num_cards++;
}

int deck::get_numcards()
{
    return m_num_cards;
}

void deck::remove_notecard(notecard pass)
{
    pass.get_question();
    //m_deck.remove(pass);
}

void deck::delete_deck()
{
    int temp = m_num_cards;
    for(int i(0); i < temp; i++)
    {
        //m_deck.pop_back();
        m_num_cards--;
    }
}

