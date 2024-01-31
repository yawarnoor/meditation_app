import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/widgets/bottom_navbar.dart';
import '../widgets/search_bar.dart';
import 'package:meditation_app/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavbar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/meditation_bg.png"),
                    fit: BoxFit.fitWidth)),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("3-10 Minutes Course",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                        "Live Happier and Healthier by Learning the Fundamentals of Meditation"),
                  ),
                  SizedBox(
                    width: size.width * 0.5,
                    child: SearchBarWidget(),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SessionCard(
                        sessionNumber: "1",
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNumber: "2",
                        press: () {},
                      ),
                      SessionCard(
                        sessionNumber: "3",
                        press: () {},
                      ),
                      SessionCard(
                        sessionNumber: "4",
                        press: () {},
                      ),
                      SessionCard(
                        sessionNumber: "5",
                        press: () {},
                      ),
                      SessionCard(
                        sessionNumber: "6",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.all(10),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 17),
                              spreadRadius: -13,
                              blurRadius: 23,
                              color: kShadowColor)
                        ]),
                    child: Row(children: [
                      SvgPicture.asset(
                          "assets/icons/Meditation_women_small.svg"),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Basic 2",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text("Start to Deepen Your Practice")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/Lock.svg"),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final String sessionNumber;
  final bool isDone;
  final void Function() press;
  const SessionCard(
      {super.key,
      required this.sessionNumber,
      this.isDone = false,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 13),
                  color: kShadowColor,
                  blurRadius: 23,
                  spreadRadius: -13),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDone ? kBlueColor : Colors.white,
                          border: Border.all(color: kBlueColor)),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Session $sessionNumber",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
