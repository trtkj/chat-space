$(function(){
  $(".chat-group-form__input").on("keyup", function() {
    var input = $("#group_members").val();
    var url = "/users"
    $.ajax({
      type: "GET",
      url: url,
      data: {
        content: input
      },
      dataType: "json"
    })
  });
});
