import 'package:flutter/material.dart';
import 'package:news/ui/drawer/section_drawer_icons.dart';

class DrawerHome extends StatelessWidget {
  Function drawerOnClicked;

  DrawerHome({required this.drawerOnClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            height: height * 0.20,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Text(
                'News App',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
            onTap: () {
              drawerOnClicked();
            },
            child: SectionDrawerIcons(
                text: 'Go To Home', imagePath: 'assets/images/home.png')),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          thickness: 1.5,
          color: Colors.white,
          endIndent: width * 0.04,
          indent: width * 0.04,
        ),
        SectionDrawerIcons(text: 'Theme', imagePath: 'assets/images/theme.png'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Dark", style: TextStyle(fontSize: 20, color: Colors.white)),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 30,
            )
          ]),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          thickness: 1.5,
          color: Colors.white,
          endIndent: width * 0.04,
          indent: width * 0.04,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        SectionDrawerIcons(
            text: 'Language', imagePath: 'assets/images/lan.png'),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("English",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 30,
            )
          ]),
        ),
      ],
    );
  }
}
