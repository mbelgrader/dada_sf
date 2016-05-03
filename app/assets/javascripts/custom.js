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
    // Center the lightbox on the screen
    $("div.box").position({
        of: $(window)
    });
    // var box_height = $("div.box").height();
    // $("img.box").css("height", box_height);
    // Exit by clicking backdrop
    $("div.backdrop").click(function() {
      $(".box, .backdrop").hide();
    })
  })

});
