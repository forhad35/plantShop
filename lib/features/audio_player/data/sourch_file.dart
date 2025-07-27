import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

int _nextMediaId = 0;
final playList = [
  AudioSource.uri(
    Uri.parse(
      "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    ),
    tag: MediaItem(
      id: '${_nextMediaId++}',
      album: "Science Friday",
      title: "A Salute To Head-Scratching Science",
      artUri: Uri.parse(
        "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
      ),
    ),
  ),
  AudioSource.uri(
    Uri.parse("https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3"),
    tag: MediaItem(
      id: '${_nextMediaId++}',
      album: "Science Friday",
      title: "From Cat Rheology To Operatic Incompetence",
      artUri: Uri.parse(
        "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
      ),
    ),
  ),

];
