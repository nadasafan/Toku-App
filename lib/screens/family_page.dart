// screens/family_page.dart
import 'package:flutter/material.dart';
import '../models/inumbers.dart'; // Ensure this is the correct import
import 'package:audioplayers/audioplayers.dart';

class FamilyMembers extends StatefulWidget {
  const FamilyMembers({Key? key}) : super(key: key);

  @override
  FamilyMembersState createState() => FamilyMembersState();
}

class FamilyMembersState extends State<FamilyMembers> {
  final List<Inumbers> familyMembers = const [
    Inumbers(
        sound: "sounds/family_members/daughter.wav",
        image: "assets/images/family_members/family_daughter.png",
        jpName: "musume",
        enName: "daughter"),
    Inumbers(
        sound: "sounds/family_members/son.wav",
        image: "assets/images/family_members/family_son.png",
        jpName: "musuko",
        enName: "son"),
    Inumbers(
        sound: "sounds/family_members/mother.wav",
        image: "assets/images/family_members/family_mother.png",
        jpName: "haha",
        enName: "mother"),
    Inumbers(
        sound: "sounds/family_members/father.wav",
        image: "assets/images/family_members/family_father.png",
        jpName: "chichi",
        enName: "father"),
    Inumbers(
        sound: "sounds/family_members/grandmother.wav",
        image: "assets/images/family_members/family_grandmother.png",
        jpName: "obaasan",
        enName: "grandmother"),
    Inumbers(
        sound: "sounds/family_members/grandfather.wav",
        image: "assets/images/family_members/family_grandfather.png",
        jpName: "ojiisan",
        enName: "grandfather"),
    Inumbers(
        sound: "sounds/family_members/younger_brother.wav",
        image: "assets/images/family_members/family_younger_brother.png",
        jpName: "otōto",
        enName: "younger brother"),
    Inumbers(
        sound: "sounds/family_members/younger_sister.wav",
        image: "assets/images/family_members/family_younger_sister.png",
        jpName: "imōto",
        enName: "younger sister"),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  void _playSound(String soundPath) async {
    try {
      await audioPlayer.setSource(AssetSource(soundPath));
      await audioPlayer.resume();
    } catch (e) {
      // Handle error (e.g., show a snackbar)
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
        title: const Text('Family Members'),
        backgroundColor: const Color.fromARGB(255, 131, 69, 69),
      ),
      body: ListView.builder(
        itemCount: familyMembers.length,
        itemBuilder: (context, index) {
          final member = familyMembers[index];
          return Container(
            height: 100,
            color: const Color.fromARGB(255, 223, 102, 33),
            child: Row(
              children: [
                Container(
                  color: const Color.fromARGB(255, 233, 209, 195),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(member.image),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(member.jpName,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
                      Text(member.enName,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () => _playSound(member.sound),
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
