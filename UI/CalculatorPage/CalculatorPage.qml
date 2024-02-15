import QtQuick 2.15
import QtQuick.Controls

Item {

    Rectangle {
        id: mainBackground
        anchors.fill: parent
        color: "#C3C3C3"
    }

    Image {
        id: katronicLogo
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: -20
        }

        width: 130
        height: 57
        source: "file:/home/karlf/KatronicDemoApps/Qt/Katronic_Demo_QtQuick/UI/Assets/katronic-logo.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: outsideDiameterLabel
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 70
        }

        color: "black"
        font.pixelSize: 16
        text: "Outside Diameter"
    }

    Rectangle {
        id: outsideDiameterInputField
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: outsideDiameterLabel.bottom
            topMargin: 5
        }
        width: 208
        height: 34
        color: "#D9D9D9"

        TextInput {
            id: outsideDiameterText
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 24
            text: calculator.outerDiameter
            maximumLength: 14
        }
    }

    Text {
        id: wallThicknessLabel
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: outsideDiameterInputField.bottom
            topMargin: 40
        }

        color: "black"
        font.pixelSize: 16
        text: "Wall Thickness"
    }

    Rectangle {
        id: wallThicknessInputField
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: wallThicknessLabel.bottom
            topMargin: 5
        }
        width: 208
        height: 34
        color: "#D9D9D9"

        TextInput {
            id: wallThicknessText
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 24
            text: calculator.wallThickness
            maximumLength: 14
        }
    }

    Text {
        id: innerDiameterLabel
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: wallThicknessInputField.bottom
            topMargin: 40
        }

        color: "red"
        font.pixelSize: 16
        text: "Inner Diameter"
    }

    Rectangle {
        id: innerDiameterInputField
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: innerDiameterLabel.bottom
            topMargin: 5
        }
        width: 208
        height: 34
        color: "#D9D9D9"

        TextInput {
            id: innerDiameterText
            anchors.centerIn: parent
            color: "red"
            font.pixelSize: 24
            text: calculator.innerDiameter
            maximumLength: 14
            readOnly: true
        }
    }

    Rectangle {
        id: calcButton
        anchors {
            top: innerDiameterInputField.bottom
            topMargin: 40
            left: parent.left
            leftMargin: 100
        }
        width: 140
        height: 40
        color: "#D9D9D9"
        border.color: "black"

        Text {
            id: calcLabel
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 20
            text: "Calculate"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (calculator.outerDiameter !== parseFloat(outsideDiameterText.text) || calculator.wallThickness !== parseFloat(wallThicknessText.text)) {
                    calculator.calculateInnerDiameter(parseFloat(outsideDiameterText.text), parseFloat(wallThicknessText.text));
                }   else {
                    calculator.calculateInnerDiameter(calculator.outerDiameter, calculator.wallThickness);
                }
            }
        }
    }

    Rectangle {
        id: geometryButton
        anchors {
            top: innerDiameterInputField.bottom
            topMargin: 40
            right: parent.right
            rightMargin: 100
        }
        width: 140
        height: 40
        color: "#D9D9D9"
        border.color: "black"

        Text {
            id: geometryLabel
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 20
            text: "Geometry"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                mainLoader.source = "./UI/GeometryPage/GeometryPage.qml"
            }
        }
    }

    Text {
        id: unitLabel
        anchors {
            top: parent.top
            topMargin: 70
            left: outsideDiameterLabel.right
            leftMargin: 110
        }

        color: "black"
        font.pixelSize: 16
        text: "Unit"
    }

    ComboBox {
        id: unitComboBox
        anchors {
            top: unitLabel.bottom
            topMargin: 5
            left: outsideDiameterInputField.right
            leftMargin: 40
        }
        width: 90
        height: 34
        model: [ "mm", "cm", "m", "inch" ]
        currentIndex: calculator.getUnitIndex();
        onCurrentTextChanged: {
            calculator.setOuterDiameter(calculator.convertToUnit(calculator.outerDiameter, currentText));
            calculator.setWallThickness(calculator.convertToUnit(calculator.wallThickness, currentText));
            calculator.setInnerDiameter(calculator.convertToUnit(calculator.innerDiameter, currentText));
            calculator.setUnit(currentText);
        }
    }
}
