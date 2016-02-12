# Tooter Server Backend
This is a Node.js backend that returns a list for the iOS App.

It was created with the following three steps:

1. npm init
2. npm install --save express
3. npm install --save body-parser

npm init writes the package.json for us.
Then we install the two packages express, a minimalist web framework, and body-parser a body parsing middleware package.

Run the server with the command:
> node server.js

To test the set-up from a browser enter:
> http://localhost:8081/tutorials

The server will return JSON.