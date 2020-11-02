function item() {
  if (document.getElementById("add-tax-price")) {
    // 販売手数料、販売利益のフォームの要素を取得
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    // 初期表示は"円"にしておく
    addTaxPrice.innerHTML = "円";
    profit.innerHTML = "円";
    // 価格フォームの要素を取得
    const itemPrice = document.getElementById("item-price");
    // 価格フォーム入力時にイベント発火
    itemPrice.addEventListener("keyup", () => {
      // 黒色にする
      addTaxPrice.removeAttribute("style", "color: red;");
      profit.removeAttribute("style", "color: red;");

      // 販売手数料、販売利益の計算
      if (itemPrice.value == 0) {
        addTaxPrice.innerHTML = "円";
        profit.innerHTML = "円";
      } else if (itemPrice.value < 300) {
        addTaxPrice.innerHTML = "金額が小さすぎます";
        addTaxPrice.setAttribute("style", "color: red;");
        profit.innerHTML = "金額が小さすぎます";
        profit.setAttribute("style", "color: red;");
      } else if (itemPrice.value > 9999999) {
        addTaxPrice.innerHTML = "金額が大きすぎます";
        addTaxPrice.setAttribute("style", "color: red;");
        profit.innerHTML = "金額が大きすぎます";
        profit.setAttribute("style", "color: red;");
      } else if (itemPrice.value >= 300 && itemPrice.value <= 9999999) {
        const taxPrice = parseInt(itemPrice.value * 0.03, 10);
        addTaxPrice.innerHTML = `${taxPrice}円`;
        const gainPrice = Math.floor(itemPrice.value - taxPrice);
        profit.innerHTML = `${gainPrice}円`;
      } else {
        addTaxPrice.innerHTML = "価格は半角数字で入力";
        addTaxPrice.setAttribute("style", "color: red;");
        profit.innerHTML = "価格は半角数字で入力";
        profit.setAttribute("style", "color: red;");
      };
    });

    // 商品名の文字数カウント
    const itemName = document.getElementById("item-name");
    itemName.addEventListener("keyup", () => {
      const itemNameCountVal = itemName.value.length;
      const itemNameCount = document.getElementById("item-name-count");

      itemNameCount.innerHTML = `${itemNameCountVal}`;
      if (itemNameCountVal >= 40) {
        itemNameCount.setAttribute("style", "color: red;");
      } else {
        itemNameCount.removeAttribute("style", "color: red;");
      };
    });

    // 商品説明の文字数カウント
    const itemExplain = document.getElementById("item-info");
    itemExplain.addEventListener("keyup", () => {
      const itemExplainCountVal = itemExplain.value.length;
      const itemExplainCount = document.getElementById("item-explain-count");

      itemExplainCount.innerHTML = `${itemExplainCountVal}`;
      if (itemExplainCountVal >= 1000) {
        itemExplainCount.setAttribute("style", "color: red;");
      } else {
        itemExplainCount.removeAttribute("style", "color: red;");
      };
    });
  };
};

// 編集ページ読み込み時に表示する内容
function editPage() {
  if (document.getElementById("add-tax-price")) {
    // 販売手数料、販売利益のフォームの要素を取得
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    // 価格フォームの要素を取得
    const itemPrice = document.getElementById("item-price");
    // 黒色にする
    addTaxPrice.removeAttribute("style", "color: red;");
    profit.removeAttribute("style", "color: red;");
    // 販売手数料、販売利益の計算
    const taxPrice = parseInt(itemPrice.value * 0.03, 10);
    addTaxPrice.innerHTML = `${taxPrice}円`;
    const gainPrice = Math.floor(itemPrice.value - taxPrice);
    profit.innerHTML = `${gainPrice}円`;

    // 商品名の文字数カウント
    const itemName = document.getElementById("item-name");
    const itemNameCountVal = itemName.value.length;
    const itemNameCount = document.getElementById("item-name-count");
    itemNameCount.innerHTML = `${itemNameCountVal}`;

    // 商品説明の文字数カウント
    const itemExplain = document.getElementById("item-info");
    const itemExplainCountVal = itemExplain.value.length;
    const itemExplainCount = document.getElementById("item-explain-count");
    itemExplainCount.innerHTML = `${itemExplainCountVal}`;
  };
};

window.addEventListener('load', item);

window.addEventListener('load', editPage);