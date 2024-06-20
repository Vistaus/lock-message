import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    id: root_about

    header: PageHeader {
        id: main_header

        title: i18n.tr("Information")

        leadingActionBar.actions: [
            Action {

                iconName: "back"
                onTriggered: {
                    a_p_layout.removePages(about_page)
                    columnAdded = false
                }
            }
        ]
    }

    Flickable {
        id: page_flickable

        anchors {
            top: main_header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentHeight:  main_column.height + units.gu(2)
        clip: true

        Column {
            id: main_column

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            Item {
                id: icon

                width: parent.width
                height: app_icon.height + units.gu(1)

                UbuntuShape {
                    id: app_icon

                    width: Math.min(root_about.width/3, 256)
                    height: width
                    anchors.centerIn: parent
                    source: Image {
                        id: icon_image
                        source: "../assets/lock-message.png"
                    }
                    radius: "medium"
                    aspect: UbuntuShape.DropShadow
                }
            }

            Label {
                id: name

                text: "Lock Message\nv0.1.0"
                anchors.horizontalCenter: parent.horizontalCenter
                textSize: Label.Large
                horizontalAlignment:  Text.AlignHCenter
            }

            Label {
                id: description_text

                width: parent.width - units.gu(4)
                text: i18n.tr("Add your message to the lockscreen")
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                horizontalAlignment:  Text.AlignHCenter
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Website")

                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('https://github.com/pybodensee/lock-message')}
            }

            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("License")

                    Label { text: "Simplified BSD License" }
                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('http://opensource.org/licenses/bsd-license.php')}
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Author")

                    Label { text: "Michał Prędotka (Original) \nFaisal Shahzad (Maintainer) " }

                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('http://pybodensee.com')}
            }
        }
    }
}

