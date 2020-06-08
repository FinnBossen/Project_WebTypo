const sqlite3 = require('sqlite3').verbose();

const express = require('express');
var path = require('path');
const expressBodyParser = require("body-parser");

const expressNunjucks = require('express-nunjucks');
const app = express();
const isDev = app.get('env') === 'development';

const port = 3300;

app.set('views', __dirname + '/views');


const njk = expressNunjucks(app, {
    watch: isDev,
    noCache: isDev,
    autoescape: true
});

const model = require("./src/model");

console.log("Prepparing!");
model.connectionInit(() => { dbInitialized() });



function dbInitialized() {
    app.use(`/Hausarbeit`, express.static('Hausarbeit'));

//app.get(`/`,expressBodyParser.urlencoded({ extended: true }),(req, res) => {res.render("collabgfx.html")});
    app.get(`/`,expressBodyParser.urlencoded({ extended: true }),(req, res) => {res.redirect("/Hausarbeit/index.html")});
    app.listen(port, () =>
        console.log(`Server (${app.get("env")}) listening on
   port ${port}!`));
}
