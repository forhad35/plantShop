import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';

import '../data/sourch_file.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  var thumbnailImgUrl =
      "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg";
  var player = AudioPlayer();
  bool loaded = false;
  bool playing = false;

  void loadMusic() async {
    await player.addAudioSources(playList);
    setState(() {
      loaded = true;
    });
  }

  void playMusic() async {
    setState(() {
      playing = true;
    });
    await player.play();
  }

  void pauseMusic() async {
    setState(() {
      playing = false;
    });
    await player.pause();
  }

  @override
  void initState() {
    loadMusic();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music Player")),
      body: Column(
        children: [
          const Spacer(flex: 2),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: StreamBuilder(
              stream: player.positionStream,
              builder: (context, snapshot1) {
                final Duration duration =
                    loaded
                        ? snapshot1.data as Duration
                        : const Duration(seconds: 0);
                return StreamBuilder(
                  stream: player.bufferedPositionStream,
                  builder: (context, snapshot2) {
                    final Duration bufferedDuration =
                        loaded
                            ? snapshot2.data as Duration
                            : const Duration(seconds: 0);
                    return SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              thumbnailImgUrl,
                              height: 350,
                              width: 350,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: ProgressBar(
                                progress: duration,
                                total:
                                    player.duration ??
                                    const Duration(seconds: 0),
                                buffered: bufferedDuration,
                                timeLabelPadding: -2,
                                timeLabelTextStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                progressBarColor: Colors.red,
                                baseBarColor: Colors.grey[200],
                                bufferedBarColor: Colors.grey[350],
                                thumbColor: Colors.red,
                                onSeek:
                                    loaded
                                        ? (duration) async {
                                          await player.seek(duration);
                                        }
                                        : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed:
                    loaded
                        ? () async {
                          if (player.position.inSeconds >= 8) {
                            await player.seek(
                              Duration(seconds: player.position.inSeconds - 8),
                            );
                          } else {
                            await player.seek(const Duration(seconds: 0));
                          }
                        }
                        : null,
                icon: const Icon(Icons.fast_rewind_rounded),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: IconButton(
                  onPressed:
                      loaded
                          ? () {
                            if (playing) {
                              pauseMusic();
                            } else {
                              playMusic();
                            }
                          }
                          : null,
                  icon: Icon(
                    playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed:
                    loaded
                        ? () async {
                          if (player.position.inSeconds + 8 <=
                              player.duration!.inSeconds) {
                            await player.seek(
                              Duration(seconds: player.position.inSeconds + 8),
                            );
                          } else {
                            await player.seek(const Duration(seconds: 0));
                          }
                        }
                        : null,
                icon: const Icon(Icons.fast_forward_rounded),
              ),
              IconButton(
                onPressed:
                    loaded
                        ? () async {
                          if (player.speed < 2) {
                            await player.setSpeed(player.speed + 0.25);
                            Fluttertoast.showToast(
                              msg: "${player.speed}x speed",
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "2x speed this is maximum",
                            );
                          }
                        }
                        : null,
                icon: const Icon(Icons.timer_3_select_sharp),
              ),
              IconButton(
                onPressed:
                    loaded
                        ? () async {
                          if (player.speed > 0.5) {
                            await player.setSpeed(player.speed - 0.25);
                            Fluttertoast.showToast(
                              msg: "${player.speed}x speed",
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "0.5x speed this is lowest",
                            );
                          }
                        }
                        : null,
                icon: const Icon(Icons.timer_10),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed:
                    loaded
                        ? () async {
                          await player.seekToPrevious();
                        }
                        : null,
                child: const Text(
                  "Previous",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed:
                    loaded
                        ? () async {
                          await player.seekToNext();
                        }
                        : null,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
