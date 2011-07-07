// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  var replaceFriendPartial = function($div, data) {
    $div.replaceWith(data);
  };
  $(".friend .action.make_friends").live("click", function(e) {
    var href = $(this).attr("href");
    var $friend = $(this).closest(".friend");
    $.post(href, { id: $friend.attr("data-id") }, function(data) {
      replaceFriendPartial($friend, data);
    });
    e.preventDefault();
  });
  $(".friend .action.quarrell").live("click", function(e) {
    var href = $(this).attr("href");
    var $friend = $(this).closest(".friend");
    $.ajax({
      url: href,
      type: "DELETE",
      success: function(data, status, xhr) {
        if (window.location.pathname.match(/search/)) {
          replaceFriendPartial($friend, data);
        } else {
          $friend.fadeOut();
        }
      }
    });
    e.preventDefault();
  });
});