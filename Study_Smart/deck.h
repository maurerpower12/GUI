/************************************************************************
* Class: Deck
* Updates:
*
*
* Overview:
*
*
* Constructors:
*	Deck()
*
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
    ~Deck();
public slots:
    int currentCard();
    // get the question for the card
    QString getQuestion(int index);
    QString getAnswer(int index);

   void setNoteCard(QString qust, QString anw);
   void shuffle();
   void clear();

   void setCorrect(int correct, int index);
   int isCorrect(int index);
   void deleteCard(int index);
   void cleanUp();
private:
    //Used in shuffle
    Random rand;
    // Var of deck of cards
    notecard * m_deck[52];
    //Current card to be dealt
    int m_currentCard;
};
#endif
