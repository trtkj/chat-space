//= require jquery
//= require jquery_ujs
$(function(){
  $(".image-upload").click(function() {
    $("#upload").click();
    return false;
  });
});

$("#upload").on("change", function(){
  return false;
});
