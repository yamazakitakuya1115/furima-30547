
if (document.URL.match(/new/) || document.URL.match(/edit/)) {
  document.addEventListener('DOMContentLoaded', function () {
    console.log(12345);
  });
};