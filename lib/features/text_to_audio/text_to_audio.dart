// ignore_for_file: unused_field

import 'dart:io';
import 'dart:math';

// ignore: unused_shown_name
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class TextToAudioScreen extends StatefulWidget {
  const TextToAudioScreen({super.key, required this.isPremeium});
  final bool isPremeium;
  @override
  State<StatefulWidget> createState() => _TextToAudioScreen();
}

enum TtsState { playing, stopped, paused, continued }

class _TextToAudioScreen extends State<TextToAudioScreen>
    with WidgetsBindingObserver {
  final FlutterTts flutterTts = FlutterTts();
  final String _text =
      "In Flutter, showing a realtime camera preview can be achieved using the camera package.This package allows developers to access the device's camera and display a live video feed. It is useful for barcode scanners, video apps, and AR features. It supports switching cameras, resolution control, photo capture, and video recording.";
  final String _text2 =
      "Zhōngguó shì yīgè lìshǐ yōujiǔ de guójiā, yōngyǒu fēngfù de wénhuà hé měilì de fēngjǐng. Běijīng shì Zhōngguó de shǒudū, yǒu hěnduō zhùmíng de gǔjī, bǐrú Chángchéng hé Gùgōng. Zhōngguó rén zhǔyào shuō pǔtōnghuà, dàn yě yǒu yīxiē dìfāng fāngyán, bǐrú Guǎngdōnghuà. Xiàndài Zhōngguó kējì fāzhǎn hěn kuài, xǔduō rén zài shǐyòng shǒujī héhùliánwǎng.";

  final String _text3 =
      "中国是一个历史悠久的国家，拥有丰富的文化和美丽的风景。北京是中国的首都，有很多著名的古迹，比如长城和故宫。中国人主要说普通话，但也有一些地方方言，比如广东话。现代中国科技发展很快，许多人在使用手机和互联网。";
  final List lines = [];
  bool isStop = false;
  bool isChines = false;

  int? currentIndex, endIndex;
  bool isSpeaking = false;
  List voices = [];

  voicesss() async {
    var local = await flutterTts.getVoices;
    for (var voice in local) {
      if (voice.toString().toLowerCase().contains("zh-cn")) {
        voices.add(voice);
      }
    }
  }

  voiceSet() async {
    flutterTts.progressHandler = (
      String text,
      int start,
      int end,
      String voice,
    ) {
      setState(() {
        currentIndex = start;
        endIndex = end + 1;
      });
    };
  }

  @override
  void initState() {
    voiceSet();
    voicesss();

    WidgetsBinding.instance.addObserver(this); // Add observer
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (!widget.isPremeium) {
        flutterTts.stop();
        flutterTts.clearVoice();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    flutterTts.stop();
    flutterTts.clearVoice();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TTS Line Highlight")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    if (endIndex == null)
                      TextSpan(
                        text: isChines ? _text2 : _text,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                    if (endIndex != null)
                      TextSpan(
                        text:
                            isChines
                                ? _text2.substring(0, endIndex)
                                : _text.substring(0, endIndex),
                        style: TextStyle(
                          color: endIndex == null ? Colors.black : Colors.red,
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                    if (endIndex != null)
                      TextSpan(
                        text:
                            isChines
                                ? _text2.substring(endIndex!)
                                : _text.substring(endIndex!),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              // color: Colors.grey,
              child: ListView.builder(
                itemCount: voices.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () async {
                      var maps = {
                        "name": "${voices[index]["name"]}",
                        "locale": "${voices[index]["locale"]}",
                      };
                      await flutterTts.setVoice(maps);
                    },
                    child: Text("$index ${voices[index]}"),
                  );
                },
              ),
            ),
            Text("${widget.isPremeium}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (isChines) {
                      flutterTts.setLanguage("en-US");
                      voiceSet();
                      setState(() {
                        isChines = false;
                      });
                    } else {
                      flutterTts.setLanguage("zh-TW");
                      voiceSet();

                      setState(() {
                        isChines = true;
                      });
                    }
                    setState(() {});
                  },
                  child: Text(isChines ? "English" : "Chinese"),
                ),

                ElevatedButton(
                  onPressed: () async {
                    flutterTts.stop();
                    flutterTts.clearVoice();
                    flutterTts.setSpeechRate(0.5);
                    setState(() {
                      isSpeaking = false;
                    });
                  },
                  child: Text(".."),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // var enginge = await flutterTts.getEngines;

                    // print("enginge $enginge");

                    // var voice = await flutterTts.getLanguages;

                    // print("voice $voice");
                    checkVoiceGender();

                    // var silence = await flutterTts.setSilence(2);

                    // var engines = await flutterTts.getEngines;

                    // var defaultVoice = await flutterTts.getDefaultVoice;
                    // var isLanguageInstalled = await flutterTts
                    //     .isLanguageInstalled("en-AU");

                    // var languagesInstalled = await flutterTts
                    //     .areLanguagesInstalled(["en-AU", "en-US"]);

                    // var maxSpeechInputLength =
                    //     await flutterTts.getMaxSpeechInputLength;

                    // await flutterTts.setAudioAttributesForNavigation();
                    // print("maxSpeechInputLength $maxSpeechInputLength");
                    // print("queueMode $queueMode");
                    // print("languagesInstalled $languagesInstalled");
                    // print("isLanguageInstalled $isLanguageInstalled");
                    // print("defaultVoice $defaultVoice");
                    // print("engines $engines");
                    // print("silence $silence");
                  },
                  child: Text("speed"),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (isChines) {
                      flutterTts.speak(_text2);
                      isStop = false;
                    } else {
                      flutterTts.speak(_text);
                    }
                  },
                  child: Text("Read Paragraph"),
                ),

                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Request permission
                      final status = await Permission.storage.request();

                      if (status.isDenied ||
                          status.isRestricted ||
                          status.isPermanentlyDenied) {
                        Fluttertoast.showToast(
                          msg:
                              "Permission denied. Please allow storage access.",
                        );

                        return;
                      }

                      // Create download path
                      final Directory downloadsDir = Directory(
                        '/storage/emulated/0/Download',
                      );
                      if (!await downloadsDir.exists()) {
                        await downloadsDir.create(recursive: true);
                      }

                      var random = Random();
                      String path =
                          "${downloadsDir.path}/audio${random.nextInt(100)}.mp3";

                      // Save synthesized audio
                      await flutterTts.synthesizeToFile(_text2, path, true);
                      Fluttertoast.showToast(msg: "Download Completed");
                    } catch (e) {
                      Fluttertoast.showToast(msg: "$e");
                      if (kDebugMode) {
                        print("Error downloading audio: $e");
                      }
                    }
                  },
                  child: Text("Download"),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (isStop) {
                      if (isChines) {
                        flutterTts.speak(_text2.substring(endIndex!));
                        isStop = false;
                      } else {
                        flutterTts.speak(_text.substring(endIndex!));
                      }
                      setState(() {
                        isStop = false;
                      });
                    } else {
                      flutterTts.pause();
                      setState(() {
                        isStop = true;
                      });
                    }
                  },
                  child: isStop ? Text("Continue") : Text("Stop"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void checkVoiceGender() async {
  FlutterTts flutterTts = FlutterTts();

  List<dynamic> voices = await flutterTts.getVoices;

  int maleCount = 0;
  int femaleCount = 0;
  int unknownCount = 0;
  int maleCountTW = 0;
  int femaleCountTW = 0;
  int unknownCountTW = 0;
  int maleCountTR = 0;
  int femaleCountTR = 0;
  int unknownCountTR = 0;
  int simplefied = 0;
  int traditional = 0;
  int traditionalHk = 0;

  for (var voice in voices) {
    final name = voice["name"]?.toLowerCase() ?? "";
    final locale = voice["locale"] ?? "";
    // Try to guess gender from voice name

    // Optional: Print only Chinese-related voices
    if (locale.toString().toLowerCase().contains("zh-tw")) {
      if (name.contains("-a") || name.contains("female")) {
        femaleCountTW++;
      } else if (name.contains("-b") ||
          name.contains("-d") ||
          name.contains("male")) {
        maleCountTW++;
      } else {
        unknownCountTW++;
      }
      traditional++;
      print("traditional Taiwan VOICE: $voice");
    } else if (locale.toString().toLowerCase().contains("yue-hk")) {
      if (name.contains("-a") || name.contains("female")) {
        femaleCountTR++;
      } else if (name.contains("-b") ||
          name.contains("-d") ||
          name.contains("male")) {
        maleCountTR++;
      } else {
        unknownCountTR++;
      }
      traditionalHk++;
      print("traditional HK VOICE: $voice");
    } else if (locale.toString().toLowerCase().contains("zh-cn")) {
      if (name.contains("-a") || name.contains("female")) {
        femaleCount++;
      } else if (name.contains("-b") ||
          name.contains("-d") ||
          name.contains("male")) {
        maleCount++;
      } else {
        unknownCount++;
      }
      simplefied++;
      print("CHINESE VOICE: $voice");
    }
  }

  print("✅ Female Voices cn: $femaleCount");
  print("✅ Male Voices cn: $maleCount");
  print("❓ Unknown Gender Voices cn: $unknownCount");

  print("✅ Simplified Voices: $simplefied");
  print("✅ Traditional Voices: $traditional");
  print("✅ Traditional HK Voices: $traditionalHk");

  print("✅ Female Voices (TW): $femaleCountTW");
  print("✅ Male Voices (TW): $maleCountTW");
  print("❓ Unknown Gender Voices (TW): $unknownCountTW");

  print("✅ Female Voices (TR): $femaleCountTR");
  print("✅ Male Voices (TR): $maleCountTR");
  print("❓ Unknown Gender Voices (TR): $unknownCountTR");
}
