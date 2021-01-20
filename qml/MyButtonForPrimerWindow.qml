import QtQuick 2.0

Item {
	id: root
	width: 300
	height: 150
	signal myClicked
	property string nadpis: "Проверить"

	Item {
		id: rect
		anchors.fill: parent
		state: "one"
		//		border.color: "white"
		//		border.width: 1
		Text {
			id: text
			text: root.nadpis
			font.family: "segoe script"
			anchors.fill: parent
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
			font.pixelSize: parent.height / 2
		}

		MouseArea {
			id: mouseArea
			anchors.fill: parent
			hoverEnabled: true
			onEntered: {
				parent.state = (parent.state == "one") ? "two" : "one"
			}
			onExited: {
				parent.state = (parent.state == "two") ? "one" : "two"
			}
			onClicked: {
				myClicked()
			}
		}

		states: [
			State {
				name: "one"
				PropertyChanges {
					target: text
					color: "lightgreen"
				}
			},
			State {
				name: "two"
				PropertyChanges {
					target: text
					color: "lightblue"
				}
			}
		]
		transitions: [
			Transition {
				from: "one"
				to: "two"
				PropertyAnimation {
					target: text
					property: "color"
					to: "lightblue"
					duration: 1000
				}
			},
			Transition {
				from: "two"
				to: "one"
				PropertyAnimation {
					target: text
					property: "color"
					to: "lightgreen"
					duration: 1000
				}
			}
		]
	}
}
