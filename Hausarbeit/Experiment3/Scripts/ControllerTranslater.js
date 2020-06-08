const model = require('./QuoteController.js');


module.exports = {

    GetQuotes: function (req, res) {

        var textAnchors = [

            1500,
            0,
            500


        ]

        model.data.getQuotesAll(function (callback) {
            var data = callback;
/*
            res.render('Quotes', {
                entries: data,

            });
*/          data.forEach((row) => {
                row.RandomNumber = Math.floor(Math.random() * 16) + 5;
                row.RandomTextAnchor = textAnchors[Math.floor(Math.random()*textAnchors.length)];
                console.log("ID: "+row.ID+" RandomAnchor: " + row.RandomTextAnchor + " Number: " + row.RandomNumber);

            });
            res.render('QuotesSymbol', {
                entries: data,


            });


        });
    },



};