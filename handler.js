'use strict';

var app = require('./src/Main');

module.exports.hello = (event, context, callback) => {
  const input = JSON.stringify({
    event: event,
    context: context
  });
  const worker = app.Main.worker(input);
  worker.ports.response.subscribe(function(data) {
    try {
      callback(null, callback(null, {
        statusCode: 200,
        body: JSON.stringify(data)
      }));
    } catch(ex) {
      callback(null, callback(null, {
        statusCode: 500,
        body: JSON.stringify({
          message: ex
        })
      }));
    }
  });
};
