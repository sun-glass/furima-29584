window.addEventListener('load', function(){

  const ItemPrice = document.getElementById("item-price");

  ItemPrice.addEventListener('input', () => {
  const inputValue = ItemPrice.value;
  const TaxPrice = document.getElementById("add-tax-price");
  const Tax = 0.1
  const Profit = document.getElementById("profit");
  const taxValue = inputValue*0.1

  TaxPrice.innerHTML = Math.floor(inputValue*Tax);
  Profit.innerHTML = Math.floor(inputValue - taxValue);
  });
});