import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

ToolBar {
	id: myToolBars
	property int status: 0
	property int currentIndexButton: 0

	//enum стирает редактор
	//испльзую инт 0 - LEARN, 1 - TEST, 2 - KRANG
	RowLayout {
		anchors.fill: parent
		spacing: 1

		Repeater {
			id: rep
			model: 3
			Layout.alignment: Qt.AlignLeft
			//			Layout.fillWidth: true
			//			Layout.fillHeight: true
			MyToolbarButton {
				id: btn
				Layout.fillWidth: true
				Layout.fillHeight: true
				text: {
					switch (btn.indexToolButton) {
					case 0:
						return "LEARN"
					case 1:
						return "TEST"
					case 2:
						return "KRANG"
					}
				}

				//функция проверка
				function proverka() {
					if (myToolBars.currentIndexButton === btn.indexToolButton) {
						return true
					} else {
						return false
					}
				}

				checked: {
					//функция проверка
					proverka()
				}

				checkable: {
					//функция проверка
					proverka()
				}

				onClicked: {
					myToolBars.status = myToolBars.currentIndexButton = btn.indexToolButton
				}
			}
		}
	}
}
