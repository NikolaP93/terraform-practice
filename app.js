// app.js
const express = require('express');
const serverless = require('serverless-http'); // Import serverless-http

const app = express();
const PORT = process.env.PORT || 3000;

// Define a simple route
app.get('/hello', (req, res) => {
  console.log('Hello');
  res.send('Check the console for the message!');
});

// Export the handler for AWS Lambda
module.exports.handler = serverless(app); // Wrap the app with serverless-http

// Start the server locally (optional)
if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
}