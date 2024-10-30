// models/Iphrases.dart

/// A class representing a phrase in both Japanese and English.
class Iphrases {
  final String sound; // Path to the audio file for the phrase
  final String jpName; // Japanese representation of the phrase
  final String enName; // English representation of the phrase

  const Iphrases({
    required this.jpName,
    required this.enName,
    required this.sound,
  });
}
