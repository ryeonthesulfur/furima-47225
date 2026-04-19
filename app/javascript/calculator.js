const price = () => {
    const priceInput = document.getElementById('item-price');
    priceInput.addEventListener('input', () => {
        console.log(priceInput.value);

        const addTaxDom = document.getElementById('add-tax-price');
        addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
        console.log(addTaxDom.innerHTML);

        const profitDom = document.getElementById('profit');
        profitDom.innerHTML = Math.floor(priceInput.value - addTaxDom.innerHTML);
        console.log(profitDom.innerHTML);
})};


window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);