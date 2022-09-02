import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color bkColor ;
  final Color? txtColor ;
  final void Function()? tap;

  const CustomButton({Key? key, required this.text,required this.bkColor, this.txtColor,required this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: tap,
      color: bkColor,
      child: Text(
        text,
        style: TextStyle(
          color:  txtColor ?? Colors.white,
        ),
      ),
    );
  }
}
