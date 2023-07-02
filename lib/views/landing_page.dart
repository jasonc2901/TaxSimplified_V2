import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:tax_simplified_new/config/colours.dart';
import 'package:tax_simplified_new/main.dart';
import 'package:tax_simplified_new/ui/rounded_button.dart';
import 'package:tax_simplified_new/utilities/shared_preferences.dart';
import 'package:tax_simplified_new/views/home.dart';

import '../utilities/get_it.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenDimension = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<ui.Image>(
        future: loadImage("assets/calc.png"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomPaint(
              size: screenDimension,
              painter: BackgroundPainter(snapshot.data!),
              child: getContent(context),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading image"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget getContent(BuildContext context) {
    Size screenDimension = MediaQuery.of(context).size;

    return SizedBox(
        width: screenDimension.width,
        height: screenDimension.height,
        child: Padding(
          padding: EdgeInsets.only(
              top: screenDimension.height * 0.1,
              left: screenDimension.width * 0.1,
              right: screenDimension.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Calculating your take home salary has never been easier. Tell us your salary and we handle the rest.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              const Spacer(),
              RoundedButton(
                text: "Get Started",
                color: orangeColor,
                padding: screenDimension.height * 0.05,
                onPressed: () async {
                  await setOpened();
                  Future.delayed(Duration.zero, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  });
                },
              ),
              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ));
  }
}

Future<void> setOpened() async {
  await getIt<SharedPrefs>().setBool("hasBeenOpened", true);
}

Future<ui.Image> loadImage(String imagePath) async {
  final ByteData imageData = await rootBundle.load(imagePath);
  final Uint8List bytes = imageData.buffer.asUint8List();
  final ui.Codec codec = await ui.instantiateImageCodec(bytes);
  final ui.FrameInfo frameInfo = await codec.getNextFrame();
  return frameInfo.image;
}

class BackgroundPainter extends CustomPainter {
  final ui.Image image;

  BackgroundPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    // Main background path
    Path background = Path();
    background.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = lightPurple;
    canvas.drawPath(background, paint);

    // Create the curved line for the top half of the screen
    paint.color = darkPurple;
    Path curve = Path();
    curve.lineTo(0, height * 0.33);
    curve.cubicTo(
      width * 0.2,
      height * 0.55,
      width,
      0.12,
      width + 20,
      height * 0.43,
    );

    curve.cubicTo(
      width,
      height * 0.99,
      width * 0.95,
      height,
      width + 50.0,
      height,
    );

    curve.cubicTo(0, height, 0, height, 0, height);
    canvas.drawPath(curve, paint);
    canvas.drawImage(image, Offset(size.width * 0.3, size.height * 0.3), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
