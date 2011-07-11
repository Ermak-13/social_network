$(document).ready(function(){
  current_value=$.cookie("thema")
  if(current_value == "white"){
    console.log("white");
    $('head').append('<link rel="stylesheet" href="/stylesheets/thema/white.css" >')
  }else{
    console.log("black")
    $('head').append('<link rel="stylesheet" href="/stylesheets/thema/black.css" >')
  }
});

$('#thema').live('click',function(){
  current_value=$.cookie("thema")
  if(current_value == "white"){
    console.log("white");
    $('head').append('<link rel="stylesheet" href="/stylesheets/thema/black.css" >')
    $.cookie("thema","black")
  }else{
    console.log("black")
    $('head').append('<link rel="stylesheet" href="/stylesheets/thema/white.css" >')
    $.cookie("thema","white")
  }
});