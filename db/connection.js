var mysql = require("mysql2");

let connection = mysql.createConnection({
  host: "localhost",
  user: "wang",
  password: "abcABC123$",
  database: "chat",
});

connection.connect();

module.exports = {
  connection,
};
