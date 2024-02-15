#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QtQml>

class Calculator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double innerDiameter READ innerDiameter WRITE setInnerDiameter NOTIFY innerDiameterChanged)
    Q_PROPERTY(double outerDiameter READ outerDiameter WRITE setOuterDiameter NOTIFY outerDiameterChanged)
    Q_PROPERTY(double wallThickness READ wallThickness WRITE setWallThickness NOTIFY wallThicknessChanged)
    Q_PROPERTY(QString unit READ unit NOTIFY unitChanged)

public:
    Calculator(QObject *parent = nullptr);
    Q_INVOKABLE double calculateInnerDiameter(double outsideDiameter, double wallThickness);
    Q_INVOKABLE double convertToUnit(double value, const QString& targetUnit);

    Q_INVOKABLE void setUnit(const QString& unit);
    Q_INVOKABLE int getUnitIndex();
    QString unit() const;

    double innerDiameter() const;
    double outerDiameter() const;
    double wallThickness() const;

    Q_INVOKABLE void setOuterDiameter(double outerDiameter);
    Q_INVOKABLE void setWallThickness(double wallThickness);
    Q_INVOKABLE void setInnerDiameter(double innerDiameter);


signals:
    void calculateButtonClicked(double outerDiameter, double wallThickness);
    void innerDiameterChanged();
    void outerDiameterChanged();
    void wallThicknessChanged();
    void unitChanged();

private:
    double m_innerDiameter;
    double m_outerDiameter;  // Added outerDiameter property
    double m_wallThickness;  // Added wallThickness property
    QString m_unit;
};

#endif // CALCULATOR_H
