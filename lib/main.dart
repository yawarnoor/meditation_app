import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/screens/details_screen.dart';
import './constants.dart';
import './widgets/category_card.dart';
import './widgets/bottom_navbar.dart';
import './widgets/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavbar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
                color: Color(0XFFF5CEB8),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                        AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0XFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    Text(
                      "Good Morning,\nYawar",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SearchBarWidget(),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: [
                          categoryCard(
                            svgSrc: "assets/icons/Hamburger.svg",
                            title: "Diet Recommendation",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen();
                                },
                              ));
                            },
                          ),
                          categoryCard(
                            svgSrc: "assets/icons/Excrecises.svg",
                            title: "Kegel Excersices",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen();
                                },
                              ));
                            },
                          ),
                          categoryCard(
                            svgSrc: "assets/icons/Meditation.svg",
                            title: "Meditation",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen();
                                },
                              ));
                            },
                          ),
                          categoryCard(
                            svgSrc: "assets/icons/yoga.svg",
                            title: "Yoga",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen();
                                },
                              ));
                            },
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
