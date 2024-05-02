import 'package:flutter/material.dart';
import 'package:youngdev_intern_app/home_page.dart';
import 'package:youngdev_intern_app/internships_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
          actions: [
            // menu builder
            PopupMenuButton(
              position: PopupMenuPosition.under,
              onSelected: (value) {
                var route = ModalRoute.of(context);
                if (value == "Home") {
                  Navigator.pushNamed(context, "/");
                } else if (value == "About") {
                  if (route != null && route.settings.name == "/about") {
                    return;
                  }
                  Navigator.pushNamed(context, "/about");
                } else if (value == "Internships") {
                  Navigator.pushNamed(context, "/internships");
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "Home",
                    child: Text("Home"),
                  ),
                  const PopupMenuItem(
                    value: "About",
                    child: Text("About"),
                  ),
                  const PopupMenuItem(
                    value: "Internships",
                    child: Text("Internships"),
                  ),
                ];
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/ab.jpg"),
                const Text(
                  "Why Choose Us?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  """At YoungDev Interns, We're Committed To Fostering Talent And Offering Exceptional Learning Experiences. We Believe In Breaking Down Barriers To Entry By Providing Free, Remote Internship Opportunities That Empower Aspiring Developers To Kickstart Their Careers.
            We Offer A Unique Month-Long Internship Program, Allowing You To Gain Practical Experience From The Comfort Of Your Own Workspace. Each Month, Interns Will Tackle 3 To 4 Real-World Tasks, Giving You Hands-On Exposure To Industry-Relevant Projects. Upon Successful Completion Of The Internship, We Provide A Certificate To Recognize Your Dedication And Skills Gained During Your Time With Us.""",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
