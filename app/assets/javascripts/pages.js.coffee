jQuery(document).ready ->
  $("#status").fadeOut()
  $("#preloader").delay(350).fadeOut "slow"
  $("body").delay(350).css overflow: "visible"
  return
