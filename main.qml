import QtQuick
import QtQuick.Controls.Basic
import QmlCppExample

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML and Cpp integration")

    LumberSawController {
        id: sawController
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "Lumber mill control center"
            anchors.horizontalCenter: parent.horizontalCenter

            font.pointSize: 18
        }

        Text {
            text: "Saw 1"
            anchors.horizontalCenter: parent.horizontalCenter

            font.pointSize: 14
        }

        AnimatedImage {
            id: sawImage
            width: 200
            height: 200

            playing: sawController.isWorking
            source: "assets/circular-saw.gif"
            speed: sawController.sawSpeed
        }

        Row {
            spacing: 10

            Button {
                text: "Start"

                onClicked: {
                    sawController.start()
                }
            }

            Button {
                text: "Stop"

                onClicked: {
                    sawController.stop()
                }
            }
        }

        Slider {
            id: slider

            width: 200

            from: 0
            to: 5

            value: sawController.sawSpeed

            onValueChanged: {
                sawController.sawSpeed = value
            }
        }
    }

    Image {
        width: 100
        height: 24

        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: 10
        }

        source: "assets/built-with-qt-badge.png"
    }
}
