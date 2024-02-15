import QtQuick 2.15

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

    Rectangle {
        id: outerCircle
        anchors {
            top: parent.top
            topMargin: 50
            right: parent.right
            rightMargin: 70
        }

        width: 302
        height: 287
        radius: 180
        color: "#D9D9D9"

        Rectangle {
            id: innerCircle
            anchors.centerIn: parent
            width: 203
            height: 195
            radius: 180
            color: "#DA3030"
        }
    }

    Text {
        id: outsideDiameterLabel
        anchors {
            top: katronicLogo.bottom
            topMargin: 40
            left: parent.left
            leftMargin: 20
        }

        color: "black"
        font.pixelSize: 16
        text: "Outside Diameter"
    }

    Text {
        id: outsideDiameterText
        anchors {
            top: outsideDiameterLabel.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 20
        }

        color: "black"
        font.pixelSize: 12
        text: calculator.outerDiameter.toFixed(2) + " " + calculator.unit
    }

    Text {
        id: wallThicknessLabel
        anchors {
            top: outsideDiameterText.bottom
            topMargin: 20
            left: parent.left
            leftMargin: 20
        }

        color: "black"
        font.pixelSize: 16
        text: "Wall Thickness"
    }

    Text {
        id: wallThicknessText
        anchors {
            top: wallThicknessLabel.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 20
        }

        color: "black"
        font.pixelSize: 12
        text: calculator.wallThickness.toFixed(2) + " " + calculator.unit
    }

    Text {
        id: innerDiameterLabel
        anchors {
            top: wallThicknessText.bottom
            topMargin: 20
            left: parent.left
            leftMargin: 20
        }

        color: "red"
        font.pixelSize: 16
        text: "Inner Diameter"
    }

    Text {
        id: innerDiameterText
        anchors {
            top: innerDiameterLabel.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 20
        }

        color: "red"
        font.pixelSize: 12
        text: calculator.innerDiameter.toFixed(2) + " " + calculator.unit
    }

    Rectangle {
        id: outsideDiameterLine
        width: 135
        height: 2
        color: "black"
        anchors {
            top: katronicLogo.bottom
            topMargin: 50
            left: outsideDiameterLabel.right
            leftMargin: 10
        }
    }

    Rectangle {
        id: wallThicknessLine
        width: 160
        height: 2
        color: "black"
        anchors {
            top: outsideDiameterLine.bottom
            topMargin: 55
            left: wallThicknessLabel.right
            leftMargin: 10
        }
    }

    Rectangle {
        id: innerDiameterLine
        width: 182
        height: 2
        color: "black"
        anchors {
            top: wallThicknessLine.bottom
            topMargin: 55
            left: innerDiameterLabel.right
            leftMargin: 10
        }
    }

    Rectangle {
        id: backButton
        anchors {
            top: innerDiameterText.bottom
            topMargin: 140
            left: parent.left
            leftMargin: 40
        }
        width: 140
        height: 40
        color: "#D9D9D9"
        border.color: "black"

        Text {
            id: backLabel
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 20
            text: "Back"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: mainLoader.source = "./UI/CalculatorPage/CalculatorPage.qml"
        }
    }
}
