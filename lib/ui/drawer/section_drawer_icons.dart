import 'package:flutter/material.dart';

class SectionDrawerIcons extends StatelessWidget {
  String imagePath;
  String text;

  SectionDrawerIcons({required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(imagePath),
            color: Colors.white,
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
