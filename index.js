var express = require("express");
var app = express();

app.listen(3000, () => {
 console.log("Server running on port 3000");
});

app.get("/", (req, res, next) => {
 res.json({firstname:"Abdul", lastname:"Salam"});
});

app.get("/fistname", (req, res, next) => {
 res.json({firstname:"Abdul"});
});
