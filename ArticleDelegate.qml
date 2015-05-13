import QtQuick 2.0
import Ubuntu.Components.ListItems 1.0 as ListItem

ListItem.Subtitled {
    id: container

    function getTruncatedTitle(txt) {
      return txt
    }

    function formatDate(date) {
      return date.split("+")[0];
    }

    function clearContent(txt) {
      var needle = "<br><strong><a href=\"https://netzpolitik.org/2014/10-gruende-um-genau-jetzt-einen-dauerauftrag-fuer-netzpolitik-org-einzurichten/\">10 Gründe, um genau jetzt einen Dauerauftrag für netzpolitik.org einzurichten.</a></strong><br>";
      return content.replace(needle, '');
    }


    function authorLink(author) {
      var authorShort;
      var link;
      switch(author) {
        case 'Andre Meister':
          authorShort = "andre";
          break;
        case 'Markus Beckedahl': 
          authorShort = "site-admin";
          break;
        case 'Anna Biselli':
          authorShort = "anna";
          break;
        case 'Tomas Rudl':
          authorShort = 'tomas';
          break;
        case 'Kirsten Fiedler':
          authorShort = "kirsten";
          break;
        case 'Leonhard Dobusch':
          authorShort = "leonido";
          break;
        case 'Andrea Jonjic':
          authorShort = "andrea";
          break;
        case 'Andreas Müller':
          authorShort = "andreasm";
          break;
        case 'Karsten Gerloff':
          authorShort = "karstengerloff";
          break;
        case 'Matthias Kirschner':
          authorShort = "mk";
          break;
        case 'Thomas Lohninger':
          authorShort = 'thomas-lohninger';
          break;
        case 'Arne Semsrott':
          authorShort = 'arne';
          break;
        case 'Matthias Monroy':
          authorShort = 'matthias';
          break;
        case 'Adrian Schultze':
          authorShort = 'adrian';
        case 'constanze':
          authorShort = 'constanze';
          break;
        case 'Kathrin Maurer':
          authorShort = 'kathrin';
          break;
      }

      if (typeof authorShort === 'undefined') {
        console.log("undefined: '" + author + "'")
        link =  author;
      } else {
        link = "<a href='https:\/\/netzpolitik.org\/author\/" + authorShort + "'>" + author + "<\/a>";
        console.log("link: " + link)
      }

      return link;

    }

    text: title
    subText: formatDate(pubDate) + " -  " + author
    selected: false
    progression: true
    iconName: "view-expand"
    onClicked: {
        articleHeading.text = formatDate(pubDate) + " / " + authorLink(author)
        articlePage.title = title
        articleContentText.text =  clearContent(content)
        pageStack.push(articlePage, index )
    }
}
