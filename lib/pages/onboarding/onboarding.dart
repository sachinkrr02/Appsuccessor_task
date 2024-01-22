import 'package:flutter/material.dart';
import 'package:soundescape/pages/loginSignup/login.dart';

import 'package:soundescape/pages/onboarding/onboardingModel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0),
          height: height,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 560,
                  child: PageView.builder(
                    itemCount: demo_data.length,
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) => OnBoarding(
                      image: demo_data[index].image,
                      title: demo_data[index].title,
                      desc: demo_data[index].desc,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    demo_data.length,
                    (index) => buildDot(index, _currentPage == index),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(166, 146, 202, 100),
                        Color.fromRGBO(255, 255, 255, 100)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < demo_data.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.ease,
                        );
                      } else {
                        // Navigate to the login page when on the last onboarding screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const loginPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index, bool isActive) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding(
      {super.key,
      required this.image,
      required this.desc,
      required this.title});
  final String image, title, desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 300,
              width: 300,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
