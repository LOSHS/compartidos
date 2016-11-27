var nconf = require('nconf');
nconf.set('url', 'localhost');
nconf.set('NODE_PORT', '8080');
nconf.set('NODE_HTTPS', false);
nconf.set('database', {
  user: 'root',
  password: 'celulares',
  server: 'localhost'
});