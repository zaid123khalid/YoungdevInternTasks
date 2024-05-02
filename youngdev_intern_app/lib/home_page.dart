import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _skills = [
    {
      "title": "Multitalented",
      "image": 'assets/icon-1.png',
    },
    {
      "title": "Leaders",
      "image": 'assets/icon-2.png',
    },
    {
      "title": "Learners",
      "image": 'assets/icon-3.png',
    },
    {
      "title": "Developers",
      "image": 'assets/icon-4.png',
    },
    {
      "title": "Programmers",
      "image": 'assets/icon-5.png',
    },
    {
      "title": "IT Experts",
      "image": 'assets/icon-6.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/logo1.jpg',
          width: 50,
          height: 50,
        ),
        title: const Text("YoungDev Interns"),
        actions: [
          // menu builder
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
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/bg_3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Explore Remote Internships",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                      const Text(
                        "EMPOWERING TOMORROW'S DEVELOPERS TODAY",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      MaterialButton(
                          textColor: Colors.white,
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.pushNamed(context, "/internships");
                          },
                          child: const Text("Browse Internships"))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/bg_1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Explore Remote Internships",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      const Text(
                        "DISCOVER YOUR SKILLS",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      MaterialButton(
                          textColor: Colors.white,
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.pushNamed(context, "/internships");
                          },
                          child: const Text("Browse Internships"))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/bg_2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Explore Remote Internships",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      const Text(
                        "APPLY INTERNSHIPS FOR FREE",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      MaterialButton(
                          textColor: Colors.white,
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.pushNamed(context, "/internships");
                          },
                          child: const Text("Browse Internships"))
                    ],
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("We Are Hiring", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _skills.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple,
                      ),
                      width: 150,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _skills[index]["image"],
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            _skills[index]["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                  image: AssetImage('assets/ab.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'About Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      'Welcome To YoungDev Interns - Your Gateway To Skill Development!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    MaterialButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, "/about");
                        },
                        child: const Text('Read More')),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
