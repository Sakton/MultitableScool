#ifndef FUNCTIONALITY_H
#define FUNCTIONALITY_H

#include <QObject>
#include <vector>

using Vector = std::vector<int>;
enum class Os{
    Os_WINDOWS = 0, Os_ANDROID
};

class Functionality : public QObject
{
    Q_OBJECT

    //определение свойств для доступа из QML слоя
    Q_PROPERTY(int status READ status WRITE setStatus NOTIFY statusChanged)
    Q_PROPERTY(int randImgNum READ randImgNum WRITE setRandImgNum NOTIFY randImgNumChanged)

    public:
    explicit Functionality(QObject *parent = nullptr);

    int status()const;
    int randImgNum() const;

    signals:
    //сигнал -
    void statusChanged(int status);
    void randImgNumChanged(int randImgNum);

    public:
    //сеттеры
    void setRandImgNum(int randImgNum);

    //слот
    public slots:
    void setStatus(int status);
    void setParametrsDependingOn(int status);
    int getNumAtIndex(int index) const;
    int getNumArraysShuffle(int index) const;
    int getNumAtIndexKrangArray(int index) const;
    Q_INVOKABLE QString getOperatingSystem()const;
    void clickNumNable();

    private:
    //перемешивалка обычного массива
    void shuffleArray(Vector &arr);

    private:
    //вектор базовый
    Vector array{1, 2, 3, 4, 5, 6, 7, 8, 9};
    //вектор кренговый он же и будет перемешиваться
    Vector krangArray{2, 3, 4, 5, 6, 7, 8, 9};
    //копия базового для мешалки
    Vector shuffleArr{array};

    int m_status;
    int m_randImgNum;
    QString operatingSystem;
};

#endif // FUNCTIONALITY_H
