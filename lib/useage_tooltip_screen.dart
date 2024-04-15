import 'package:flutter/material.dart';
import 'package:tool_tips_ex/tool_tip/custom_tooltip.dart';
import 'package:tool_tips_ex/tool_tip/tooltib_model.dart';
import 'package:tool_tips_ex/tool_tip/tooltip_manager.dart';
import 'package:tool_tips_ex/tool_tip/tooltip_progress.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    ProfileScreen(),
    SettingsScreen(),
    NotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            key:  ToolTipKeysManager.searchTipKey,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            key:  ToolTipKeysManager.profileTipKey,

            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            key:  ToolTipKeysManager.settingTipKey,

            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CustomTooltipManager(
          tooltips: [
            TooltipData(
              "here, you can search for any thing",
              ToolTipKeysManager.searchTipKey,
              Offset(12, 95),
              "save1",
            ),
            TooltipData(
              'here, you can show app settings',
              ToolTipKeysManager.profileTipKey,
              Offset(10, 500),
              "save2",
            ),
            TooltipData(
              'here, you can show your profile',
              ToolTipKeysManager.settingTipKey,
              Offset(65, 580),
              "save3",
            ),
          ],
          tooltipBuilder:
              (context, message, showNext, currentIndex, total, closeToolTip) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    if (currentIndex == 0 || currentIndex == 1)
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: currentIndex == 0
                                  ? 170
                                  : currentIndex == 1
                                      ? 0
                                      : 0,
                              left: currentIndex == 0
                                  ? 0
                                  : currentIndex == 1
                                      ? 0
                                      : 170,
                            ),
                          ),
                          Padding(
                            key: ToolTipKeysManager.searchTipKey,
                            padding: EdgeInsets.only(
                              right: currentIndex == 0
                                  ? 170
                                  : currentIndex == 1
                                      ? 0
                                      : 0,
                              left: currentIndex == 0
                                  ? 0
                                  : currentIndex == 1
                                      ? 0
                                      : 170,
                            ),
                            child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                width: 21.3,
                                // Adjust the width as needed
                                height: 10.6,
                                // Adjust the height as needed
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    GestureDetector(
                      onTap: showNext,
                      child: Container(
                        width: 235,
                        height: 170,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme:
                                ColorScheme.light(primary: Colors.white),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: closeToolTip,
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.blue,
                                          size: 21,
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 16, left: 22.6, bottom: 10),
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20, left: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 7,
                                        child: ToolTipProgressListView(
                                          select: currentIndex,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        width: 80,
                                        height: 29.3,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                            begin: Alignment(0.5, 0),
                                            end: Alignment(0.5, 1),
                                            colors: [
                                              Colors.blue,
                                              Colors.blue,
                                            ],
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: showNext,
                                          child: Center(
                                            child: Text(
                                              "Next",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Color.fromRGBO(207, 0, 54, 0.1),
                              blurRadius: 16,
                              spreadRadius: 0.0,
                              offset: Offset(0.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (currentIndex == 6 ||
                        currentIndex == 2 ||
                        currentIndex == 3 ||
                        currentIndex == 4 ||
                        currentIndex == 5)
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: currentIndex == 2
                                    ? 0
                                    : currentIndex == 1
                                        ? 80
                                        : currentIndex == 5
                                            ? 0
                                            : currentIndex == 6
                                                ? 0
                                                : 160,
                                right: currentIndex == 4
                                    ? 110
                                    : currentIndex == 1
                                        ? 0
                                        : currentIndex == 5
                                            ? 90
                                            : currentIndex == 6
                                                ? 115
                                                : 0),
                            child: RotationTransition(
                              turns: new AlwaysStoppedAnimation(180 / 360),
                              child: ClipPath(
                                clipper: TriangleClipper(),
                                child: Container(
                                  width: 16,
                                  // Adjust the width as needed
                                  height: 8,
                                  // Adjust the height as needed
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 14.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            padding: EdgeInsets.all(16.0),
            children: [
              HomeCard(
                icon: Icons.home,
                label: 'Home',
                color: Colors.blue,
              ),
              HomeCard(
                icon: Icons.person,
                label: 'Profile',
                color: Colors.green,
              ),
              HomeCard(
                icon: Icons.settings,
                label: 'Settings',
                color: Colors.orange,
              ),
              HomeCard(
                icon: Icons.notifications,
                label: 'Notifications',
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const HomeCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: color,
      child: InkWell(

        onTap: () {
          // Handle tap
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: Colors.white,
              ),
              SizedBox(height: 5.0),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
