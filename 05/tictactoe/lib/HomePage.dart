import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Link all the images
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  bool isCross = true;
  String message = '';
  List<String> gameState = [];

  // TODO: Initialize the state of box as empty
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  // TODO: Get Image
  AssetImage getImage(String value) {
    switch (value) {
      case 'empty':
        return edit;
      case 'cross':
        return cross;
      case 'circle':
        return circle;
    }
    return edit;
  }

  // TODO: playGame Method
  playGame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        this.gameState[index] = this.isCross ? 'cross' : 'circle';
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  // TODO: Reset Game
  void resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = '';
    });
  }

  // TODO: Check for win
  checkWin() {
    if (this.gameState[0] != 'empty' &&
        (this.gameState[0] == this.gameState[1] &&
            this.gameState[0] == this.gameState[2])) {
      setState(() {
        this.message = "${this.gameState[0]} wins!";
      });
    } else if (this.gameState[0] != 'empty' &&
        (this.gameState[0] == this.gameState[3] &&
            this.gameState[0] == this.gameState[6])) {
      setState(() {
        this.message = "${this.gameState[0]} wins!";
      });
    } else if (this.gameState[0] != 'empty' &&
        (this.gameState[0] == this.gameState[4] &&
            this.gameState[0] == this.gameState[8])) {
      setState(() {
        this.message = "${this.gameState[0]} wins!";
      });
    } else if (this.gameState[1] != 'empty' &&
        (this.gameState[1] == this.gameState[4] &&
            this.gameState[1] == this.gameState[7])) {
      setState(() {
        this.message = "${this.gameState[1]} wins!";
      });
    } else if (this.gameState[2] != 'empty' &&
        (this.gameState[2] == this.gameState[5] &&
            this.gameState[2] == this.gameState[8])) {
      setState(() {
        this.message = "${this.gameState[2]} wins!";
      });
    } else if (this.gameState[2] != 'empty' &&
        (this.gameState[2] == this.gameState[4] &&
            this.gameState[2] == this.gameState[6])) {
      setState(() {
        this.message = "${this.gameState[2]} wins!";
      });
    } else if (this.gameState[3] != 'empty' &&
        (this.gameState[3] == this.gameState[4] &&
            this.gameState[3] == this.gameState[5])) {
      setState(() {
        this.message = "${this.gameState[3]} wins!";
      });
    } else if (this.gameState[6] != 'empty' &&
        (this.gameState[6] == this.gameState[7] &&
            this.gameState[6] == this.gameState[8])) {
      setState(() {
        this.message = "${this.gameState[6]} wins!";
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = "It's a draw!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.all(20),
            itemCount: this.gameState.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 100,
                height: 100,
                child: MaterialButton(
                    onPressed: () {
                      this.playGame(index);
                    },
                    child: Image(image: this.getImage(this.gameState[index]))),
              );
            },
          )),
          Padding(padding: EdgeInsets.all(5), child: Text(this.message)),
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: this.resetGame,
              child: Text("Reset Game"),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 100))
        ],
      ),
    );
  }
}
