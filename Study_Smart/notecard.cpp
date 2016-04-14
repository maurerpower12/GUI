/*************************************************************
* Author:           Joseph Maurer
* Filename:         notecard.cpp
* Date Created:     4/14/16
* Modifications:	4/14/16 Basic class layout
**************************************************************/

#include "notecard.h"

notecard::notecard(QString question, QString answer) : m_question(question), m_answer(answer)
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

bool notecard::check_answer(QString user_answer)
{
    bool grade = false;
    if(m_answer != nullptr)
    {
        if(user_answer == m_answer)
        {
            grade = true;
            m_num_correct++;
        }
        else
        {
            grade = false;
            m_num_wrong++;
        }
        return grade;
    }
    else
    {
        //cout << "Error" << endl;
    }
    return false;
}

int notecard::number_of_times_correct()
{
    return m_num_correct;
}

int notecard::number_of_times_wrong()
{
    return m_num_wrong;
}
