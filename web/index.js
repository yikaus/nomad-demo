var http = require('http');
var os = require("os");

var server = http.createServer(function(req, res) {
  res.writeHead(200);
  res.end('Hello Http :'+os.hostname());
});
server.listen(3000);