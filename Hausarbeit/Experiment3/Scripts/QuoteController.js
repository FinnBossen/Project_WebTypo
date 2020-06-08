const sqlite3 = require('sqlite3').verbose();
var methods = {};
let db = new sqlite3.Database('DB/Berserk quotes.db', sqlite3.OPEN_READWRITE, (err) => {
    if (err) {
        return console.error(err.message);
    }
    console.log('Connected to the blog database.');
});

methods.getQuotesAll = function (callback) {
    let sql;


    sql = 'SELECT * FROM Quotes';


    db.all(sql, function (err, AllRows) {

        if (err != null) {
            console.log(err);

        }
        return callback(AllRows);
        console.log(AllRows);

    });
};

exports.data = methods;
