/*************************************************************
* Author:           Joseph Maurer
* Filename:         notecard.cpp
* Date Created:     4/14/16
* Modifications:	4/14/16 Basic class layout
**************************************************************/

#include "notecard.h"

notecard::notecard(QString question, QString answer) : m_question(question), m_answer(answer), m_correct(0)
{}
QString notecard::get_question()
{
    return m_question;
}

void notecard::set_question(QString question)
{
    m_question = question;
}

QString notecard::get_answer()
{
    return m_answer;
}

void notecard::set_answer(QString answer)
{
    m_answer = answer;
}

int notecard::is_correct()
{
    return m_correct;
}

void notecard::set_correct(int correct)
{
    m_correct = correct;
}

