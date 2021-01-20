QT += quick qml widgets quickwidgets
CONFIG += c++11
CONFIG += resources_big
CONFIG += qml_debug

VERSION = 1.0
QMAKE_TARGET_COMPANY = Razumov_Roman
QMAKE_TARGET_PRODUCT = Multitable
QMAKE_TARGET_DESCRIPTION = Multitable_Table
QMAKE_TARGET_COPYRIGHT = Razumov_Roman

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
	functionality.cpp

RESOURCES += qml.qrc \
	girres.qrc \
	gifr.qrc

RC_ICONS = Ninja_Turtle_icon-icons.com.ico

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
	Ninja_Turtle_icon-icons.png \
	Screen/Screenshot_20190429-125914.jpg \
	Screen/Screenshot_20190429-125924.jpg \
	Screen/Screenshot_20190429-125934.jpg \
	Screen/Screenshot_20190429-130045.jpg \
	Screen/Screenshot_20190429-130106.jpg \
	Screen/Screenshot_20190429-130123.jpg \
	Screen/Screenshot_20190429-130137.jpg \
	Screen/s1.jpg \
	Screen/s2.jpg \
	Screen/s3.jpg \
	Screen/s4.jpg \
	Screen/s5.jpg \
	Screen/s6.jpg \
	Screen/s7.jpg \
	Screen/sss1.jpg \
	qml/qtquickcontrols2.conf \
	qml/main.qml \
	qml/MyButtonForTable.qml \
	qml/MyPrimerTableItem.qml \
	qml/MyStatusBar.qml \
	qml/MyToolBar.qml \
	qml/MyPusto.qml \
	qml/qtquickcontrols2.conf \
	qml/main.qml \
	qml/MyButtonForPrimerWindow.qml \
	qml/MyButtonForTable.qml \
	qml/MyPrimerTableItem.qml \
	qml/MyPrimerWindow.qml \
	qml/MyPusto.qml \
	qml/MyStatusBar.qml \
	qml/MyToolBar.qml \
	model.qmodel \
	Ninja_Turtle_icon-icons.com.ico \
	mainqml.qmodel \
	tableitemmodel.qmodel \
	enumCopyPast \
	android/AndroidManifest.xml \
	android/gradle/wrapper/gradle-wrapper.jar \
	android/gradlew \
	android/res/values/libs.xml \
	android/build.gradle \
	android/gradle/wrapper/gradle-wrapper.properties \
	android/gradlew.bat \
	BufferToCpypaste \
	normal.ttf

HEADERS += \
	functionality.h

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
	ANDROID_PACKAGE_SOURCE_DIR = \
		$$PWD/android
}
