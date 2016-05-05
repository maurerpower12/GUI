//#ifndef DECK_H
//#define DECK_H

//#include <QList>
//#include <QObject>
//#include <list>
//#include "notecard.h"
//#include <QString>
//using std::string;
//class deck : public QObject
//{
//public:
//public slots:
//    deck();
//    void add_notecard(notecard pass);
//    int get_numcards();
//    void remove_notecard(notecard pass);
//    void delete_deck();
//private:
//    QList<const notecard> m_deck;
//    //std::list<notecard> m_deck;
//    int m_num_cards;

//};

//#endif // DECK_H


/************************************************************************
* Class: Deck
* Updates:
*	1. Now updated to include the copy ctor and op=
*
* Overview:
*		This class makes a deck of playing and has the ability to
*		shuffle those cards and deal one of them. Used in conjunction
*		the the Card class(:
*
* Constructors:
*	Deck()
*		Makes the deck of cards in order and by suit.
*
* Mutators:
*	None.
*
* Methods:
*	void Shuffle()
*		This method randomly shuffles the deck.
*	Card Deal(int m_currentCard)
*		Deals one card but does not display it.
*	static int Getdealtcount()
*		Returns the count of the dealt cards
*	static void Resetdealtcount()
*		Resets the amount of dealt cards to 0
*	~Deck()
*		Gives the memory that was allocated during the program
*		back to the operating system.
*************************************************************************/
#ifndef DECK_H
#define DECK_H

#include "notecard.h"
#include "Random.h"
#include <QStack>
#include <iostream>
using std::cout;

class Deck : public QObject
{
    Q_OBJECT
public:
    // Instantiates the deck of cards
    Deck();
public slots:
    int currentCard();
    // get the question for the card
    QString getQuestion(int index);
     QString getAnswer(int index);
private:
    //Used in shuffle
    Random rand;
    // Var of deck of cards
    //QStack<notecard> m_deck;
    notecard * m_deck[52];
    //Current card to be dealt
    int m_currentCard;
};
#endif
