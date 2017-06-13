$(function(){
  function resultHTML(results){
    var html = $('<div class="chat-group-user clearfix" id="candidates">')
    for(var i=0; i < results.length; i++){
      var p_user_name = $('<p class="chat-group-user__name">').append(results[i].name);
      var a_add_btn = $('<a class="user-search-add chat-group-user__btn chat-group-user__btn--add">').attr("data-user-id", results[i].id).attr("data-user-name", results[i].name).append("追加");
      var add_html = $('<div class="chat-group-user clearfix">').append(p_user_name, a_add_btn)
      html.append(add_html);
    }
    return html;
  }

  function addUserHTML(user_id, user_name){
    var html = $("<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>");
    var input_html = $("<input name='group[user_ids][]' type='hidden'>").attr("value", user_id);
    var p_html = $("<p class='chat-group-user__name'>").append(user_name);
    var a_html = $("<a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>").append("削除");
    return html.append(input_html, p_html, a_html)
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
      $("#candidates").remove();
      var html = resultHTML(results);
      $("#user-search").append(html);
    })
    .fail(function(){
      form_reset();
      alert("ユーザー検索に失敗しました");
    });
  });

  $(document).on("click", ".chat-group-user__btn--add", function(){
    $("#candidates").remove();
    $("#user-search__input").val("");
    var user_id = $(this).attr("data-user-id");
    var user_name = $(this).attr("data-user-name");
    var html = addUserHTML(user_id, user_name);
    $("#user-search-result").append(html);
  });

  $(document).on("click", ".chat-group-user__btn--remove", function(){
    $(this).parent().remove();
  });
});
