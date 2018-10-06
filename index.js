const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.status(200).json({status: 'ok', messsage: 'Not hello world'});
});

app.listen(5000, () => console.log('Listen on port 5000'));

module.exports = app; // for testing
