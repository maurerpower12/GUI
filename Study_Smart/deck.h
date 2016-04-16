#ifndef DECK_H
#define DECK_H

#include <QList>
#include "notecard.h"
class deck
{
public:
public slots:
    deck();
    void add_notecard(const notecard & pass);
    int get_numcards();
    void remove_notecard(const notecard & pass);
    void delete_deck();
private:
    QList<notecard *> m_deck;
    int m_num_cards;

};

#endif // DECK_H
