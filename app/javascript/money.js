window.addEventListener('load', function(){

  const priceID = document.getElementById("item-price")
  const taxID = document.getElementById("add-tax-price")
  const profitID = document.getElementById("profit")

  priceID.addEventListener('input', function(e){
    let tax = e.target.value * 0.1
    let profit = e.target.value * 0.9
    taxID.textContent = Math.floor(tax).toLocaleString();
    profitID.textContent = Math.floor(profit).toLocaleString();
  })
})