$(function(){
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
    });
  });
});
