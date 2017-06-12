$(function(){
  function buidlHTML(data){
    var span_name = $('<span class="message__name">').append(data.user_name);
    var span_date = $('<span class="message__date">').append(data.updated_at);
    var p_text = $('<p class="message__text">').append(data.body);
    var img = $('<img>').attr('src', data.image);
    var html = $('<li class="message">').append(span_name).append(span_date).append(p_text).append(img);
    return html;
  }

  function form_reset(){
    $(".post")[0].reset();
    $(".post__submit").attr('disabled', false);
  }

  $(".post").on("submit", function(e){
    e.preventDefault();
    var url = $(".post").attr("action");
    var fd = new FormData($(this).get(0));
    $.ajax({
      type: "POST",
      url: url,
      data: fd,
      processData: false,
      contentType: false,
      dataType: "json"
    }).done(function(data){
      console.log(data);
      var html = buidlHTML(data);
      $(".messages").append(html);
      form_reset();
    })
    .fail(function(){
      form_reset();
      alert("送信に失敗しました");
    });
  });
});
