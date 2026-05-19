import 'package:flutter/material.dart';
import 'layout_part1.dart';
import 'tutorial_11_2.dart';

class MyApp11_1 extends StatelessWidget {
  const MyApp11_1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABP Minggu 11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7367F0),
        ),
      ),
      home: const MyHomePage(title: 'ABP Minggu 11'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  final PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            // ---- Page 1: Home ----
            Center(
              child: InkWell(
                child: Text(
                  'Go to Home page',
                  style: TextStyle(fontSize: 30, color: Color(0xFF7367F0)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayoutPart1(),
                    ),
                  );
                },
              ),
            ),
            // ---- Page 2: Email (tutorial_11-2) ----
            const MyApp11_2(),
            // ---- Page 3: Profile ----
            Center(
              child: Text(
                'Profile page',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pc.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
