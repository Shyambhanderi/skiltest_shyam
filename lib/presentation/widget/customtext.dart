import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final bool size;

  const CustomText({
    Key? key,
    required this.text,
    required this.color,
    this.size = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: size ? 20 : 15, fontStyle: FontStyle.italic),
    );
  }
}
