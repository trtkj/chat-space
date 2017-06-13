$(function(){
  function buildHTML(results){
    var html = $('<div class="chat-group-user clearfix">')
    for(var i=0; i < results.length; i++){
      var p_user_name = $('<p class="chat-group-user__name">').append(results[i].name);
      var a_add_btn = $('<a class="user-search-add chat-group-user__btn chat-group-user__btn--add">').attr("data-usr-id", results[i].id).attr("data-usr-name", results[i].name).append("追加");
      var add_html = $('<div class="chat-group-user clearfix">').append(p_user_name, a_add_btn)
      html.append(add_html);
    }
    return html;
  }

  $(".chat-group-form__input").on("keyup", function() {
    var input = $("#user-search__input").val();
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
    .done(function(results){
      $(".chat-group-user").remove();
      var html = buildHTML(results);
      $("#user-search").append(html);
    })
    .fail(function(){
      form_reset();
      alert("ユーザー検索に失敗しました");
    });
  });
});
