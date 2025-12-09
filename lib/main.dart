import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Tajwal",
        // Improve UX: Add subtle animations and better color scheme for accessibility
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff913162)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final PageController _controller = PageController(viewportFraction: 1.0);
  int _selectedServiceIndex = -1;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    // Improve UX: Auto-scroll carousel every 3 seconds for better engagement
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients && _controller.page!.round() < 4) {
        _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      } else {
        _controller.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  // Improve UX: Add haptic feedback and toast on service selection
  void _onServiceTap(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedServiceIndex = _selectedServiceIndex == index ? -1 : index;
    });
    Fluttertoast.showToast(
      msg: "تم تحديد ${_serviceNames[index]}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xff913162),
      textColor: Colors.white,
      fontSize: 12,
    );
  }

  // Improve UX: Simulate pull-to-refresh with a delay to show loading
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      // Simulate data refresh (e.g., update images or lists if dynamic)
    });
    _refreshController.refreshCompleted();
  }

  List<String> get _imgList => [
    "assets/hospital/we_will_follow_your_pregenancy.png",
    "assets/hospital/we_will_follow_your_pregenancy.png",
    "assets/hospital/we_will_follow_your_pregenancy.png",
    "assets/hospital/we_will_follow_your_pregenancy.png",
    "assets/hospital/we_will_follow_your_pregenancy.png",
  ];

  List<String> get _serviceIcons => [
    "assets/hospital/blood.svg",
    "assets/hospital/baby_positon.svg",
    "assets/hospital/online_genral.svg",
    "assets/hospital/sonar.svg",
    "assets/hospital/check.svg",
  ];

  List<String> get _serviceNames => [
    "الولادة الطبيعية",
    "تعديل وضع الجنين",
    "استشارة أون لاين",
    "سونار",
    "كشف",
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: _buildFloatingActionButton(),
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: SmartRefresher(  // Improve UX: Enable pull-to-refresh
          enablePullDown: true,
          header: const WaterDropHeader(
            complete: Text("تم التحديث"),
            waterDropColor: Color(0xff913162),
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: CustomScrollView(  // Improve UX: Use CustomScrollView for better performance and slivers
            slivers: [
              SliverToBoxAdapter(
                child: _buildHeaderSection(),
              ),

              SliverToBoxAdapter(
                child: _buildUpcomingAppointmentSection(),
              ),
              SliverToBoxAdapter(
                child: _buildServicesSection(),
              ),
              SliverToBoxAdapter(
                child: _buildFollowSections(),
              ),
              SliverToBoxAdapter(
                child: _buildDoctorsSection(),
              ),
              SliverToBoxAdapter(
                child: _buildHospitalsSection(),
              ),
              SliverToBoxAdapter(
                child: _buildArticlesSection(),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 100)),  // Extra padding for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          borderRadius: BorderRadius.circular(35),
          onTap: () {
            HapticFeedback.mediumImpact();  // Improve UX: Add haptic feedback
            // Action when FAB is tapped
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xff913162),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5),
            ),
            child: SvgPicture.asset(
              "assets/bottom_nav/home.svg",
              height: 24,
              width: 24,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      notchMargin: 0,
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => HapticFeedback.lightImpact(),  // Improve UX: Haptic on tap
              child: SvgPicture.asset(
                "assets/bottom_nav/chat.svg",
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
            ),
            InkWell(
              onTap: () => HapticFeedback.lightImpact(),
              child: SvgPicture.asset(
                "assets/bottom_nav/iconamoon_profile-light.svg",
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xff913162)),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 50),
              _buildUserHeader(),
              const SizedBox(height: 10),
              _buildSearchField(),
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: _buildCarouselSection(),
              )

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Row(
      children: [
        const SizedBox(width: 6),
        _buildProfileImage(36, 36),
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
        _whiteIcon("assets/hospital/messages.svg"),
        const SizedBox(width: 10),
        GestureDetector(  // Improve UX: Make icons tappable with feedback
          onTap: () => HapticFeedback.lightImpact(),
          child: _whiteIcon("assets/hospital/notification.svg"),
        ),
        const SizedBox(width: 6),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
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
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
        onTap: () => HapticFeedback.selectionClick(),  // Improve UX: Haptic on focus
      ),
    );
  }

  Widget _buildCarouselSection() {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 220,
          child: PageView.builder(  // Improve UX: Use builder for performance
            controller: _controller,
            itemCount: _imgList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  _imgList[index],
                  fit: BoxFit.fitWidth,
                  width: 0.99 * MediaQuery.of(context).size.width,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: _imgList.length,
          effect: const ScrollingDotsEffect(
            activeStrokeWidth: 1.3,
            activeDotScale: 1.0,
            smallDotScale: 1.0,
            maxVisibleDots: 5,
            radius: 8,
            spacing: 10,
            dotHeight: 12,
            dotWidth: 12,
            dotColor: Color(0xFFD9D9D9),
            activeDotColor: Color(0xFF913162),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildUpcomingAppointmentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("الموعد القادم", "عرض الكل"),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.ltr,
            child: _buildAppointmentCard(),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Color(0xff272727),
          ),
        ),
        const Spacer(),
        GestureDetector(  // Improve UX: Make "عرض الكل" tappable
          onTap: () => HapticFeedback.lightImpact(),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(minWidth: 78, minHeight: 24),
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              action,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: Color(0xff913162),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xFFE6E6E6), Color(0xFFFFFFFF)],
          stops: [0.0094, 0.5541],
        ),
        borderRadius: BorderRadius.circular(12),
        border: const Border(bottom: BorderSide(color: Color(0xFF888888), width: 2)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x00000026),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      constraints: const BoxConstraints(minHeight: 127),
      width: MediaQuery.of(context).size.width * 0.95,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileImage(50, 50),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dr.Mohammed Ahmed",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            color: const Color(0xFFFFD700),
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
                ),
                SvgPicture.asset(
                  "assets/hospital/comingsoon.svg",
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFF888888),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/hospital/calender.svg",
                  height: 12,
                  width: 12,
                  color: const Color(0xFF913162),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.access_time,
                  size: 12,
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
    );
  }

  Widget _buildServicesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("الخدمات المتوفرة", "عرض الكل"),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _serviceIcons.length,
              itemBuilder: (context, index) {
                return GestureDetector(  // Improve UX: Add tappable services with selection
                  onTap: () => _onServiceTap(index),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedServiceIndex == index ? const Color(0xff913162) .withOpacity(0.2): Colors.white,
                            border: Border.all(
                              color: _selectedServiceIndex == index
                                  ? const Color(0xff913162).withOpacity(0.2)
                                  : const Color(0xff888888),
                            ),
                          ),
                          child: SvgPicture.asset(
                            _serviceIcons[index],
                            height: 24,
                            width: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 49,
                          height: 26,
                          child: Text(
                            _serviceNames[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Color(_selectedServiceIndex == index ? 0xff913162 : 0xff888888),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowSections() {
    return Container(
   decoration:BoxDecoration(
     borderRadius: BorderRadius.circular(10)
   ),

      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/hospital/followpregenancy.png",
                  height: 198,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/hospital/follow_period.png",
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildDoctorsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("الخدمات المتوفرة", "عرض الكل"),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              height: 149,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final data = _getDoctorData(index);
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
                              color: const Color(0xff913162).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "4.5",
                                        style: TextStyle(fontSize: 6, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  left: 12,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(width: 2),
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xffFDD835),
                                        size: 6,
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    data['image']!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data['name']!,
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
        ],
      ),
    );
  }

  Map<String, String> _getDoctorData(int index) {
    switch (index) {
      case 0:
        return {"image": "assets/hospital/73c4217c760fd7b7ec8213be3621f2dd0c46f0bf.png", "name": "د. سليم منصور"};
      case 1:
        return {"image": "assets/hospital/52007819082f2292fb2ddd024f34b3456cdce255.png", "name": "د. مني السيد"};
      default:
        return {"image": "assets/hospital/0e5ac38a74d94b3eee3b705a626005e1190f79e5.png", "name": "د.أحمد محمد"};
    }
  }

  Widget _buildHospitalsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("المستشفيات", "عرض الكل"),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildHospitalCard(
                    image: "assets/hospital/c836d718c2cee6e47dc3f2a7faed31e4d1ed1fef.jpg",
                    name: "المستشفي الجوى التخصصي",
                    address: "شارع 11 - الزمالك - القاهرة",
                    services: "الولادة ، جراحات التجميل",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildHospitalCard(
                    image: "assets/hospital/c9726ae14178c0229dc516ef56cd32e892cb16ab.png",
                    name: "المستشفي النيل التخصصي",
                    address: "شارع 12 - المعادي - القاهرة",
                    services: "الولادة ، جراحات التجميل",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildHospitalCard({
    required String image,
    required String name,
    required String address,
    required String services,
  }) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 250
      ),
      decoration: BoxDecoration(
        color: const Color(0xff913162),
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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
                  (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            address,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            services,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildArticlesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("المقالات الطبية", "عرض الكل"),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: GestureDetector(  // Improve UX: Make articles tappable
                    onTap: () => HapticFeedback.mediumImpact(),
                    child: Container(
                      width: 206,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffF2EAEF),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
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
                                  shape:  BoxShape.circle
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/hospital/Frame 1171275179.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "د : شريف محمد",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff272727),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xff913162),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "المزيد ...",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xff913162), width: 1),
        image: const DecorationImage(
          image: AssetImage(   "assets/hospital/gooddoctor.jpg"),
          fit: BoxFit.cover,
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