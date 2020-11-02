function categories() {
  if (document.getElementById("category-list")) {

    const categoryList = document.getElementById("category-list");
    const categoryMenu = document.getElementById("category-menu");

    // 「カテゴリー」クリックでメニューが開く
    categoryList.addEventListener('click', function () {
      if (categoryMenu.getAttribute("style") == "display:block;") {
        categoryMenu.removeAttribute("style", "display:block");
        categoryList.removeAttribute("style", "bacckground-color: #fffacd");

      } else {
        categoryMenu.setAttribute("style", "display:block;");
        categoryList.setAttribute("style", "background-color: #fffacd");
      };
    });
  }
};

window.addEventListener('load', categories);