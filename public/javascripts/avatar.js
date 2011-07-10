$('#show_load_avatar').live('click',function(){
  console.log("show load avatar")
  load_avatar=$('#load_avatar')
  if(load_avatar.css('display') == 'none'){
    console.log("none")
    load_avatar.css('display','block')
  }else{
    console.log("block")
    load_avatar.css('display','none')
  }
});