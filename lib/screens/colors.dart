// screens/Colors.dart
import 'package:flutter/material.dart';
import '../models/inumbers.dart'; // Ensure this is the correct import
import 'package:audioplayers/audioplayers.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  ColorsPageState createState() => ColorsPageState();
}

class ColorsPageState extends State<ColorsPage> {
  final List<Inumbers> colors = const [
    Inumbers(
      sound: "sounds/colors/black.wav",
      image: "assets/images/colors/color_black.png",
      jpName: "kuro", // Japanese name for black
      enName: "black",
    ),
    Inumbers(
      sound: "sounds/colors/red.wav",
      image: "assets/images/colors/color_red.png",
      jpName: "aka", // Japanese name for red
      enName: "red",
    ),
    Inumbers(
      sound: "sounds/colors/green.wav",
      image: "assets/images/colors/color_green.png",
      jpName: "midori", // Japanese name for green
      enName: "green",
    ),
    Inumbers(
      sound: "sounds/colors/yellow.wav",
      image: "assets/images/colors/yellow.png",
      jpName: "kiiro", // Japanese name for yellow
      enName: "yellow",
    ),
    Inumbers(
      sound: "sounds/colors/white.wav",
      image: "assets/images/colors/color_white.png",
      jpName: "shiro", // Japanese name for white
      enName: "white",
    ),
    Inumbers(
      sound: "sounds/colors/brown.wav",
      image: "assets/images/colors/color_brown.png",
      jpName: "cha-iro", // Japanese name for brown
      enName: "brown",
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  void _playSound(String soundPath) async {
    try {
      await audioPlayer.setSource(AssetSource(soundPath));
      await audioPlayer.resume();
    } catch (e) {
      // Handle error (e.g., log it or show a snackbar)
      print('Error playing sound: $e');
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
        backgroundColor: const Color.fromARGB(255, 162, 31, 173),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return Container(
            height: 100,
            color: const Color.fromARGB(255, 112, 8, 98),
            child: Row(
              children: [
                Container(
                  color: const Color.fromARGB(255, 233, 209, 195),
                  child: Image.asset(color.image),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        color.jpName,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        color.enName,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () => _playSound(color.sound),
                    icon: const Icon(Icons.play_arrow),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
