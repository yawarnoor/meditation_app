import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navItem(
            svgScr: "assets/icons/calendar.svg",
            title: "Today",
            press: () {},
          ),
          navItem(
            svgScr: "assets/icons/gym.svg",
            title: "All Excercises",
            press: () {},
            isActive: true,
          ),
          navItem(
            svgScr: "assets/icons/Settings.svg",
            title: "Settings",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class navItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final bool isActive;
  final void Function() press;
  const navItem({
    super.key,
    required this.svgScr,
    required this.title,
    this.isActive = false,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
