import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Animation Guide',
      debugShowCheckedModeBanner: false,
      home: Guide(),
    );
  }
}

class Guide extends StatefulWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  int index = 0;

  /// Title TextStyle
  TextStyle titletextStyle = const TextStyle(
      color: Colors.white, fontSize: 45, fontWeight: FontWeight.w300);

  /// SubTitle TextStyle
  TextStyle subTitletextStyle = const TextStyle(
      color: Color.fromARGB(255, 163, 163, 163),
      fontSize: 17,
      fontWeight: FontWeight.w300);

  /// Func For changing BackGround Container Width
  double changeContainerWidth(int index) {
    switch (index) {
      case 0:
        return 0;
      case 1:
        return 100;
      case 2:
        return 200;
      case 3:
        return 280;
      default:
        return 0;
    }
  }

  /// Center Content
  Widget centerContent(int index) {
    switch (index) {
      case 0:
        return Content(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'Tutorial Memesan Lapangan',
          subTitle: '',
        );
      case 1:
        return Content(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'Mendaftar',
          subTitle: 'Daftar Akun dulu Bray',
        );
      case 2:
        return Content(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'Login',
          subTitle: 'Nahhh abis itu login bro ke aplikasi',
        );
      case 3:
        return Content(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'Pesan',
          subTitle: 'Pesan Lapangan mana yang lu mau',
        );

      default:
        return Content(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: '',
          subTitle: '',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      backgroundColor: index == 4 ? Colors.black54 : Colors.black54,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: index == 4 ? Alignment.center : Alignment.centerLeft,
            children: [
              // MAIN BACKGROUND
              mainBg(size),

              /// BTNS
              if (index == 4)
                finishBtn()
              else if (index == 0)
                startBtn()
              else
                twoBottomBtn(),

              index == 4
                  ? Lottie.asset('assets/1.json',
                      height: 250, animate: index == 4 ? true : false)
                  : Container(),
              Center(
                child: centerContent(index),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// TWO BOTTOM BUTTON
  Positioned twoBottomBtn() {
    return Positioned(
      bottom: 15,
      left: 60,
      right: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                index == 0 ? index = 4 : index--;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 54, 54, 54),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 30,
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index == 4 ? index = 0 : index++;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 54, 54, 54),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// FINISH BUTTON
  Positioned finishBtn() {
    return Positioned(
      bottom: 15,
      left: 60,
      right: 60,
      child: GestureDetector(
        onTap: () {
          setState(() {
            index == 4 ? index = 0 : index++;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 90,
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 54, 54, 54),
              borderRadius: BorderRadius.circular(index == 4 ? 20 : 10)),
          child: const Center(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }

  /// FINISH BUTTON
  Positioned startBtn() {
    return Positioned(
      bottom: 15,
      left: 60,
      right: 60,
      child: GestureDetector(
        onTap: () {
          setState(() {
            index = 1;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 90,
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 54, 54, 54),
              borderRadius: BorderRadius.circular(index == 4 ? 20 : 10)),
          child: const Center(
            child: Text(
              "Start",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }

  /// MAIN BACKGROUND Container
  AnimatedContainer mainBg(Size size) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: index == 4 ? BorderRadius.circular(100) : null),
      width: changeContainerWidth(index),
      height: index == 4 ? 200 : size.height,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
  }
}

/// APP BAR
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: Column(
        children: const [
          Text("4 Cara booking Lapangan"),
          SizedBox(
            height: 2,
          ),
          Text(
            "Tech Id",
            style: TextStyle(color: Colors.white60, fontSize: 14),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

/// Center Widget Components
class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.titletextStyle,
    required this.subTitletextStyle,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final TextStyle titletextStyle;
  final TextStyle subTitletextStyle;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: titletextStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: subTitletextStyle,
          ),
        ),
      ],
    );
  }
}
