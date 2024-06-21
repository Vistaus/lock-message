import QtQuick 2.4
import Ubuntu.Components 1.3
//import QtQuick.Layouts 1.0
import UserMetrics 0.1
import Qt.labs.settings 1.0

MainView {
    id: main_view

    applicationName: "lock-message.pybodensee"

    property bool isLandscape: a_p_layout.width > a_p_layout.height
    property bool isWide: a_p_layout.width > units.gu(80)
    property string momentMessage
    property bool isMomentEdit: false
    property bool columnAdded: false

    width: units.gu(40)
    height: units.gu(100)

    Metric {
        id: metrics
        name: "lockMessages"
        format: momentMessage
        emptyFormat: momentMessage
        domain: "com.ubuntu.developer.lock-message.pybodensee"
    }

    Settings {
        id: settings
        property alias momentmessage: main_view.momentMessage
    }

    AdaptivePageLayout {
        id: a_p_layout

        anchors.fill: parent
        primaryPage: main_page

        layouts: [
            // configure two columns
            PageColumnsLayout {
                when: isWide && columnAdded
                PageColumn {
                    fillWidth: true
                }
                PageColumn {
                    minimumWidth: units.gu(0)
                    maximumWidth: units.gu(50)
                    preferredWidth: units.gu(40)
                }

            },
            // configure minimum size for single column
            PageColumnsLayout {
                when: true
                PageColumn {
                    minimumWidth: units.gu(40)
                    fillWidth: true
                }
            }
        ]

        Page {
            id: main_page

            property int circleWidth: isWide ? (Math.min(main_view.width - units.gu(3), main_view.height) / 1.5) * 0.75
                                             : Math.min(main_view.width, main_view.height) / 1.5
            property int circleStartWidth: circleWidth / 4

            header: PageHeader {
                id: main_header

                title: "Lock Message"
                leadingActionBar.actions: []
                trailingActionBar.actions: [
                    Action {
                        iconName: "info"
                        text: i18n.tr("Info")
                        onTriggered: {
                                columnAdded = true
                                a_p_layout.addPageToNextColumn(main_page, about_page)
                                moment_text_field.focus = false
                        }
                    }
                ]
            }

            Item {
                id: main_scene

                opacity: 0
                anchors {
                    top: main_header.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                    margins: units.gu(2)
                }
                Behavior on opacity { NumberAnimation{duration: 1000}}
                Component.onCompleted: main_scene.opacity = 1

                Item {
                    id: moment_root

                    width: parent.width
                    height: parent.height*0.65

                    Rectangle {
                        id: moment_circle

                        color: UbuntuColors.purple
                        x: (parent.width - width)/2
                        y: height
                        width: main_page.circleStartWidth
                        height: width
                        radius: width/2

                        AbstractButton {
                            id: add_moment_icon

                            width: units.gu(3)
                            height: width
                            anchors.centerIn: parent
                            onClicked: anim_to_moment.start()

                            Icon {
                                name: "add"
                                color: UbuntuColors.porcelain
                                anchors.fill: parent
                            }
                        }
                    }

                    Label {
                        id: moment_label

                        text: i18n.tr("Click to add locked sceen message")
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            top: moment_circle.bottom
                            topMargin: units.gu(2)
                        }
                    }
                }

                Item {
                    id: moment_messages

                    width: parent.width
                    height: parent.height*0.35

                    Label {
                        id: message_description

                        text: {
                            i18n.tr("- If your custom message doesn't show up on the locked screen, then please restart your Phone after removing the SIM card.") + "\n\n" +
                            i18n.tr("- Restarting without SIM card will reset the usermetric sequences and Lock Message sequence will be shown afterwards.") + "\n\n" +
                            i18n.tr("- Please contact me with any issues before leaving negative review and I will try to fix them. Help me to improve this important feature.")

                        }
                        width: parent.width
                        anchors {
                            top: parent.bottom
                            topMargin: units.gu(10)
                        }
                        wrapMode: TextEdit.WordWrap
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                AbstractButton {
                    id: go_back

                    enabled: isMomentEdit
                    opacity: enabled ? 1 : 0
                    width: units.gu(3)
                    height: width
                    anchors {
                        left: parent.left
                        top: parent.top
                    }
                    Icon {
                        anchors.fill: parent
                        name: "back"
                    }

                    onClicked: {
                        if(isMomentEdit){
                            anim_from_moment.start()
                        }
                        confirmation.enabled = false
                    }
                    Behavior on opacity { NumberAnimation{}}
                }

                AbstractButton {
                    id: accept

                    enabled: isMomentEdit && moment_text_field.text.length > 0
                    opacity: enabled ? 1 : 0
                    width: units.gu(3)
                    height: width
                    anchors {
                        right: parent.right
                        top: parent.top
                    }
                    Icon {
                        anchors.fill: parent
                        name: "ok"
                        color: UbuntuColors.green
                    }
                    Behavior on opacity { NumberAnimation{}}

                    onClicked: {
                        if (isMomentEdit){
                            momentMessage = moment_text_field.text
                            metrics.update(0)

                        }
                        confirmation.enabled = true
                    }

                }

                Item {
                    id: text_edit_item

                    anchors {
                        top: parent.top
                        topMargin: units.gu(2)
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: main_page.circleWidth
                    height: width

                    MouseArea {
                        enabled: isMomentEdit
                        anchors.fill: parent
                        anchors.margins: units.gu(3)
                        onClicked: {moment_text_field.focus = true}
                    }

                    Text {
                        id: moment_hint_text

                        visible: false
                        text: i18n.tr("Touch to write")
                        color: UbuntuColors.porcelain
                        anchors.centerIn: parent
                    }

                    TextEdit {
                        id: moment_text_field

                        enabled: isMomentEdit
                        visible: enabled
                        color: UbuntuColors.porcelain
                        anchors.centerIn: parent
                        width: parent.width * 0.7
                        inputMethodHints: Qt.ImhNoPredictiveText | Qt.ImhNoAutoUppercase
                        wrapMode: TextEdit.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        onFocusChanged: if(focus){confirmation.enabled = false}
                    }
                }

                Label {
                    id: confirmation

                    enabled: false
                    opacity: enabled ? 1 : 0
                    color: UbuntuColors.orange

                    text: {
                        if(isMomentEdit){
                            i18n.tr("Locked screen message was updated")
                        }
                        else {
                            ""
                        }
                    }
                    width: parent.width
                    anchors {
                        top: parent.top
                        topMargin: main_page.circleWidth + units.gu(4)
                        horizontalCenter: parent.horizontalCenter
                    }
                    textSize: Label.Large
                    wrapMode: TextEdit.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    Behavior on opacity { NumberAnimation {duration: 333}}
                }
            }
        }

        AboutPage {
            id: about_page
        }

        SequentialAnimation {
            id: anim_to_moment

            NumberAnimation { target: moment_label; property: "opacity"; to: 0; duration: 165 }
            NumberAnimation { target: add_moment_icon; property: "opacity"; to: 0; duration: 165 }
            NumberAnimation { target: moment_circle; property: "y"; to: moment_circle.height * 1.5 + units.gu(2); duration: 333 }
            NumberAnimation { target: moment_circle; property: "scale"; to: 4; duration: 333 }
            PropertyAction { target: main_view; property: "isMomentEdit"; value: "true"}
            PropertyAction { target: moment_hint_text; property: "visible"; value: "true"}
            PauseAnimation {duration: 666}
            PropertyAction { target: moment_hint_text; property: "visible"; value: "false"}
            PropertyAction { target: moment_text_field; property: "text"; value: momentMessage}
        }

        SequentialAnimation {
            id: anim_from_moment

            PropertyAction { target: moment_text_field; property: "text"; value: ""}
            PropertyAction { target: main_view; property: "isMomentEdit"; value: "false"}
            NumberAnimation { target: moment_circle; property: "scale"; to: 1; duration: 333 }
            NumberAnimation { target: moment_circle; property: "y"; to: moment_circle.height; duration: 333 }
            NumberAnimation { target: moment_label; property: "opacity"; to: 1; duration: 165 }
            NumberAnimation { target: add_moment_icon; property: "opacity"; to: 1; duration: 165 }
        }
    }
}

