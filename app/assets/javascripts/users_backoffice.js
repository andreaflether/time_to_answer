//= require jquery/dist/jquery
//= require popper.js/dist/popper
//= require bootstrap/dist/js/bootstrap.bundle
//= require sb-admin-2
//= require lmat.bs.growl/jquery.bootstrap-growl
//= require jquery-datetimepicker/build/jquery.datetimepicker.full

$(document).ready(function() {
  $('#datetimepicker').datetimepicker({
    timepicker: false,
    format: 'd/m/Y'
  });
  $.datetimepicker.setLocale('pt-BR');
})
