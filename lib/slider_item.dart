import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final desc;

  SliderItem({@required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(0),
              child: Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: desc,
                    style: TextStyle(),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
