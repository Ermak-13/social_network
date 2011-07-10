function loadMicroposts() {
  var $microposts = $("#microposts");
  var href = $microposts.attr("data-url");
  var lastMicropostId = $microposts.attr("data-lastPostId") || "";
  $.get(href, { micropost_id: lastMicropostId },function(data) {
  	if (data==" ") {
  		return;
  	}
    console.log("data", data);
    $microposts.prepend(data);
    var newLastMicropostId = $microposts.find(".micropost:first-child").attr("data-id");
    $microposts.attr("data-lastPostId", newLastMicropostId);
    var newMicropostsCount = $(data).filter(".micropost").length;
    if ($microposts.find(".micropost").length > 2) {
      $microposts.find(".micropost:nth-last-child(" + newMicropostsCount +")").remove();
    }
  });
}

$(function(){
  function updateMicroposts() {
    loadMicroposts();
    var t = setTimeout(updateMicroposts, 5000);
  }
  updateMicroposts();
  
  $("#show_more_microposts").click(function() {
    var $link = $(this);
    var currentPage = $link.data("page");
    var newPage = currentPage + 1;
    var href = $("#microposts").attr("data-url");
    $.get(href, { page: newPage }, function(data) {
      $("#microposts").append(data);
      $link.data("page", newPage);
    });
    return false;
  });
});