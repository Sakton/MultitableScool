import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

ToolButton {
	id: buttonTool
	checkable: true
	checked: true
	text: "LEARN"

	property int indexToolButton: index

	Rectangle {
		anchors.fill: parent
		color: {
			if (this.parent.checked === true) {
				return "yellow"
			} else {
				return "green"
			}
		}
	}

	Text {
		id: text
		text: buttonTool.text
		font.family: "segoe script"
		font.italic: true
		verticalAlignment: Text.AlignVCenter
		horizontalAlignment: Text.AlignHCenter
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		font.pointSize: 16
	}
}
