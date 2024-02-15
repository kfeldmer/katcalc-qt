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
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 30
        }

        width: 308
        height: 192
        source: "file:/home/karlf/KatronicDemoApps/Qt/Katronic_Demo_QtQuick/UI/Assets/katronic-logo.png"
    }

    Rectangle {
        id: pipeCalcButton
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: katronicLogo.bottom
            topMargin: 30
        }
        width: 172
        height: 49
        color: "#D9D9D9"
        border.color: "black"

        Text {
            id: pipeCalcLabel
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 20
            text: "Pipe Calculator"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: mainLoader.source = "./UI/CalculatorPage/CalculatorPage.qml"
        }
    }

    Text {
        id: katcalcDescription
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: pipeCalcButton.bottom
            topMargin: 120
        }

        color: "black"
        font.pixelSize: 16
        text: "KatCalc Software"
    }

    Text {
        id: katcalcVersion
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: katcalcDescription.bottom
            topMargin: 10
        }
        color: "black"
        font.pixelSize: 10
        text: "Version 1.00"
    }

}
