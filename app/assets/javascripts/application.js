// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {
  readStatus();
  sortTitle();
  sortReadStatus();
});

var readStatus = function () {
  $('tr').delegate('#read', 'click', function() {
    $link = $(this).closest('tr');
    toggleReadStatus($link.data('id'));
    $link.toggleClass('true');
    if ($link.hasClass('true')) {
      $(this).text('Yes');
    } else {
      $(this).text('No');
    }
  });
};

var toggleReadStatus = function (id) {
  $.ajax({
    type: 'PATCH',
    url: '/api/v1/links/' + id,
    success: function() {
      console.log("success");
    }
  });
};

var sortTitle = function () {
  $('.sortTitle').on('click', function() {
    var $links = $('.link');
    alphabeticalSort = $links.sort(function (first, second) {
      first = $(first).data('title').toLowerCase();
      second = $(second).data('title').toLowerCase();
      if (first < second) return -1;
      if (first > second) return 1;
      return 0;
    });
    $links.remove();
    $('.table').append(alphabeticalSort);
    readStatus();
  });
};

var sortReadStatus = function () {
  $('.sortReadStatus').on('click', function() {
    var $links = $('.link');
    sortedLinks = $links.sort(function (first, second) {
      first = $(first).hasClass('true');
      second = $(second).hasClass('true');
      if (first < second) return -1;
      if (first > second) return 1;
      return 0;
    });
    $links.remove();
    $('.table').append(sortedLinks);
    readStatus();
  });
};
