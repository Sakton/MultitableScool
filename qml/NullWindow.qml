import QtQuick 2.0

Item {
	implicitWidth: 600
	implicitHeight: 400
	width: implicitWidth
	height: implicitHeight
	Rectangle {
		anchors.fill: parent
		Image {
			id: fon
			anchors.fill: parent
			source: "qrc:/img/teenage-mutant-ninja-turtles.jpg"
		}
	}
}
