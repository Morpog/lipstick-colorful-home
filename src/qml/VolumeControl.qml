import QtQuick 2.0
import org.nemomobile.lipstick 0.1
//import org.freedesktop.contextkit 1.0
import com.nokia.meego 2.0
import QtQuick.Window 2.1

Item {
    id: volumeWindow

    property bool isPortrait: (orientationAngle == 90 || orientationAngle == 270)

    width: initialSize.width
    height: initialSize.height

    property int orientationAngle : Screen.angleBetween(Screen.primaryOrientation,Screen.orientation)
    onOrientationAngleChanged: {
        console.debug("Changed to Value: "+orientationAngle)
    }

    Item {
        anchors.centerIn: parent
        rotation: volumeWindow.isPortrait ? -90 : 0
        width: volumeWindow.isPortrait ? parent.height : parent.width
        height: volumeWindow.isPortrait ? parent.width : parent.height

        Rectangle {
            id: volumeBar

            height: 24

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                topMargin: 4
            }

            color: "black"
            visible: false

            Rectangle {
                width: parent.width * volumeControl.volume / volumeControl.maximumVolume
                height: parent.height
                color: "magenta"
            }

            Timer {
                id: volumeTimer
                interval: 1500
                onTriggered: {
                    volumeBar.visible = false;
                    volumeControl.windowVisible = false;
                }
            }

            Connections {
                target: volumeControl

                onWindowVisibleChanged: {
                    if (volumeControl.windowVisible) {
                        volumeTimer.restart();
                        volumeBar.visible = true;
                    }
                }

                onVolumeChanged: {
                    if (volumeControl.windowVisible) {
                        volumeTimer.restart();
                    }
                }
            }
        }
    }
}
