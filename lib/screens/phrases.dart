// screens/phrases.dart
import 'package:flutter/material.dart';
import 'package:toko/models/Iphrases.dart'; // Ensure this is the correct import
import 'package:audioplayers/audioplayers.dart';

class PhrasesPage extends StatefulWidget {
  const PhrasesPage({Key? key}) : super(key: key);

  @override
  PhrasesPageState createState() => PhrasesPageState();
}

class PhrasesPageState extends State<PhrasesPage> {
  final List<Iphrases> phrases = const [
    Iphrases(
      sound: "sounds/phrases/are_you_coming.wav",
      jpName: "kuru no ka", // Japanese for "Are you coming?"
      enName: "Are you coming?",
    ),
    Iphrases(
      sound: "sounds/phrases/dont_forget_to_subscribe.wav",
      jpName:
          "suki na hito o wasurenaide ne", // Japanese for "Don't forget to subscribe!"
      enName: "Don't forget to subscribe!",
    ),
    Iphrases(
      sound: "sounds/phrases/how_are_you_feeling.wav",
      jpName: "genki desu ka", // Japanese for "How are you?"
      enName: "How are you feeling?",
    ),
    Iphrases(
      sound: "sounds/phrases/i_love_anime.wav",
      jpName: "anime ga daisuki", // Japanese for "I love anime"
      enName: "I love anime!",
    ),
    Iphrases(
      sound: "sounds/phrases/i_love_programming.wav",
      jpName: "programming ga daisuki", // Japanese for "I love programming"
      enName: "I love programming!",
    ),
    Iphrases(
      sound: "sounds/phrases/programming_is_easy.wav",
      jpName: "programming wa kantan", // Japanese for "Programming is easy"
      enName: "Programming is easy!",
    ),
    Iphrases(
      sound: "sounds/phrases/what_is_your_name.wav",
      jpName:
          "anata no namae wa nan desu ka", // Japanese for "What is your name?"
      enName: "What is your name?",
    ),
    Iphrases(
      sound: "sounds/phrases/where_are_you_going.wav",
      jpName: "doko ni ikimasu ka", // Japanese for "Where are you going?"
      enName: "Where are you going?",
    ),
    Iphrases(
      sound: "sounds/phrases/yes_im_coming.wav",
      jpName: "hai, iku yo", // Japanese for "Yes, I'm coming"
      enName: "Yes, I'm coming!",
    ),
    // Add more unique phrases here...
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  void _playSound(String soundPath) async {
    await audioPlayer.stop(); // Stop any currently playing sound
    await audioPlayer.setSource(AssetSource(soundPath));
    audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phrases'),
        backgroundColor: const Color.fromARGB(255, 34, 75, 187),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          final phrase = phrases[index];
          return Container(
            height: 100,
            color: const Color.fromARGB(255, 62, 33, 223),
            child: Row(
              children: [
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phrase.jpName,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        phrase.enName,
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
                    onPressed: () => _playSound(phrase.sound),
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
