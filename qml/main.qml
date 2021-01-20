import QtQuick 2.7
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import "qrc:/Script.js" as ScriptJS

//Альбомная ориентация только
//жесткая ориентация задается в AndroidManifest.xml (текстов режим)
//android:screenOrientation="landscape"
ApplicationWindow {

	//Примаер виндов таблицы
	id: rootApplicationWindow

	property int dpi: Screen.pixelDensity * 24
	property int statusApplication: 0
	visible: true
	title: qsTr("MultiTable")
	width: {
		//		console.debug("Screen.pixelDensity = " + Screen.pixelDensity)
		console.debug("Screen.width = " + Screen.width)
		console.debug("Screen.height = " + Screen.height)
		if (Screen.width > 1000)
			return 1000
		else
			Screen.width
	}

	height: {
		if (Screen.height > 600)
			return 600
		else
			Screen.height
	}

	onStatusApplicationChanged: {
		//Передача статуса приложения в спп код, влияет на генерацию
		cppFunctionality.setStatus(rootApplicationWindow.statusApplication)
	}

	header: MyToolBar {
		id: myToolBar
		height: rootApplicationWindow.width * 0.035
		width: rootApplicationWindow.width

		//		width: parent.width
	}

	MyFont {
		//странно...но работает, загружаю шрифт
		//вероятно загружаю вообще в андроид, а потом он цеплянтся...
		id: myFont
	}

	Loader {
		id: contentLoader
		anchors.fill: parent
		asynchronous: true
		//		active: true
		visible: status == Loader.Ready
		source: "qrc:/qml/NullWindow.qml"
		//отслеживает изменение состояние верхнего меню
		//какой тип обучения будет выбран (обучение тест или кренг)
		//утстанавливает заглушку в окно
		Connections {
			target: myToolBar
			onStatusChanged: {
				rootApplicationWindow.statusApplication = myToolBar.status
				contentLoader.source = "qrc:/qml/NullWindow.qml"
			}
		}
		//отслеживает нажатие конпки выбора цифры
		//испускает сигнал вызова окна после установки нужного состояния
		Connections {
			target: myStatusBar
			onCallWindow: {
				contentLoader.source = "qrc:/qml/NullWindow.qml"

				switch (rootApplicationWindow.statusApplication) {
				case 0:
				case 1:
					//запускаю мешалку каждый раз при вызове новой таблицы в режиме теста
					if (rootApplicationWindow.statusApplication === 1) {
						cppFunctionality.clickNumNable()
					}
					//					myStatusBar.height = rootApplicationWindow.width * 0.035
					contentLoader.setSource("qrc:/qml/MyPrimerTableItem.qml", {
												"greedColumns": 3,
												"greedRows": 3,
												"modelCount": 9,
												"status": rootApplicationWindow.statusApplication,
												"tableNum"//принимаем параметр сигнала от статус бара
												//и передаем его дальше в форму итема
												: tableForNumber
											})
					break
				case 2:
					contentLoader.setSource("qrc:/qml/MyPrimerTableItem.qml", {
												"greedColumns": 8,
												"greedRows": 8,
												"modelCount": 64,
												"status": rootApplicationWindow.statusApplication,
												"tableNum"//принимаем параметр сигнала от статус бара
												//и передаем его дальше в форму итема
												: tableForNumber
											})
					break
				}
			}
		}
	}

	Polzunok {
		id: polzunok
		objectName: "polzunok"
		anchors.centerIn: parent
		running: contentLoader.status == Loader.Loading
	}

	footer: MyStatusBar {
		id: myStatusBar
		height: rootApplicationWindow.width * 0.035
		width: rootApplicationWindow.width
		//статус бар отслеживает изменение состояния тулбара (переклики по типам тестов)
		Connections {
			target: myToolBar
			onStatusChanged: {
				myStatusBar.status = myToolBar.status
			}
		}
	}
}
