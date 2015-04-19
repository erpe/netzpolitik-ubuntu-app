import QtQuick 2.0
import Ubuntu.Components 1.1

MainView {
  objectName: "mainView"
  applicationName: 'netzpol.rene-so36'

  useDeprecatedToolbar: true

  width: units.gu(100)
  height: units.gu(75)
  Column {
      width: parent.width
      height: parent.height
    Page {
      id: page1
      width: parent.width
      height: parent.height

      title: "Netzpolitik"

      Row {
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.topMargin: 80

        UbuntuListView {
          id: listView
          //spacing: 5
          height: parent.height
          width: parent.width

          model: FeedListModel{id: feedListModel}
          delegate: ArticleDelegate{}
        }
      }
    }
  }
}
