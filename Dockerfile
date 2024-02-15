FROM node:14-alpine as build

WORKDIR /app

COPY code/index.html .
COPY code/styles.css .
COPY code/script.js .

EXPOSE 8080

CMD ["node", "-e", "const http = require('http'); const fs = require('fs'); const server = http.createServer((req, res) => { if (req.url === '/') { fs.readFile('index.html', (err, data) => { if (err) { res.writeHead(500); res.end('Error loading index.html'); } else { res.writeHead(200, { 'Content-Type': 'text/html' }); res.end(data); } }); } else if (req.url === '/styles.css') { fs.readFile('styles.css', (err, data) => { if (err) { res.writeHead(500); res.end('Error loading styles.css'); } else { res.writeHead(200, { 'Content-Type': 'text/css' }); res.end(data); } }); } else if (req.url === '/script.js') { fs.readFile('script.js', (err, data) => { if (err) { res.writeHead(500); res.end('Error loading script.js'); } else { res.writeHead(200, { 'Content-Type': 'text/javascript' }); res.end(data); } }); } else { res.writeHead(404); res.end('File not found'); } }); server.listen(8080);"]