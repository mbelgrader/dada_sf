$(document).ready(function(){
  // Adjust image size to thumbnails
  $("div.gallery img").width(300).height(300);

  $("img").click(function() {
    // Save clicked image src
    var image_src = $(this).attr("src");

    // Display backdrop and lightbox
    $(".backdrop").show();
    $(".box").show();

    // Add image to lightbox
    $("div.box").html('<img src="' + image_src + '" />');

    // Exit by clicking backdrop
    $("div.backdrop").click(function() {
      $(".box, .backdrop").hide();
    })
  })

  // Arrows
  //
  // $("button#left_arrow").click(function() {
  //   next_image =
  // })

});
