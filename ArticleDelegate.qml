import QtQuick 2.0
import Ubuntu.Components.ListItems 1.0 as ListItem

ListItem.Subtitled {
    id: container


    function getTruncatedTitle(txt) {
      return txt.substring(0,45);
    }

    function getAuthor() {
      return author;
    }

    function formatDate(date) {
      //d = new Date(date);
      return date;
    }

    text: title
    subText: formatDate(pubDate) + " -  " + author
    selected: false
    progression: true
    iconName: "view-fullscreen"
    onClicked: console.log("yi: " + container.getAuthor())

}
