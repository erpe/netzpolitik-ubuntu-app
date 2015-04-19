.pragma library


function fetchFeed() {
  var x = new XMLHttpRequest();

  x.onreadystatechange = function () {
    console.log("statechange...");
    if (x.readyState == 4 && x.status == 200) {
      console.log(x.toString());
      var doc = x.responseXML;
      console.log(doc.toString());
      printTitle(doc);
      console.log("xml: " + printTitle(doc));
      return "foobar";
    } else {
        console.log("state: " + x.readyState + " - status: " + x.status);
    };
  };
  x.onerror = function() {
    console.log("ERROR - state: " + x.readyState + " - status: " + x.status);
    return "error";
  };
  x.open("GET", "http://netzpolitik.org/feed", true);
  x.responseType = 'document';
  x.send(null);
  return "notting";
}

function printTitle(xml) {
  console.log("xml: " + xml.toString());
  var channel = xml.childNodes;
  console.log("channel: " + channel);
  //[0].getElementsByTagName("title")[0].textContent;

  console.log("title: " + title);
  return channel[0];
}
