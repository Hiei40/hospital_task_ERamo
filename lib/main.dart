import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "Tajwal"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final controller = PageController(viewportFraction: 1.0);
  int selectedServiceIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      "assets/hospital/we_will_follow_your_pregenancy.png",
      "assets/hospital/we_will_follow_your_pregenancy.png",
      "assets/hospital/we_will_follow_your_pregenancy.png",
      "assets/hospital/we_will_follow_your_pregenancy.png",
      "assets/hospital/we_will_follow_your_pregenancy.png",
    ];

    List<String> serviceIcons = [
      "assets/hospital/blood.svg",
      "assets/hospital/baby_positon.svg",
      "assets/hospital/online_genral.svg",
      "assets/hospital/sonar.svg",
      "assets/hospital/check.svg",
    ];
    List<String> servicename = [
      "الولادة الطبيعية",
      "تعديل وضع الجنين",
      "استشارة أون لاين",
      "سونار",
      "كشف",
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(minHeight: 300),
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xff913162)),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 50),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 6),

                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/hospital/UserProfileImage.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "أسراء فواد",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        const Text(
                                          "120 نقطة",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        SvgPicture.asset(
                                          "assets/hospital/UserPointsIconContainer.svg",
                                          width: 16,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Icons
                              _whiteIcon("assets/hospital/messages.svg"),
                              const SizedBox(width: 10),
                              _whiteIcon("assets/hospital/notification.svg"),
                              const SizedBox(width: 6),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: SvgPicture.asset(
                                "assets/hospital/search-normal.svg",
                                width: 10,
                                height: 10,
                                fit: BoxFit.scaleDown,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'تبحثي عن شي .. ؟',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff777777),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          constraints: const BoxConstraints(minHeight: 300),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),

                              Container(
                                constraints: BoxConstraints(minHeight: 300),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 220,
                                      width: double.infinity,
                                      child: PageView(
                                        controller: controller,

                                        children: imgList.map((item) {
                                          return Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              item,

                                              fit: BoxFit.fitWidth,
                                              width:
                                                  0.99 *
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    SmoothPageIndicator(
                                      controller: controller,
                                      count: imgList.length,
                                      effect: ScrollingDotsEffect(
                                        activeStrokeWidth: 1.3,
                                        activeDotScale: 1.0,
                                        smallDotScale: 1.0,
                                        maxVisibleDots: 5,
                                        radius: 8,
                                        spacing: 10,
                                        dotHeight: 12,
                                        dotWidth: 12,
                                        dotColor: const Color(0xFFD9D9D9),
                                        activeDotColor: const Color(0xFF913162),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "الموعد القادم",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xff272727),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints(
                                        minWidth: 78,
                                        minHeight: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF8F8F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "عرض الكل",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color: Color(0xff913162),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),

                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Color(0xFFE6E6E6),
                                        Color(0xFFFFFFFF),
                                      ],
                                      stops: [0.0094, 0.5541],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFF888888),
                                        width: 2,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x00000026),
                                        blurRadius: 4,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  constraints: const BoxConstraints(
                                    minHeight: 127,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        // Header Row
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Profile Image
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFF913162,
                                                  ),
                                                  width: 2,
                                                ),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                    "assets/hospital/UserProfileImage.png",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            // Doctor Info
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Dr.Mohammed Ahmed",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                // Star Rating
                                                Row(
                                                  children: List.generate(
                                                    5,
                                                    (index) => Icon(
                                                      index < 4
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                      color: const Color(
                                                        0xFFFFD700,
                                                      ),
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "Obstetrics and gynecology specialist",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF913162),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/hospital/comingsoon.svg",
                                                  width: 50,
                                                  height: 50,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        // Divider
                                        Container(
                                          width: double.infinity,
                                          height: 1,
                                          color: const Color(0xFF888888),
                                        ),
                                        const SizedBox(height: 12),
                                        // Date and Time Row
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/hospital/calender.svg",
                                              height: 16,
                                              width: 16,
                                              color: const Color(0xFF913162),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "Today",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.access_time,
                                              size: 16,
                                              color: Color(0xFF913162),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "07:00 - 07:30 pm",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "الخدمات المتوفرة",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xff272727),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints(
                                        minWidth: 78,
                                        minHeight: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF8F8F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "عرض الكل",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color: Color(0xff913162),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 120,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,

                                                  color:
                                                      selectedServiceIndex ==
                                                          index
                                                      ? Color(0xff913162)
                                                      : Colors.white,
                                                  border: Border.all(
                                                    color:
                                                        selectedServiceIndex ==
                                                            index
                                                        ? Color(
                                                            0xff913162,
                                                          ).withValues(
                                                            alpha: 0.2,
                                                          )
                                                        : Color(0xff888888),
                                                  ),
                                                ),

                                                child: SvgPicture.asset(
                                                  serviceIcons[index],
                                                  height: 24,
                                                  width: 24,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              SizedBox(
                                                width: 49,
                                                height: 24,
                                                child: Text(
                                                  servicename[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10,
                                                    color: Color(
                                                      selectedServiceIndex ==
                                                              index
                                                          ? 0xff913162
                                                          : 0xff888888,
                                                    ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: serviceIcons.length,
                                      shrinkWrap: true,
                                      scrollDirection: .horizontal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Spacer(),

                                  Image.asset(
                                    "assets/hospital/followpregenancy.png",
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),

                                  Spacer(),
                                  Spacer(),
                                ],
                              ),

                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Spacer(),
                                  Image.asset(
                                    "assets/hospital/follow_period.png",
                                    height: 240,
                                    fit: BoxFit.contain,
                                  ),
                                  Spacer(),
                                ],
                              ),

                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "الخدمات المتوفرة",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xff272727),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints(
                                        minWidth: 78,
                                        minHeight: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF8F8F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "عرض الكل",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color: Color(0xff913162),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: SizedBox(
                                  height: 149,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal, // fixed
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      String imagePath;
                                      String doctorName;

                                      if (index == 0) {
                                        imagePath =
                                            "assets/hospital/73c4217c760fd7b7ec8213be3621f2dd0c46f0bf.png";
                                        doctorName = "د. سليم منصور";
                                      } else if (index == 1) {
                                        imagePath =
                                            "assets/hospital/52007819082f2292fb2ddd024f34b3456cdce255.png";
                                        doctorName = "د. مني السيد";
                                      } else {
                                        imagePath =
                                            "assets/hospital/0e5ac38a74d94b3eee3b705a626005e1190f79e5.png";
                                        doctorName = "د.أحمد محمد";
                                      }

                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 127,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xff913162,
                                                  ).withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      top: 5,
                                                      left: 10,
                                                      child: const Icon(
                                                        Icons.star,
                                                        color: Color(
                                                          0xffFDD835,
                                                        ),
                                                        size: 10,
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Image.asset(
                                                        imagePath,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                doctorName,
                                                style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const Text(
                                                "أخصائي النساء والتوليد",
                                                style: TextStyle(
                                                  color: Color(0xffBCBCBC),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "المستشفيات",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xff272727),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints(
                                        minWidth: 78,
                                        minHeight: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF8F8F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "عرض الكل",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color: Color(0xff913162),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 220,
                                          width: 170,
                                          decoration: BoxDecoration(
                                            color: Color(0xff913162),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(6),
                                              bottomRight: Radius.circular(6),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        12,
                                                      ),
                                                      topRight: Radius.circular(
                                                        12,
                                                      ),
                                                    ),
                                                child: Image.asset(
                                                  "assets/hospital/c836d718c2cee6e47dc3f2a7faed31e4d1ed1fef.jpg",
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: 120,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "المستشفي الجوى التخصصي",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                  5,
                                                  (index) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                "شارع 11 - الزمالك - القاهرة",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                "الولادة ، جراحات التجميل",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 220,
                                          width: 170,
                                          decoration: BoxDecoration(
                                            color: Color(0xff913162),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(6),
                                              bottomRight: Radius.circular(6),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        12,
                                                      ),
                                                      topRight: Radius.circular(
                                                        12,
                                                      ),
                                                    ),
                                                child: Image.asset(
                                                  "assets/hospital/c9726ae14178c0229dc516ef56cd32e892cb16ab.png",
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: 120,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "المستشفي النيل التخصصي",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                  5,
                                                  (index) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                "شارع 12 - المعادي - القاهرة",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                "الولادة ، جراحات التجميل",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "المقالات الطبية",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: Color(0xff272727),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints(
                                        minWidth: 78,
                                        minHeight: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF8F8F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "عرض الكل",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color: Color(0xff913162),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
SizedBox(height: 10,),
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                      ),
                                      child: Container(
                                        width:206,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: Color(0xffF2EAEF),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "تطور المشاعر لدي المراهقين خلال البلوغ - التطور العاطفي ...",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff272727),
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      "assets/hospital/Frame 1171275179.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "د : شريف محمد",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff272727),
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 12,
                                                    vertical: 6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff913162),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      20,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "المزيد ...",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 2,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _whiteIcon(String path) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 36,
      width: 36,
      child: SvgPicture.asset(
        path,
        width: 20,
        height: 20,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
