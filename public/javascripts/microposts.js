function loadMicroposts() {
  var $microposts = $("#microposts");
  var href = $microposts.attr("data-url");
  var lastMicropostId = $microposts.attr("data-lastPostId") || "";
  $.get(href, { micropost_id: lastMicropostId },function(data) {
    $microposts.prepend(data);
    var newLastMicropostId = $microposts.find(".micropost:first-child").attr("data-id");
    $microposts.attr("data-lastPostId", newLastMicropostId || lastMicropostId);
  });
}

$(function(){
  function updateMicroposts() {
    loadMicroposts();
    var t = setTimeout(updateMicroposts, 5000);
  }
  updateMicroposts();
});