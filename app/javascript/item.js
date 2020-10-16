function item() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const taxPrice = parseInt(itemPrice.value * 0.1, 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${taxPrice}`;
    const gainPrice = (itemPrice.value - taxPrice);
    const profit = document.getElementById("profit");
    profit.innerHTML = `${gainPrice}`;
  });
};

window.addEventListener('load', item);