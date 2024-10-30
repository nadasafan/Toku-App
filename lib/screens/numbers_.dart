// screens/numbers_.dart
import 'package:flutter/material.dart';
import '../models/inumbers.dart'; // Ensure this is the correct import
import 'package:audioplayers/audioplayers.dart';

class Numbers extends StatefulWidget {
  const Numbers({Key? key}) : super(key: key);

  @override
  NumbersState createState() => NumbersState();
}

class NumbersState extends State<Numbers> {
  final List<Inumbers> numbers = const [
    Inumbers(
        sound: "assets/sounds/numbers/number_one_sound.mp3",
        image: "assets/images/numbers/number_one.png",
        jpName: "ichi",
        enName: "one"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_two_sound.mp3",
    //     image: "assets/images/numbers/number_two.png",
    //     jpName: "ni",
    //     enName: "two"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_three_sound.mp3",
    //     image: "assets/images/numbers/number_three.png",
    //     jpName: "san",
    //     enName: "three"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_four_sound.mp3",
    //     image: "assets/images/numbers/number_four.png",
    //     jpName: "yon",
    //     enName: "four"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_five_sound.mp3",
    //     image: "assets/images/numbers/number_five.png",
    //     jpName: "go",
    //     enName: "five"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_six_sound.mp3",
    //     image: "assets/images/numbers/number_six.png",
    //     jpName: "roku",
    //     enName: "six"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_seven_sound.mp3",
    //     image: "assets/images/numbers/number_seven.png",
    //     jpName: "nana",
    //     enName: "seven"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_eight_sound.mp3",
    //     image: "assets/images/numbers/number_eight.png",
    //     jpName: "hachi",
    //     enName: "eight"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_nine_sound.mp3",
    //     image: "assets/images/numbers/number_nine.png",
    //     jpName: "kyuu",
    //     enName: "nine"),
    // Inumbers(
    //     sound: "assets/sounds/numbers/number_ten_sound.mp3",
    //     image: "assets/images/numbers/number_ten.png",
    //     jpName: "juu",
    //     enName: "ten"),

    // Add other numbers...
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound(String soundPath) async {
    await _audioPlayer.setSource(AssetSource(soundPath));
    _audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers'),
        backgroundColor: const Color.fromARGB(255, 131, 69, 69),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final number = numbers[index];
          return Container(
            height: 100,
            color: const Color.fromARGB(255, 223, 102, 33),
            child: Row(
              children: [
                Container(
                  color: const Color.fromARGB(255, 233, 209, 195),
                  child: Image.asset(number.image),
                ),
                const SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      number.jpName,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      number.enName,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () => _playSound(number.sound),
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
