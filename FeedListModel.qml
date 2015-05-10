import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import Ubuntu.Components 1.1

XmlListModel {
  source: "http://netzpolitik.org/feed"
  query: "/rss/channel/item"

  namespaceDeclarations: "declare namespace dc='http://purl.org/dc/elements/1.1/'; declare namespace content='http://purl.org/rss/1.0/modules/content/';"

  XmlRole { name: "title"; query: "title/string()"; }
  XmlRole { name: "author"; query: "dc:creator/string()";}
  XmlRole { name: "pubDate"; query: "pubDate/string()"; }
  XmlRole { name: "description"; query: "description/string()"; }
  XmlRole { name: "content"; query: "content:encoded/string()"; }
}
