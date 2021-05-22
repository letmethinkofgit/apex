
====================
If you want to set value of page item in Javascript :

apex.item("P1_NEW").setValue("something"); -- This will not set the value of the page item P1_NEW in the session. This will only be displayed on the page.
If you want to have "something" in session then use following code in Javascript.

apex.server.process ( "SAVE_HIDDEN_VALUE_IN_SESSION_STATE", {
  x01: "set_session_state",
  pageItems: "#P1_NEW"
  }, {dataType: 'text'} );


===================
Get the content of the page without opening page in javascript

var url = $v('P1_DYNAMIC_URL');
$.get(url, function(html) {
    htmlObject = html;
    });
arr = htmlObject; -- html object will be an array.
var myJSON = JSON.stringify(htmlObject); -- Used to stringigy array into string
