import 'package:flutter/material.dart';

class Code extends StatelessWidget {
  final String text;

  const Code(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey.withValues(alpha: 0.2),
      child: Text(
        text,
        style: TextStyle(color: Colors.black.withValues(alpha: 0.8)),
      ),
    );
  }
}

class MyIntWidget extends StatefulWidget {
  final int value;

  const MyIntWidget({super.key, required this.value});

  @override
  _MyIntWidgetState createState() => _MyIntWidgetState();
}

class _MyIntWidgetState extends State<MyIntWidget>
    with TickerProviderStateMixin {
  late int _value;
  late AnimationController _controller;
  late Animation<int> _valueAnimation;

  @override
  void initState() {
    _value = widget.value;
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    super.initState();
  }

  @override
  void didUpdateWidget(MyIntWidget oldWidget) {
    if (oldWidget.value != widget.value) {
      _controller.reset();
      _valueAnimation =
          Tween(begin: _value, end: widget.value).animate(_controller)
            ..addListener(() {
              _value = _valueAnimation.value;
            });
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('current : $_value');
  }
}
