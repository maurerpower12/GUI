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

    bool check_answer(QString user_answer);

    int number_of_times_correct();
    int number_of_times_wrong();
private:
    QString m_question;
    QString m_answer;
    int m_num_correct;
    int m_num_wrong;
};

#endif // NOTECARD_H

