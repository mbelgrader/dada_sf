$(document).ready(function(){
  $(".backdrop").hide();

  $("img").click(function() {
    //save clicked image src
    var image_src = $(this).attr("src");
    //display backdrop and lightbox
    $(".backdrop").show();
    $(".box").show();
    //add image to lightbox
    $("div.box").html('<img src="' + image_src + '" />');

   //exit by clicking backdrop
    $("div.backdrop").click(function() {
      $(".box, .backdrop").hide();
    })
  })

});
