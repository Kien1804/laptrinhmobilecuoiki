import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onPressed;

  const CircleButton({super.key, required this.icon, required this.label,this.onPressed});

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return  Column(
      children: [
        GestureDetector(
          onTap: onPressed,
        child: CircleAvatar(
          radius: w*.06,
          backgroundColor: Colors.redAccent,
          child: Center(
            child: Icon(icon, color: Colors.white,),
          ),
        ),
        ),
        SizedBox(height: h*.005,),
        Text(label),
      ],
    );
  }
}
