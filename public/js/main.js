$(function () {

  $(".auth .input-file input[type='file']").change(function () {
    var fileName = $(this).val().slice(12, -1)
    var icon = $(".auth .input-file div i")
    $(".auth .file-name").text(fileName)
    icon.removeClass('mbi-plus');
    icon.addClass('mbi-check');
    icon.css({
      'background-color': '#198754',
      'color': '#fff',
      'border': '1px solid #198754'
    })
  });
  $(".show-password").click(function () {
    if ($(this).next('input').val() != "") {
      if ($(this).next('input').attr("type") == "password") {
        $(this).next('input').attr("type", "text")
        $(this).removeClass('mbi-eye');
        $(this).addClass('mbi-eye-crossed');
      } else {
        $(this).next('input').attr("type", "password")
        $(this).addClass('mbi-eye');
        $(this).removeClass('mbi-eye-crossed');
      }

    }
  });

  var input = document.querySelector("#phone");
  window.intlTelInput(input, {
    separateDialCode: true,
  });
});
