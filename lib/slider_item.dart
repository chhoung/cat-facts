import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final desc;

  SliderItem({@required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: desc,
              style: TextStyle(),
            ),
          ),
        ),
      ],
    );
  }
}
