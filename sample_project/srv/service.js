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

})

