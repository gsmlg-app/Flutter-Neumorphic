import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

@immutable
class ColorSelector extends StatelessWidget {
  final Color? color;
  final ValueChanged<Color>? onColorChanged;
  final double height;
  final double width;

  const ColorSelector(
      {super.key,
      this.height = 40,
      this.width = 40,
      this.color,
      this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor(context);
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            )),
      ),
    );
  }

  void _changeColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: color!,
                onColorChanged: onColorChanged!,
                labelTypes: const [ColorLabelType.hex, ColorLabelType.rgb, ColorLabelType.hsv, ColorLabelType.hsl],
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
