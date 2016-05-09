$(document).ready(function(){

  // Adjust image size to thumbnails
  $("div.gallery img").width(300).height(300);
  $("div.gallery img")

  $("img").click(function() {
    // Save clicked image src
    var image_src = $(this).attr("src");
    var next_image = $(this).next().attr("src");
    var prev_image = $(this).prev().attr("src");
    // Display backdrop and lightbox
    $(".backdrop").show();
    $(".box").show();

    // Add image to lightbox
    $("div.box").html('<img src="' + image_src + '" />');

    // Arrows
    $("#right_arrow").click(function() {
      $("div.box img").attr("src", next_image);
      image_src = next_image;
    })

    $("#left_arrow").click(function() {
      $("div.box img").attr("src", prev_image);
    })

    // Exit by clicking backdrop
    $("#close_lightbox").click(function() {
      $(".box, .backdrop").hide();
    })
  })

});
