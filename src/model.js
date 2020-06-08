const sqlite3 = require('sqlite3').verbose();
//const bcrypt = require('bcrypt-nodejs');

let db;


module.exports = {

    connectionInit: function (next) {
        db = new sqlite3.Database("./data/db.db", sqlite3.OPEN_READWRITE | sqlite3.OPEN_CREATE, (err) => {
            if (err) {
                throw err;
            }
            console.log("IMA HERE");
            dbInit(next);
        })
    }
    ,

    execute: function (sql, binding, next) {
        const statement = db.prepare(sql);
        if (binding) {
            statement.bind(binding);
        }
        statement.all((err, rows) => {

            if (err) {
                console.log(`Error! in get for sql: ${{ sql }}`);
                console.log(err);
            }
            if (next) {
                next(rows);

            }
        }
        );

    },

    run: function (sql, binding, next) {
        const statement = db.prepare(sql);
        if (binding) {
            statement.bind(binding);
        }
        statement.run(function (err, rows) {

            if (err) {
                console.log(`Error! in get for sql: ${{ sql }}`);
                console.log(err);
            }
            if (next) {
                next(rows, this.lastID);
            }
        }
        );

    }


}





function dbInit(next) {
    
        db.run(`CREATE TABLE IF NOT EXISTS \`tokens\` (
                \`token\`	TEXT NOT NULL UNIQUE PRIMARY KEY
            );
            `,undefined,next);
}






