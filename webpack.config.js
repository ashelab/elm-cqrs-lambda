var path = require('path');

module.exports = {  
  entry: './handler.js',
  target: 'node',
  module: {
    loaders: [
      {
        test: /\.elm$/,
        exclude: [
          /elm-stuff/,
          /node_modules/
        ],
        loader: 'elm-webpack-loader'
      }
    ]
  },
  resolve: {
    modulesDirectories: [ 'node_modules' ],
    extensions: [ '.js', '.elm', '' ]
  },
  output: {
    libraryTarget: 'commonjs2',
    path: path.join(__dirname, '.webpack'),
    filename: 'handler.js'
  },
};