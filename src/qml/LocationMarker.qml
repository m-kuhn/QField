import QtQuick 2.0
import org.qgis 1.0

Item {
    property point location
    property real accuracy
    property MapSettings mapSettings
    property CoordinateTransform coordinateTransform


    Rectangle {
        id: marker
        property point location

        width: accuracy * dp
        height: width
        color: "#330000FF"
        border.color: "#EE0000FF"
        border.width: 1 * dp
        radius: width / 2
        x: location.x - width / 2
        y: location.y - width / 2

        Connections {
            target: mapSettings
            onExtentChanged: {
                marker.location = mapSettings.coordinateToScreen(
                            coordinateTransform.transform(location))
            }
        }

        Rectangle {
            //central point
            width: 10*dp
            height: width

            anchors.centerIn: parent


            radius: width / 2

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation {
                            from: "Mistyrose"
                            to: "Indianred"
                            duration: 3000
                            easing.type: Easing.InOutQuad
                        }
                        ColorAnimation {
                            from: "Indianred"
                            to: "Mistyrose"
                            duration: 2000
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
                GradientStop {
                    position: 1.0
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation {
                            from: "#FCE4EC"
                            to: "#AD1457"
                            duration: 3000
                            easing.type: Easing.InOutQuad
                        }
                        ColorAnimation {
                            from: "#AD1457"
                            to: "#FCE4EC"
                            duration: 2000
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }

        }
    }
}
