import QtQuick 2.0
import QtQuick.Controls 2.3

Popup {
	id: popup
	objectName: "popup"
	implicitWidth: 500
	implicitHeight: 500
	width: implicitWidth
	height: implicitHeight
	focus: true
	closePolicy: Popup.NoAutoClose
	modal: true
	contentItem: MyPrimerWindowForAndroid {
		anchors.fill: parent
	}
}
