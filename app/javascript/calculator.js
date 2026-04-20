const price = () => {
    const priceInput = document.getElementById('item-price');
    priceInput.addEventListener('input', () => {

        const addTaxDom = document.getElementById('add-tax-price');
        addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

        const profitDom = document.getElementById('profit');
        profitDom.innerHTML = Math.floor(priceInput.value - addTaxDom.innerHTML);
})};


window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);