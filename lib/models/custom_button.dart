import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {required this.icon, required this.category, required this.onPressed});
  final String icon;
  final String category;
  final Function onPressed;
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  var color = themeColor.withOpacity(0.4);
  var opacity = 0.4;

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            setState(() {
              color = themeColor;
              opacity = 1;
            });
            widget.onPressed();
          },
          child: SizedBox(
            width: 120,
            height: 100,
            child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: color, width: 4),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Opacity(
                      opacity: opacity,
                      child: Image.asset(widget.icon),
                    ),
                    Text(widget.category,
                        style: TextStyle(color: color, fontSize: 15))
                  ],
                )),
          ),
        ));
  }
}
