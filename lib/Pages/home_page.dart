// import 'package:aerovania_app/Pages/home_screen.dart';
// import 'package:aerovania_app/services/auth/auth_servieces.dart';
import 'package:aerovania_app/Pages/bottom%20navigation%20bar/search_page.dart';
import 'package:aerovania_app/Pages/side%20navigation%20bar/product_screen.dart';
import 'package:aerovania_app/Pages/side%20navigation%20bar/settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import 'bottom navigation bar/cart_page.dart';
import 'bottom navigation bar/favorite_page.dart';
import 'side navigation bar/about_screen.dart';
import 'side navigation bar/contact_screen.dart';
import 'side navigation bar/course_screen.dart';
import 'side navigation bar/history_screen.dart';
import 'side navigation bar/home_screen.dart';
import 'side navigation bar/media_screen.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// import 'settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Widget> _sidenavpages = [
  const HomeScreen(),
  const CourseScreen(),
  const ProductScreen(),
  const HistoryScreen(),
  const MediaScreen(),
  const SettingsScreen(),
  const AboutScreen(),
  const ContactScreen()
];

final List<Widget> _bottomnavpages = [
  const HomeScreen(),
  const SearchScreen(),
  const CartScreen(),
  const FavoriteScreen()
];

var selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  // final int _page = 0;
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

//   void signOut() {
//     final authServices = Provider.of<AuthServices>(context, listen: false);
//     authServices.signOut();
//   }

  // int _currentIndex = 0; // Current selected index of the bottom navigation bar

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              title: Text(_getTitleByIndex(_controller.selectedIndex)),
              leading: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => _pages[_controller.selectedIndex]),
                  // );
                  // _pages[_controller.selectedIndex];
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: ExampleSidebarX(controller: _controller),
      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        index: selectedIndex,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.favorite, size: 30),
        ],
        onTap: (int index) {
          selectedIndex = index;
          setState(() {
            selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
        // onTap: (index) {
        //   Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => _bottomnavpages[index]),
        //           );
        //   // _pages[index];
        //   //Handle button tap
        // },
      ),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: _bottomnavpages[selectedIndex],
            // _ScreensExample(
            //   controller: _controller,
            // ),
          ),
        ],
      ),
      // Container(
      //     color: Colors.blueAccent,
      //     child: Center(
      //       child: Column(
      //         children: <Widget>[
      //           // Text('Home Page'),
      //           Text(_page.toString(), textScaleFactor: 10.0),
      //         ],
      //       ),
      //     ),
      //   ),
      // SidebarX(
      //   controller: SidebarXController(selectedIndex: 0, extended: true),
      //   items: const [
      //     SidebarXItem(icon: Icons.home, label: 'Home'),
      //     SidebarXItem(icon: Icons.search, label: 'Search'),
      //   ],
      // ),

      //   bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.blueAccent,
      //   items: const [
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.home_outlined),
      //       label: 'Home',
      //     ),
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.chat_bubble_outline),
      //       label: 'Chat',
      //     ),
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.newspaper),
      //       label: 'Feed',
      //     ),
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.perm_identity),
      //       label: 'Personal',
      //     ),
      //   ],
      //   onTap: (index) {
      //     // Handle button tap
      //   },
      // ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/applogo.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
            // const HomeScreen();
          },
        ),
        SidebarXItem(
          icon: Icons.book,
          label: 'Courses',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CourseScreen()),
            );
            // const CourseScreen();
          },
        ),
        SidebarXItem(
          icon: Icons.airplanemode_active,
          label: 'Products',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductScreen()),
            );
            // const ProductScreen();
          },
        ),
        SidebarXItem(
          icon: Icons.history,
          label: 'History',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()),
            );
            // const HistoryScreen();
          },
        ),
        SidebarXItem(
          icon: Icons.photo_library,
          label: 'Media',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MediaScreen()),
            );
            // const MediaScreen();
          },
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
            // const SettingsScreen();
          },
        ),
        SidebarXItem(
          icon: Icons.info_outline,
          label: 'About',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutScreen()),
            );
            // const AboutScreen();
          },
          // onTap: ,
        ),
        SidebarXItem(
          icon: Icons.perm_phone_msg_sharp,
          label: 'Contact Us',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactScreen()),
            );
            // const ContactScreen();
          },
        ),
        // const SidebarXItem(
        //   iconWidget: FlutterLogo(size: 20),
        //   label: 'Flutter',
        // ),
      ],
    );
  }
}

// class _ScreensExample extends StatelessWidget {
//   const _ScreensExample({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         final pageTitle = _getTitleByIndex(controller.selectedIndex);
//         switch (controller.selectedIndex) {
//           case 0:
//             return ListView.builder(
//               padding: const EdgeInsets.only(top: 10),
//               itemBuilder: (context, index) => Container(
//                 height: 100,
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Theme.of(context).canvasColor,
//                   boxShadow: const [BoxShadow()],
//                 ),
//               ),
//             );
//           default:
//             return Text(
//               pageTitle,
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//       },
//     );
//   }
// }

_getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Courses';
    case 2:
      return 'Products';
    case 3:
      return 'History';
    case 4:
      return 'Media';
    case 5:
      return 'Settings';
    case 6:
      return 'About';
    case 7:
      return 'Contact Us';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
