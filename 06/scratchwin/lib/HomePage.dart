import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// TODO: import images
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage lucky = AssetImage('images/rupee.png');
  AssetImage unlucky = AssetImage('images/sadFace.png');

// TODO: get an array
  List<String> itemArray = [];
  late int luckyNumber;

// TODO: Initialize the array with 25 elements
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.itemArray = List<String>.generate(25, (index) => "empty");
      generateRandomNumber();
    });
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      this.luckyNumber = random;
    });
  }

// TODO: define a getImage method
  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case 'lucky':
        return lucky;
      case "unlucky":
        return unlucky;
    }
    return circle;
  }

// TODO: playgame method
  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        this.itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        this.itemArray[index] = 'unlucky';
      });
    }
  }

// TODO: showAll method
  showAll() {
    setState(() {
      this.itemArray = List<String>.filled(25, 'unlucky');
      this.itemArray[luckyNumber] = "lucky";
    });
  }

// TODO: reset method
  resetGame() {
    setState(() {
      this.itemArray = List<String>.filled(25, "empty");
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.all(10.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: this.itemArray.length,
                      itemBuilder: (context, index) => SizedBox(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                            child: Image(
                              image: this.getImage(index),
                            ),
                            onPressed: () {
                              this.playGame(index);
                            },
                          )))),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                    onPressed: () => this.resetGame(),
                    child: Text('Reset Game')),
              )
            ],
          ),
        ));
  }
}
