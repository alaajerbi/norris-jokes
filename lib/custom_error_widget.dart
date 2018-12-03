import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomErrorWidget(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 40.0, color: Colors.black54),
        SizedBox(height: 6.0),
        Text(text),
      ],
    );
  }
}
