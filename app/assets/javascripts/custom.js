$(document).ready(function(){

  // Color nav links red on hover
  $("li a").mouseover(function() {
    $(this).css('color', 'red');
  })

  $("li a").mouseout(function() {
    $(this).css('color', '#d8d8d8');
  })

  // Dropdown on hover
  $("#reserve_dropdown").mouseover(function() {
    $("#reserve_list").show();
  })

  $("#reserve_dropdown").mouseout(function() {
    $("#reserve_list").hide();
  })

// ---------- Lightbox ----------
  // Adjust image size to thumbnails
  $("div.gallery img").width(300).height(300);
  $("div.gallery img")

  $("div.gallery img").click(function() {
    // Save clicked image src
    var image_src = $(this).attr("src");
    current_li = $(this).parent();
    // Display backdrop and lightbox
    $(".backdrop").show();
    $(".box").show();

    // Add image to lightbox
    $("div.box").html('<img src="' + image_src + '" />');

    // Arrows
    $("#right_arrow").click(function() {
      var next_li = current_li.next();
      var next_src = next_li.children("img").attr("src");
      $("div.box img").attr("src", next_src);
      current_li = next_li;
    })

    $("#left_arrow").click(function() {
      var prev_li = current_li.prev();
      var prev_src = prev_li.children("img").attr("src");
      $("div.box img").attr("src", prev_src);
      current_li = prev_li;
    })

    // Exit by clicking backdrop
    $("#close_lightbox").click(function() {
      $(".box, .backdrop").hide();
    })
  })

});
