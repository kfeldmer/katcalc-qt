#include <QObject>
#include "Backend/calculator.h"

Calculator::Calculator(QObject *parent) : QObject(parent), m_innerDiameter(0.0), m_outerDiameter(0.0), m_wallThickness(0.0)
{
}

double Calculator::calculateInnerDiameter(double outsideDiameter, double wallThickness) {
    m_outerDiameter = outsideDiameter;  // Update outerDiameter property
    m_wallThickness = wallThickness;     // Update wallThickness property

    m_innerDiameter = outsideDiameter - 2 * wallThickness;
    emit calculateButtonClicked(outsideDiameter, wallThickness);
    emit innerDiameterChanged();
    emit outerDiameterChanged();
    emit wallThicknessChanged();

    return m_innerDiameter;
}

double Calculator::innerDiameter() const {
    return m_innerDiameter;
}

double Calculator::outerDiameter() const {
    return m_outerDiameter;
}

double Calculator::wallThickness() const {
    return m_wallThickness;
}

double Calculator::convertToUnit(double value, const QString& targetUnit) {
    const QString currentUnit = m_unit.isEmpty() ? "mm" : m_unit;

    if (currentUnit == targetUnit) {
        return value;
    }

    double result = value;

    // Implement conversion logic based on currentUnit and targetUnit
    if (currentUnit == "mm" && targetUnit == "m") {
        result /= 1000.0;
    } else if (currentUnit == "mm" && targetUnit == "cm") {
        result /= 10.0;
    } else if (currentUnit == "mm" && targetUnit == "inch") {
        result /= 25.4;
    } else if (currentUnit == "m" && targetUnit == "mm") {
        result *= 1000.0;
    } else if (currentUnit == "m" && targetUnit == "cm") {
        result *= 100.0;
    } else if (currentUnit == "m" && targetUnit == "inch") {
        result *= 39.3701;
    } else if (currentUnit == "cm" && targetUnit == "mm") {
        result *= 10.0;
    } else if (currentUnit == "cm" && targetUnit == "m") {
        result /= 100.0;
    } else if (currentUnit == "cm" && targetUnit == "inch") {
        result /= 2.54;
    } else if (currentUnit == "inch" && targetUnit == "mm") {
        result *= 25.4;
    } else if (currentUnit == "inch" && targetUnit == "cm") {
        result *= 2.54;
    } else if (currentUnit == "inch" && targetUnit == "m") {
        result /= 39.3701;
    }
    // Add more conversion cases as needed

    return result;
}

void Calculator::setUnit(const QString& unit) {
    if (m_unit != unit) {
        m_unit = unit;
        emit unitChanged();
    }
}

int Calculator::getUnitIndex() {
    if (m_unit == "mm") {
        return 0;
    }   else if (m_unit == "cm") {
        return 1;
    }   else if (m_unit == "m") {
        return 2;
    }   else if (m_unit == "inch") {
        return 3;
    }   else {
        return 0;
    }
}

QString Calculator::unit() const {
    return m_unit;
}

void Calculator::setOuterDiameter(double outerDiameter) {
    if (m_outerDiameter != outerDiameter) {
        m_outerDiameter = outerDiameter;
        // You might want to emit the signal here if needed
        emit outerDiameterChanged();
    }
}

void Calculator::setWallThickness(double wallThickness) {
    if (m_wallThickness != wallThickness) {
        m_wallThickness = wallThickness;
        // You might want to emit the signal here if needed
        emit wallThicknessChanged();
    }
}

void Calculator::setInnerDiameter(double innerDiameter) {
    if (m_innerDiameter != innerDiameter) {
        m_innerDiameter = innerDiameter;
        // You might want to emit the signal here if needed
        emit innerDiameterChanged();
    }
}

