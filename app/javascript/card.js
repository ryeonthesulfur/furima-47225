const pay = () => {
    const publickey = gon.public_key;
    const payjp = Payjp(publickey);
    const elements = payjp.elements();
    const cardNumber = elements.create('cardNumber');
    const cardExpiry = elements.create('cardExpiry');
    const cardCvc = elements.create('cardCvc');

    cardNumber.mount('#number-form');
    cardExpiry.mount('#expiry-form');
    cardCvc.mount('#cvc-form');

    const form = document.getElementById('charge-form');
    form.addEventListener('submit', (e) => {
        payjp.createToken(cardNumber).then(function (response) {
            if (response.error) {
            }else {
                const token = response.id;
                const renderDom = document.getElementById('charge-form');
                const tokenObj = `<input value=${token} name="payjp_token" type="hidden">`;
                renderDom.insertAdjacentHTML('beforeend', tokenObj);
            }
                cardNumber.clear();
                cardExpiry.clear();
                cardCvc.clear();
                document.getElementById('charge-form').submit();
        });
        e.preventDefault();
    });
};

window.addEventListener('turbo:load', pay);
window.addEventListener("turbo:render", pay);