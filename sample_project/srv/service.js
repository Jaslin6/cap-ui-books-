const cds = require('@sap/cds');
const { stringify } = require('querystring');

module.exports = cds.service.impl(async function(srv) {
    srv.on('printhelloworld', req => {
        console.log(req.data.input)
        return `${req.data.input} World`
    })
   
    srv.on('addition', req => {
        console.log(req.data)
        let reslut = req.data.num1 + req.data.num2;
        return reslut
    })

    srv.on('myfunction', req => {

        let result = {}

        if(req.data.category == 1) {
            result.product = 'BMW',
            result.stock = '1200 USD',
            result.color = 'Black'
        } else {
            result.product = 'Audi'
            result.stock = 120,
            result.priceArray = [
                {
                    "Price": 47457,
                    "Discount": "20 %"
                }
            ]
        }
        console.log(result)
        return result;
    })

})

