(function() {
  var generateQRCode;

  $(function() {
    $('textarea').bind('keyup', generateQRCode);
    $('#triggerCreate').bind('click', generateQRCode);
    $(window).bind('hashchange', function() {
      var text;
      text = window.location.hash.substring(1);
      $('textarea').val(text);
      return generateQRCode();
    });
    if (window.location.hash) $(window).trigger('hashchange');
    return generateQRCode();
  });

  generateQRCode = function() {
    var text;
    text = $('textarea').val();
    $('#qrarea').empty();
    return $('#qrarea').qrcode(text);
  };

}).call(this);
