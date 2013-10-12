$ ->
  $('textarea').bind 'keyup', generateQRCode
  $('#triggerCreate').bind 'click', generateQRCode
  $(window).bind 'hashchange', ->
    text = window.location.hash.substring 1
    $('textarea').val decodeURIComponent(text)
    generateQRCode()
  $('a', '#download').bind 'click', ->
    window.location.href = $('canvas', '#qrarea')[0].toDataURL('image/png').replace('image/png', 'image/octet-stream')

  if window.location.hash
    $(window).trigger 'hashchange'
  generateQRCode()

generateQRCode = ->
  text = $('textarea').val()
  $('#qrarea').empty()
  $('#qrarea').qrcode(text)
