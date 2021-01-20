import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Particles 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.3

Item {
	id: root
	property int currentIndex: 1
	signal createWindowPrimer(int tableNum, int num)
	property int greedColumns: 3
	property int greedRows: 3
	property int modelCount: 9
	property int tableNum: 2
	//enum стирает редактор
	//испльзуею инт 0 - LEARN, 1 - TEST, 2 - KRANG
	property int status: 0

	implicitWidth: 500
	implicitHeight: 500
	width: {
		implicitWidth
	}
	height: implicitHeight

	GridLayout {
		id: greed
		columns: greedColumns
		rows: greedRows
		columnSpacing: 1
		rowSpacing: 1
		anchors.fill: parent
		Repeater {
			id: repeaterTableButtons
			model: modelCount
			Rectangle {
				id: rect1
				objectName: "rect1"
				Layout.fillWidth: true
				Layout.fillHeight: true

				MyButtonForTable {
					id: btn
					anchors.fill: parent
					tableNum: root.tableNum
					statusApplication: root.status
					onClicked: {
						currentIndex = btnIndex
						popupPrimerWindow.contentItem.num1 = n1
						popupPrimerWindow.contentItem.num2 = n2
						popupPrimerWindow.visible = true
					}

					Connections {
						target: popupPrimerWindow.contentItem
						//						target: popupPrimerWindow.contentItem.item
						onSignalAnswerResult: {
							if (currentIndex == btn.btnIndex) {
								btn.result = res
							}
							popupPrimerWindow.visible = false
						}
					}
				}

				//********************************проба
				//				MyButtonForTable {
				//					id: btn
				//					anchors.fill: parent
				//					tableNum: root.tableNum
				//					statusApplication: root.status
				//					onClicked: {
				//						currentIndex = btnIndex
				//						popupPrimerWindow.contentItem.item.num1 = n1
				//						popupPrimerWindow.contentItem.item.num2 = n2
				//						//						popupPrimerWindow.contentItem.item.num1 = n1
				//						//						popupPrimerWindow.contentItem.item.num2 = n2
				//						popupPrimerWindow.visible = true
				//					}

				//					Connections {
				//						target: popupPrimerWindow.contentItem.item
				//						//						target: popupPrimerWindow.contentItem.item
				//						onSignalAnswerResult: {
				//							if (currentIndex == btn.btnIndex) {
				//								btn.result = res
				//							}
				//							popupPrimerWindow.visible = false
				//						}
				//					}
				//				}

				//********************************проба
			}
		}
	}

	//1111111111111111111111
	//	PopupWindow {
	//		id: popupPrimerWindow
	//		anchors.centerIn: parent
	//		width: parent.width / 2
	//		height: parent.height
	//		contentItem: Loader {
	//			id: ldr
	//			anchors.fill: parent
	//			source: {
	//				setSource("qrc:/qml/MyPrimerWindow.qml", {
	//							  "width": popupPrimerWindow.width,
	//							  "height": popupPrimerWindow.height
	//						  })
	//			}
	//		}
	//	}

	//111111111111111111111111

	//TODO как то тут в зависимости от системы,
	//проблема в contentItem:, с Лоадером плохо
	//	PopupWindow {
	//		id: popupPrimerWindow
	//		anchors.centerIn: parent
	//		width: root.width * 0.5
	//		height: root.height
	//		focus: true

	//		contentItem: MyPrimerWindow {
	//			anchors.fill: parent
	//		}
	//	}
	PopupWindow {
		id: popupPrimerWindow
		focus: true
		x: 0
		y: 0
		width: root.width
		height: root.height * 0.5
		contentItem: MyPrimerWindowForAndroid {
			anchors.fill: parent
		}
	}
}
