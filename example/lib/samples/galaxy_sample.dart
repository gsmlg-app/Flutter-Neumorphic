import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class GalaxySample extends StatelessWidget {
  const GalaxySample({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFE5E5E5),
        depth: 20,
        intensity: 1,
        lightSource: LightSource.top,
      ),
      themeMode: ThemeMode.light,
      child: Material(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFFF1F1F1),
                Color(0xFFCFCFCF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: _Page()),
      ),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => _PageState();
}

class _PageState extends State<_Page> {
  Widget _letter(String letter) {
    return Text(letter,
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'Samsung',
            fontSize: 80));
  }

  Widget _firstBox() {
    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
      ),
      child: Neumorphic(
        style: const NeumorphicStyle(
          depth: -1,
          oppositeShadowLightSource: true,
        ),
        padding: const EdgeInsets.all(2),
        child: const SizedBox(
          width: 40,
          height: 60,
        ),
      ),
    );
  }

  Widget _secondBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 4),
      child: Transform.rotate(
        angle: 0.79,
        child: Neumorphic(
          style: NeumorphicStyle(
            lightSource: LightSource.topLeft,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          ),
          child: Neumorphic(
            style: const NeumorphicStyle(
              depth: -1,
              oppositeShadowLightSource: true,
              lightSource: LightSource.topLeft,
            ),
            child: const SizedBox(
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
              child: const TopBar(
                actions: <Widget>[
                  ThemeConfigurator(),
                ],
              ),
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _letter('G'),
                _firstBox(),
                _letter('l'),
                _secondBox(),
                _letter('x'),
                _letter('y'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
