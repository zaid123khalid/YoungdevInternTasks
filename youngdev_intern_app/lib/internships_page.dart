import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  final List _internships = [
    {
      "Title": "Full-Stack Web",
      "Description":
          "All The Tasks Will Be Assigned On Backend And Fronted Of The Website",
      "image": "assets/im-1.jpg",
    },
    {
      "Title": "Frontend Development",
      "Description":
          "All The Tasks Will Be Assigned On Only Fronted Of A Website",
      "image": "assets/im-2.jpg",
    },
    {
      "Title": "Backend Development",
      "Description":
          "All The Tasks Will Be Assigned On Only Backend Of A Website",
      "image": "assets/im-3.jpg",
    },
    {
      "Title": "Andriod Development",
      "Description":
          "The Tasks Will Be On Andriod Studio Using Java/Kotlin And Xml",
      "image": "assets/im-4.jpg",
    },
    {
      "Title": "Python Development",
      "Description": "Basic Tasks Of Python On Diffrent Modules",
      "image": "assets/im-5.jpg",
    },
    {
      "Title": "Flutter Development",
      "Description":
          "Flutter Tasks Will Be Assigned Like, Cross Platform Applications",
      "image": "assets/im-6.jpg",
    },
    {
      "Title": "C# .Net Development",
      "Description": "C# .Net 2 Simple And 1 Complex Task Will Be Assigned",
      "image": "assets/im-7.jpg",
    },
    {
      "Title": "ASP .NET Development",
      "Description": "Simple And Complex Tasks Will Be There Using ASP.Net",
      "image": "assets/im-8.jpg",
    },
    {
      "Title": "Django (Python)",
      "Description":
          "3 Tasks Will Be Assigned For A Month Using Django (Python)",
      "image": "assets/im-9.jpg",
    },
    {
      "Title": "Graphic Design",
      "Description":
          "All The Tasks Will Be Assigned To Done On AI And Also On Figma",
      "image": "assets/im-10.jpg",
    },
    {
      "Title": "Java Desktop",
      "Description": "The Tasks Will Be Assigned For Javaeffects",
      "image": "assets/im-11.jpg",
    },
    {
      "Title": "Machine Learning",
      "Description": "Machine Learning Complex Tasks Will Be Assigned",
      "image": "assets/im-12.jpg",
    },
    {
      "Title": "Wordpress",
      "Description":
          "Simple And Difficult Wordpress Tasks Will Be Assigned Here",
      "image": "assets/img-14.jpg",
    },
    {
      "Title": "C++",
      "Description": "C++ Complex And Simple Tasks Will Be Assigned",
      "image": "assets/im-16.jpg",
    },
    {
      "Title": "Figma Design",
      "Description":
          "Figma App Design And Web Design Tasks Will Be Assigned Here",
      "image": "assets/img-18.jpg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internships"),
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            onSelected: (value) {
              var route = ModalRoute.of(context);
              if (value == "Home") {
                if (route != null && route.settings.name == "/") {
                  return;
                }
                Navigator.pushNamed(context, "/");
              } else if (value == "About") {
                Navigator.pushNamed(context, "/about");
              } else if (value == "Internships") {
                if (route != null && route.settings.name == "/internships") {
                  return;
                }
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
      body: ListView.builder(
        itemCount: _internships.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(_internships[index]["image"]),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(_internships[index]["Title"],
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(_internships[index]["Description"],
                      style: const TextStyle(
                        fontSize: 15,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                          'https://docs.google.com/forms/d/e/1FAIpQLScKt4-z9Iwba5XSgSmg8V-CSbN0Wl_YYiaJ6993Y7OB4TfYaA/viewform');
                      if (await canLaunch(url.toString())) {
                        await launch(url.toString());
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    child: const Text("Apply Now"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
