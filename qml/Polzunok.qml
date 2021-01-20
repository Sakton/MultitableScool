import QtQuick 2.10
//import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

//import QtQuick.Controls 2.12
BusyIndicator {
	id: busy
	implicitWidth: 300
	implicitHeight: 300
	width: implicitWidth
	height: implicitHeight
	style: BusyIndicatorStyle {
		indicator: Image {
			visible: busy.running
			source: "qrc:/img/swirl-160625_640.png"
			RotationAnimator on rotation {
				running: control.running
				loops: Animation.Infinite
				duration: 2000
				from: 0
				to: 360
			}
		}
	}
}
