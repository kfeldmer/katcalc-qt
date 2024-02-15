import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.example

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Pipe Calculator")

    Calculator {
        id: calculator
    }

    Component.onCompleted: {
        // Initial calculation
        calculator.calculateInnerDiameter(800.00, 10.00);
    }

    Loader {
        id: mainLoader
        anchors.fill: parent
        source: "./UI/HomeScreen/HomeScreen.qml"
    }
}
