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

/*function money() {
  const price = document.getElementById("item-price");
  price.addEventListener("input", (e) => {
    const priceID = price.getAttribute("id");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/products/new/${priceID}`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response;
      const tax = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const HTML1 = item * 0.1
      const HTML2 = item * 0.9

      tax.insertAdjacentHTML("afterend", HTML1);
      profit.insertAdjacentHTML("afterend", HTML2);

    };
    e.preventDefault();
  });
}
window.addEventListener("load", money);
*/