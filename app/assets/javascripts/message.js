$(function(){
  $(".post").on("submit", function(e){
    e.preventDefault();
    var textField = $(".post__text");
    var imageField = $(".post__image");
    text = $(".post__text").val();
    image = null;
    if(imageField[0].files.length){
      image = imageField[0].files[0].name;
    }
    console.log(text + " " + image);
  });
});
