const express = require('express');
var app = express();
const controller = require('./Scripts/ControllerTranslater.js');
const expressNunjucks = require('express-nunjucks');
const isDev = app.get("env") === "development";

var params = require('express-params');




const njk = expressNunjucks(app, {
    watch: isDev,
    noCache: isDev,
    autoescape: true
});

params.extend(app);
var bodyParser = require('body-parser');

const port = 3000;
app.use(bodyParser());
app.use('/style', express.static('style'));
app.use('/Scripts', express.static('Scripts'));



app.get("/Berserk",
    function (req, res) {

        controller.GetQuotes(req,res)

    });


app.listen(port, () =>
    console.log(`Server (${app.get("env")}) listening on
port ${port}!`)
);