//
//  A Node.js Server for the Tooter iOS App
//  server.js
//
//  Created by Dulio Denis on 2/12/16.
//  Copyright (c) 2015 ddApps. All rights reserved.
//  ------------------------------------------------
//
var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
  res.header("Aceess-Control-Allow-Methods", "POST, GET");
  next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

// Video Tutorials Data
var tutorials = [
  {
    id: 1,
    title: "UIKonf 2015 - Chris Eidhof: Functional View Controllers",
    description: "Chris Eidhof is a Dutch software developer living in Berlin. He spends most of his time building iOS and Mac apps, such as Deckset. He started UIKonf in 2013, http://objc.io, and wrote a book about Functional Programming in Swift.",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/uQFI9rDrl8s" frameborder="0" allowfullscreen></iframe></div>',
    thumbnail: "https://realm.io/assets/news/summit-chris-cover.png"
  },
  {
    id: 2,
    title: "dotSwift 2015 - Kyle Fuller - Practical Functional Programming in Swift",
    description: "A practical introduction to functional programming in Swift and how it can be applied to the real world. Going over what being functional means and how it allows you to write clearer, declarative and testable code.",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/L4zlqhMuNKw" frameborder="0" allowfullscreen></iframe></div>',
    thumbnail: "https://farm9.staticflickr.com/8678/16486853175_1d0f2b243a_k_d.jpg"
  },
  {
    id: 3,
    title: "Functional and Reactive Programming with Swift",
    description: "World-class software developer Ash Furrow talks about working with ReactiveCocoa and Swift.",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/tRCgBuJsNtg" frameborder="0" allowfullscreen></iframe></div>',
    thumbnail: "https://ashfurrow.com/img/blog/reactivecocoa-with-swift/1.jpg"
  }
];

// End Point
app.get('/tutorials', function(req, res){
  console.log("Get from server");
  res.send(tutorials); // sends back JSON
});

// start the server
app.listen(8081);
