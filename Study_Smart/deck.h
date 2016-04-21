#ifndef DECK_H
#define DECK_H

#include <QList>
#include <QObject>
#include <list>
#include "notecard.h"
#include <QString>
using std::string;
class deck : public QObject
{
public:
public slots:
    deck();
    void add_notecard(notecard pass);
    int get_numcards();
    void remove_notecard(notecard pass);
    void delete_deck();
private:
    QList<const notecard> m_deck;
    //std::list<notecard> m_deck;
    int m_num_cards;

};

#endif // DECK_H
