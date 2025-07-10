//= require active_admin/base

// Custom ActiveAdmin JavaScript can go below

// Example: Show a notification when the document is ready
$(document).ready(function() {
  // Uncomment the next line to show a welcome alert
  // alert('Welcome to ActiveAdmin!');
});

// Example: Add a custom class to the body on ActiveAdmin pages
$(document).on('ready page:load', function() {
  if ($('body').hasClass('active_admin')) {
    $('body').addClass('custom-active-admin');
  }
});