$(function(){
  $(".chat-group-form__input").on("keyup", function() {
    var input = $("#user_search").val();
    console.log(input);
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
