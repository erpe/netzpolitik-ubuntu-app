import QtQuick 2.0
import Ubuntu.Components 1.1

MainView {
  objectName: "mainView"
  applicationName: 'netzpolitik.rene-so36'
  useDeprecatedToolbar: false
  width: units.gu(70)
  height: units.gu(100)
  automaticOrientation : true

  PageStack {
    id: pageStack
    Component.onCompleted: push(listPage)

    Page {
      id: noticePage
      title: 'Log...'
      Text {
        id: noticeContent
        width: parent.width - units.gu(2)
        wrapMode: Text.WordWrap
        text: ''
      }
    }

    Page {
      id: listPage
      title: "Netzpolitik"
      head.contents: Image {
        fillMode: Image.PreserveAspectFit
        source: "header.png"
      }
      UbuntuListView {
        id: listView
        anchors.fill: parent
        model: FeedListModel{id: feedListModel}
        delegate: ArticleDelegate{}
      }
    }

    Page {
      id: articlePage
      title: "Artikel"
      visible: false

      Flickable {
        id: content
        anchors.fill: parent
        contentHeight:  articleContent.height
        leftMargin: units.gu(1)

        Text {
          id: articleContent
          width: parent.width - units.gu(2)
          wrapMode: Text.WordWrap
          onLinkActivated: Qt.openUrlExternally(link)
          text: ''
        }
      }
    }
  }
}
