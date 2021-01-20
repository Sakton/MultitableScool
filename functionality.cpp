#include <random>

#include "functionality.h"
#include <algorithm>
#include <QDebug>
#include <QSysInfo>

Functionality::Functionality(QObject *parent): QObject(parent),
                                                m_status{0},
                                                m_randImgNum{0},
                                                operatingSystem{QSysInfo::productType()}
{
    this->setParametrsDependingOn(this->status());
}

int Functionality::status()const
{
    return m_status;
}

int Functionality::randImgNum() const
{
    return qrand() % 4;
}

void Functionality::setRandImgNum(int randImgNum)
{
    if (m_randImgNum == randImgNum)
        return;

    m_randImgNum = randImgNum;
    emit randImgNumChanged(m_randImgNum);
}

int Functionality::getNumAtIndex(int index) const
{
//    if(index < array.size())
        return array.at(index);
//    return 0;
}

int Functionality::getNumAtIndexKrangArray(int index) const
{
//    if(index < krangArray.size())
        return krangArray.at(index);
        //    return 0;
}

QString Functionality::getOperatingSystem() const
{
    return operatingSystem;
}

void Functionality::clickNumNable()
{
    shuffleArray(shuffleArr);
}

void Functionality::setStatus(int status)
{
    this->m_status = status;
    this->setParametrsDependingOn(this->m_status);
}

int Functionality::getNumArraysShuffle(int index) const
{
    if(index < static_cast<int>(shuffleArr.size()))
        return shuffleArr.at(index);
    return 0;
}

void Functionality::shuffleArray(Vector &arr)
{
    std::shuffle(arr.begin(), arr.end(), std::mt19937(std::random_device()()));
}

void Functionality::setParametrsDependingOn(const int status)
{
    switch (status) {
        case 0:
            break;
        case 1:
            shuffleArray(shuffleArr);
            break;
        case 2:
            shuffleArray(krangArray);
            break;
    }
}
