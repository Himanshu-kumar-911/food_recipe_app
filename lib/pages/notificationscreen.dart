import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/createscreen.dart';
import 'package:food_recipe_app/pages/homescreen.dart';
import 'package:food_recipe_app/pages/profilescreen.dart';
import 'package:food_recipe_app/pages/savescreen.dart';


class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 3; // Default to Notification tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize screenSize for responsiveness
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {
              // Settings action
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Back action
          },
        ),
      ),
      body: Column(
        children: [
          // Tab bar for All, Unread, Read
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.red,
              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Unread'),
                Tab(text: 'Read'),
              ],
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),

          // TabBarView to show different content for each tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // All notifications
                _buildNotificationList(screenSize, allNotifications),
                // Unread notifications
                _buildNotificationList(screenSize, unreadNotifications),
                // Read notifications
                _buildNotificationList(screenSize, readNotifications),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Reflect the selected index
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onNavigationItemSelected, // New callback function
      ),
    );
  }

  void _onNavigationItemSelected(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
        );
        break;
      case 1:
        // Navigate to Bookmark page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Savescreen()),
        );
        break;
      case 2:
        // Navigate to Add Video screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Createscreen()),
        );
        break;
      case 3:
        // Stay on Notification page
        break;
      case 4:
        // Navigate to Profile page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profilescreen()),
        );
        break;
    }
  }

  // All notifications
  List<Map<String, dynamic>> allNotifications = [
    {
      "title": "New recipe!",
      "description": "Far far away, behind the word mountains.",
      "isUnread": true,
      "date": "Today"
    },
    {
      "title": "Don’t forget to try your saved recipe",
      "description": "Far far away, behind the word mountains.",
      "isUnread": true,
      "date": "Today"
    },
    {
      "title": "Don’t forget to try your saved recipe",
      "description": "Far far away, behind the word mountains.",
      "isUnread": false,
      "date": "Yesterday"
    },
  ];

  // Unread notifications
  List<Map<String, dynamic>> unreadNotifications = [
    {
      "title": "New recipe!",
      "description": "Far far away, behind the word mountains.",
      "isUnread": true,
      "date": "Today"
    },
    {
      "title": "Don’t forget to try your saved recipe",
      "description": "Far far away, behind the word mountains.",
      "isUnread": true,
      "date": "Today"
    },
  ];

  // Read notifications
  List<Map<String, dynamic>> readNotifications = [
    {
      "title": "Don’t forget to try your saved recipe",
      "description": "Far far away, behind the word mountains.",
      "isUnread": false,
      "date": "Yesterday"
    },
  ];

  // Method to build notification list for each tab
  Widget _buildNotificationList(
      Size screenSize, List<Map<String, dynamic>> notifications) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
      ),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        var notification = notifications[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0 ||
                notifications[index - 1]['date'] != notification['date'])
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.02),
                child: Text(
                  notification['date'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            SizedBox(height: screenSize.height * 0.02),
            _buildNotificationCard(
              title: notification['title'],
              description: notification['description'],
              isUnread: notification['isUnread'],
              screenSize: screenSize,
            ),
            SizedBox(height: screenSize.height * 0.02),
          ],
        );
      },
    );
  }

  // Method to build each notification card
  Widget _buildNotificationCard({
    required String title,
    required String description,
    required bool isUnread,
    required Size screenSize,
  }) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Icon(
              Icons.receipt_long,
              color: Colors.green,
              size: screenSize.width * 0.08,
            ),
            SizedBox(width: screenSize.width * 0.03),

            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Unread notification dot
            if (isUnread) const Icon(Icons.circle, color: Colors.red, size: 12),
          ],
        ),
      ),
    );
  }
}
