import QtQuick 2.0
import Ubuntu.Components 1.1

MainView {
  objectName: "mainView"
  applicationName: 'netzpolitik.rene-so36'
  useDeprecatedToolbar: false
  width: units.gu(100)
  height: units.gu(70)
  automaticOrientation : true

  PageStack {
    id: pageStack
    Component.onCompleted: push(listPage)

    Page {
      id: listPage
      title: "Netzpolitik"
      head.contents: Image {
        fillMode: Image.PreserveAspectFit
        source: "header.png"
      }

      UbuntuListView {
        id: listView
        height: parent.height
        width: parent.width

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

        Text {
          id: articleContent
          width: parent.width
          wrapMode: Text.WordWrap
          onLinkActivated: Qt.openUrlExternally(link)
          text: ''
        }
      }
    }
  }
}
