/*************************************************************
* Author:           Joseph Maurer
* Filename:         notecard.h
* Date Created:     4/14/16
* Modifications:	4/14/16 Basic class layout
**************************************************************/

#ifndef NOTECARD_H
#define NOTECARD_H

#include <QString>
#include <QObject>
#include <QDebug>

class notecard : public QObject
{
    Q_OBJECT
public:
        notecard(QString question, QString answer);
public slots:
    QString get_question();
    void set_question(QString question);

    QString get_answer();
    void set_answer(QString answer);

    int is_correct();
    void set_correct(int correct);
private:
    QString m_question;
    QString m_answer;
    int m_correct;
    // 0 = not set
    // 1 = correct
    // 2 = wrong
};

#endif // NOTECARD_H

