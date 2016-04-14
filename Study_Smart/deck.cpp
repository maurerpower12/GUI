#include "deck.h"


deck::deck()
{
    m_num_cards = 0;
}

void deck::add_notecard(notecard & pass)
{
    //m_deck.append(pass);
    m_deck[m_num_cards] = pass;
    m_num_cards++;
}

int deck::get_numcards()
{
    return m_num_cards;
}

void deck::remove_notecard(notecard & pass)
{
//    for(int i(0); i < m_num_cards; i++)
//    {
//        m_deck.removeOne(pass);
//    }
}

void deck::delete_deck()
{
//    int temp = m_num_cards;
//    for(int i(0); i < temp; i++)
//    {
//        m_deck.removeLast();
//        m_num_cards--;
//    }
}

