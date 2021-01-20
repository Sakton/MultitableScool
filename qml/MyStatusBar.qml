import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

ToolBar {
	id: statusToolBar
	//enum стирает редактор
	//испльзуею инт 0 - LEARN, 1 - TEST, 2 - KRANG
	property int status: 0
	signal callWindow(int tableForNumber)
	objectName: "statusToolBar"

	implicitWidth: 1000
	implicitHeight: 50
	width: implicitWidth
	height: implicitHeight

	RowLayout {
		anchors.fill: parent
		spacing: 1
		Repeater {
			id: repeaterToolButton
			objectName: "repeaterToolButton"
			model: {
				if (status == 0 || status == 1) {
					return 8
				}
				if (status == 2) {
					return 1
				}
			}
			ToolButton {
				Layout.fillWidth: true
				Layout.fillHeight: true
				checkable: true
				checked: false
				onClicked: {
					for (var i = 0; i < repeaterToolButton.count; ++i) {
						if (i == index) {
							repeaterToolButton.itemAt(i).checked = true
							repeaterToolButton.itemAt(i).enabled = false
							callWindow(i + 2)
						} else {
							repeaterToolButton.itemAt(i).checked = false
							repeaterToolButton.itemAt(i).enabled = true
						}
					}
				}

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
					anchors.fill: parent
					text: {
						if (status !== 2) {
							return (index + 2)
						} else {
							return "КРЕНГ!!!"
						}
					}
					font.family: "segoe script"
					font.italic: true
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					font.pointSize: 16
				}
			}
		}
	}
	onStatusChanged: {
		for (var i = 0; i < repeaterToolButton.count; ++i) {
			repeaterToolButton.itemAt(i).checked = false
			repeaterToolButton.itemAt(i).enabled = true
		}
	}
}
