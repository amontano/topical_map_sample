$(document).ready(function() {
  $('.ui_dialog').live('click', function() {
    //$("#popup_dialog").html("<p></p>")
    $("#popup_dialog").dialog( "destroy" );
    $("#popup_dialog").dialog({ modal: true, width: 650, autoOpen: false });
    $("#popup_dialog").dialog('open');
  });

  $("#popup_dialog").dialog( "destroy" );
    $("#popup_dialog").dialog({ modal: true, width: 650, autoOpen: false });
    $("#popup_dialog").dialog("close");
});