import QtQuick 2.0
// import QtQuick.Controls 1.4
import QtQuick.Controls 2.1
// !!!!!! используй вторые контролы!
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtGraphicalEffects 1.0

//Делегатам предоставляется index свойство только для чтения, которое указывает индекс делегата в повторителе.
Button {
	id: myButtonForTable
	objectName: "myButtonForTable"

	//удаляет редактор эту запись
	//	enum StateResult{
	//		BAD = 0,
	//		GOOD,
	//		UNKNOWN
	//	}
	property int tableNum: 2
	anchors.fill: parent
	height: 200
	property int n1: {
		if (statusApplication != 2)
			//устанвка этого свойства в табле итем, как аргумента сигнала от статус бара
			tableNum
		else
			cppFunctionality.getNumAtIndexKrangArray(index / 8)
	}

	property int n2: {

		//		if (statusApplication != 2)
		//			cppFunctionality.getNumArraysShuffle(index)
		//		else
		//			cppFunctionality.getNumAtIndexKrangArray(index / 8)
		switch (statusApplication) {
		case 0:
			//берем данные с обычного вектора
			cppFunctionality.getNumAtIndex(index)
			break
		case 1:
			//берем данные с перемешанного вектора
			cppFunctionality.getNumArraysShuffle(index)
			break
		case 2:
			//берем данные с кренг-перемешанного вектора
			cppFunctionality.getNumAtIndexKrangArray(index % 8)
			break
		}
	}
	property int btnIndex: index
	property int statusApplication: 0
	//	property bool correctExample: false
	//к перечислению обращение через имя файла
	//так как енум стирается редактором использую инт
	//начально значение может быть любым кроме 0 и 1
	//0 и 1 проверяемые величины
	property int result: 3
	property alias imgBackground: imgBackground

	onResultChanged: {
		//		imgButton.visible = false
		//		if (result === MyButtonForTable.StateResult.GOOD) {
		if (result == 1) {
			switch (cppFunctionality.randImgNum) {
			case 0:
				btn.imgBackground.source = "qrc:/img/Splinter_Pressure_Points_Shredder.gif"
				break
			case 1:
				btn.imgBackground.source = "qrc:/img/20139-1406139248-1.gif"
				break
			case 2:
				btn.imgBackground.source = "qrc:/img/tumblr_o10b5zxmSs1r2nvplo8_400.gif"
				break
			case 3:
				btn.imgBackground.source = "qrc:/img/tumblr_n0a99jDuGR1r2nvplo5_500.gif"
				break
			default:
				btn.imgBackground.source = "qrc:/img/tumblr_static_tumblr_static__640.gif"
				break
			}

			textButton.text = qsTr("%1x%2=%3").arg(n1).arg(n2).arg(n1 * n2)
			myButtonForTable.checkable = true
			myButtonForTable.checked = true
			myButtonForTable.enabled = false
			// } else if (result === MyButtonForTable.StateResult.BAD) {
		} else if (result == 0) {
			switch (cppFunctionality.randImgNum) {
			case 0:
				btn.imgBackground.source = "qrc:/img/TeenageBad.gif"
				break
			case 1:
				btn.imgBackground.source = "qrc:/img/Teenage-Mutant.gif"
				break
			case 2:
				btn.imgBackground.source = "qrc:/img/tumblr_n9b9ypk2J11r2nvplo1_500.gif"
				break
			case 3:
				btn.imgBackground.source = "qrc:/img/tumblr_o1okt4AZAS1r2nvplo1_1280.gif"
				break
			default:
				btn.imgBackground.source
						= "qrc:/img/tumblr_static_tumblr_static_544vcdduadgkss4k00cgg408w_640.gif"
				break
			}
		}
	}

	background: AnimatedImage {
		id: imgBackground
		objectName: "imgBackground"
		anchors.fill: parent

		source: {
			if (statusApplication != 2) {
				if (btn.n2 === 0 || btn.n2 === 4 || btn.n2 === 9) {
					return "qrc:/img/CHe1.png"
				}
				if (btn.n2 === 1 || btn.n2 === 5) {
					return "qrc:/img/CHe2.png"
				}
				if (btn.n2 === 2 || btn.n2 === 6 || btn.n2 === 8) {
					return "qrc:/img/CHe3.png"
				}
				if (btn.n2 === 3 || btn.n2 === 7) {
					return "qrc:/img/CHe4.png"
				}
			} else {
				return "qrc:/img/TMNT-2007-1.jpg"
			}
		}

		onStatusChanged: {
			playing = (imgBackground.status == AnimatedImage.Ready)
		}
	}

	//	Image {
	//		id: imgButton
	//		objectName: "imgButton"
	//		anchors.fill: parent
	//		source: {
	//			switch (cppFunctionality.randImgNum) {
	//			case 0:
	//				return "qrc:/img/swirl-160625_640.png"
	//			case 1:
	//				return "qrc:/img/abstract-art.png"
	//			case 2:
	//				return "qrc:/img/swirl-160625_640.png"
	//			default:
	//				return "qrc:/img/abstract-art.png"
	//			}
	//		}

	//		fillMode: Image.PreserveAspectFit
	//		clip: true // - //влияет на статус бар - надо включить (обрезать)
	//		transformOrigin: Item.Center

	//		RotationAnimation {
	//			target: imgButton
	//			running: true
	//			loops: Animation.Infinite
	//			from: 0
	//			to: 360
	//			duration: 2000
	//		}
	//	}
	Text {
		id: textButton
		objectName: "text"
		font.pixelSize: parent.height / 3
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		verticalAlignment: Text.AlignVCenter
		horizontalAlignment: Text.AlignHCenter
		font.italic: true
		font.family: "segoe script"
		font.bold: true
		text: {
			if (statusApplication == 0)
				return (status != 3) ? ("%1x%2=?").arg(btn.n1).arg(
										   btn.n2) : "?????"
			else if (statusApplication != 0)
				return "?????"
			//			return ("%1x%2=?").arg(btn.n1).arg(btn.n2)
		}
		color: "lightblue"
		layer.enabled: true
		layer.effect: DropShadow {
			id: shadowText
			horizontalOffset: 0
			verticalOffset: 0
			transparentBorder: true
			radius: 5
			spread: 1
			samples: 25
			color: "green"

			ParallelAnimation {
				// анимашка тени видится только тут
				running: true
				loops: Animation.Infinite
				SequentialAnimation {
					PropertyAnimation {
						target: shadowText
						property: "color"
						to: "magenta"
						duration: 1000
					}
					PropertyAnimation {
						target: shadowText
						property: "color"
						to: "green"
						duration: 1000
					}
				}
				SequentialAnimation {
					PropertyAnimation {
						target: shadowText
						property: "spread"
						to: 0.5
						duration: 1000
					}
					PropertyAnimation {
						target: shadowText
						property: "spread"
						to: 1
						duration: 1000
					}
				}
			}
		}
	}
}
