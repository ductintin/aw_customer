
import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:aw_customer/ui/navpages/history_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aw_customer/ui/navpages/home_page.dart';
import 'package:aw_customer/ui/navpages/account_page.dart';

class HomeScreen extends StatefulWidget{
  static const String id = "home_screen";
  
  const HomeScreen({super.key});

  @override
    // TODO: implement createState
    _HomeScreenState createState()=> _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  PageController _pageController = PageController();

  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              allowImplicitScrolling: true,
              onPageChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                // Your first page widget
                HomePage(),
                HistoryPage(),
                AccountPage(),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time_rounded),
                label: 'Hoạt động',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Tài khoản',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColor.mainColor,
            onTap: _onItemTapped,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
            unselectedLabelStyle:const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
            ),
          ),
        );
  }
  
}