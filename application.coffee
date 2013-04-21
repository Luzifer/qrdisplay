$ ->
  $('textarea').bind 'keyup', generateQRCode
  $('#triggerCreate').bind 'click', generateQRCode
  $(window).bind 'hashchange', ->
    text = window.location.hash.substring 1
    $('textarea').val text
    generateQRCode()
  if window.location.hash
    $(window).trigger 'hashchange'
  generateQRCode()

generateQRCode = ->
  text = $('textarea').val()
  $('#qrarea').empty()
  $('#qrarea').qrcode(text)