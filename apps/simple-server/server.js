require('http').createServer(function handleRequest(req, res) {
  res.writeHead(200, { 'content-type': 'text/plain'});
  res.end('My simple nodejs server');
}).listen(8008);
