import QtQuick 2.7
import QtQuick.Window 2.2 as MyWindow
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Particles 2.0

Item {
	id: root
	property int num1: 1
	property int num2: 1
	property int answer: 0
	signal signalAnswerResult(bool res, int num1, int num2)

	implicitWidth: 500
	implicitHeight: 500

	width: implicitWidth
	height: implicitHeight / 2

	NumberAnimation on height {
		id: numanimation
		duration: 250
		from: 480
		to: 500
		easing.type: Easing.OutElastic
		easing.amplitude: 5
		easing.period: 0.05
	}

	Component.onCompleted: {
		numericEntersField.focus = true
		numanimation.start()
	}

	onVisibleChanged: {
		numanimation.restart()
	}

	Item {
		id: rootRect
		anchors.fill: parent

		Image {
			id: fonImg
			source: "qrc:/img/1-22-640x360.jpg"
			anchors.fill: parent
		}

		RowLayout {
			anchors.fill: parent
			spacing: 0
			Item {

				//				border.color: "red"
				//				border.width: 3
				id: item01
				Layout.alignment: Qt.AlignCenter
				Layout.preferredWidth: parent.width * 0.4
				Layout.preferredHeight: parent.height
				Text {
					id: text
					text: qsTr("%1x%2=").arg(num1).arg(num2)
					font.family: "segoe script"
					font.italic: true
					anchors.fill: parent
					verticalAlignment: Text.AlignVCenter
					horizontalAlignment: Text.AlignHCenter
					font.pixelSize: {
						if (parent.height > 0) {
							return parent.height * 0.5
						} else {
							return 20
						}
					}
				}
			}

			Item {

				//			Rectangle {

				//				border.color: "green"
				//				border.width: 3
				id: rectLayout2
				Layout.alignment: Qt.AlignCenter
				Layout.preferredWidth: parent.width * 0.3
				Layout.preferredHeight: parent.height
				Item {
					id: rectForTextInput
					anchors.fill: parent
					//					width: parent.width /* * 2 / 3*/
					//					height: parent.height
					anchors.horizontalCenter: parent.horizontalCenter
					anchors.verticalCenter: parent.verticalCenter
					TextInput {
						id: numericEntersField
						font.family: "segoe script"
						font.italic: true
						color: "yellow"
						anchors.fill: parent
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						font.pixelSize: parent.height * 0.5
						focus: true
						validator: IntValidator {
							bottom: 0
							top: 90
						}
					}
				}
			}

			Item {

				//			Rectangle {

				//				border.color: "blue"
				//				border.width: 3
				Layout.alignment: Qt.AlignCenter
				Layout.preferredWidth: parent.width * 0.3
				Layout.preferredHeight: parent.height
				MyButtonForPrimerWindow {
					anchors.fill: parent
					nadpis: "OK"
					onMyClicked: {
						if (numericEntersField.text !== "") {
							answer = parseInt(numericEntersField.text)
							if (answer == num1 * num2) {
								signalAnswerResult(true, num1, num2)
							} else {
								signalAnswerResult(false, num1, num2)
							}
							numericEntersField.clear()
						}
					}
				}
			}
		}

		//kkk
		ParticleSystem {
			id: particlePrimerWindow
			anchors.fill: parent
			running: true
			ImageParticle {
				source: {

					switch (cppFunctionality.randImgNum) {
					case 0:
						return "qrc:/img/Kraang_uh_oh....png"
					case 1:
						return "qrc:/img/Kraang_Flyers_Head_Tentacles_Profile.png"
					case 2:
						return "qrc:/img/Kraang_Prime_Ultimate_Kraangdroid_Without_Head_Piece_Profile.png"
					default:
						return "qrc:/img/Kraang_uh_oh....png"
					}
				}
				rotationVelocityVariation: 90
				opacity: 0.7
			}

			Emitter {
				id: particles
				//anchors.centerIn: parent
				anchors.horizontalCenter: parent.horizontalCenter
				height: item01.height
				emitRate: 5
				lifeSpan: 1000
				velocity: AngleDirection {
					angleVariation: 360
					magnitude: 400
					magnitudeVariation: 40
				}
				size: 20
				endSize: 400
			}
		}
	}

	//*****************************************Animation***************************************
	ParallelAnimation {
		running: true
		loops: Animation.Infinite
		SequentialAnimation {
			PropertyAnimation {
				target: text
				property: "color"
				to: "red"
				duration: 1000
			}
			PropertyAnimation {
				target: text
				property: "color"
				to: "green"
				duration: 1000
			}
			PropertyAnimation {
				target: text
				property: "color"
				to: "blue"
				duration: 1000
			}
			PropertyAnimation {
				target: text
				property: "color"
				to: "magenta"
				duration: 1000
			}
		}
	}
}
