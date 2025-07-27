import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:plant_shop/constens/custome_theme.dart';
import 'package:plant_shop/features/text_to_audio/text_to_audio.dart';
import 'package:plant_shop/gen/colors.gen.dart';

void main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.mycompany.myapp.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const UtillScreenMobile());
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 875),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
          canPop: false,

          child: GetMaterialApp(
            initialRoute: '/',
            theme: ThemeData(
              unselectedWidgetColor: Colors.white,
              primarySwatch: CustomTheme.kToDark,
              useMaterial3: false,
              scaffoldBackgroundColor: AppColors.cFFFFFF,
              appBarTheme: const AppBarTheme(
                color: AppColors.cFFFFFF,
                elevation: 0,
              ),
            ),
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            home: IsPriumeCheck(),
            // home: AudioPlayerScreen(),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class IsPriumeCheck extends StatelessWidget {
  IsPriumeCheck({super.key});
  bool isPriume = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TTS Line Highlight")),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                isPriume = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => TextToAudioScreen(isPremeium: isPriume),
                  ),
                );
              },
              child: Text("This is priume Service"),
            ),
            TextButton(
              onPressed: () {
                isPriume = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => TextToAudioScreen(isPremeium: isPriume),
                  ),
                );
              },
              child: Text("This is none priume Service"),
            ),
          ],
        ),
      ),
    );
  }
}
