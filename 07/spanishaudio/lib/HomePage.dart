import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/src/audio_cache.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.amber, "Two"),
    NumberAudio("three.wav", Colors.blueGrey, "Three"),
    NumberAudio("four.wav", Colors.deepPurple, "Four"),
    NumberAudio("five.wav", Colors.indigo, "Five"),
    NumberAudio("six.wav", Colors.cyan, "Six"),
    NumberAudio("seven.wav", Colors.lime, "Seven"),
    NumberAudio("eight.wav", Colors.teal, "Eight"),
    NumberAudio("nine.wav", Colors.yellow, "Nine"),
    NumberAudio("ten.wav", Colors.green, "Ten"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Spanish Numbers")),
        body: Column(
          children: [
            Image(image: AssetImage('images/logo.png')),
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: numberList.length,
                    itemBuilder: (context, i) {
                      return SizedBox(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                this.play(this.numberList[i].audioUri);
                              },
                              child: Text(
                                numberList[i].buttonText,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: this.numberList[i].buttonColor)));
                    }))
          ],
        ));
  }
}
