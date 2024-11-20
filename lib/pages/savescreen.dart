import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/createscreen.dart';
import 'package:food_recipe_app/pages/homescreen.dart';
import 'package:food_recipe_app/pages/notificationscreen.dart';
import 'package:food_recipe_app/pages/profilescreen.dart';


class Savescreen extends StatefulWidget {
  const Savescreen({super.key});

  @override
  State<Savescreen> createState() => _SavescreenState();
}

class _SavescreenState extends State<Savescreen> {
  bool isVideoSelected = true;
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Saved recipes',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildToggleButton(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildRecipeCard(
                  title: 'How to make french toast',
                  author: 'Himanshu Kumar',
                  rating: '5.0',
                  imagePath: 'assets/frenchtoast.jpg',
                  time: '15:10',
                ),
                _buildRecipeCard(
                  title: 'How to make sushi at home',
                  author: 'Himanshu Kumar',
                  rating: '4.5',
                  imagePath: 'assets/sushi.jpg',
                  time: '15:10',
                ),
                _buildRecipeCard(
                  title: 'Easy oatmeal recipe',
                  author: 'Himanshu Kumar',
                  rating: '4.9',
                  imagePath: 'assets/oatmeal.jpg',
                  time: '15:10',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
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

        break;
      case 2:
        // Navigate to Add Video screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Createscreen()),
        );
        break;
      case 3:
        // Navigate to Notification page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Notificationscreen()),
        );
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

  Widget _buildToggleButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isVideoSelected = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isVideoSelected ? Colors.red : Colors.grey[200],
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                'Video',
                style: TextStyle(
                  color: isVideoSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                isVideoSelected = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: !isVideoSelected ? Colors.red : Colors.grey[200],
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                'Recipe',
                style: TextStyle(
                  color: !isVideoSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard({
    required String title,
    required String author,
    required String rating,
    required String imagePath,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(imagePath,
                      fit: BoxFit.cover, height: 200, width: double.infinity),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.bookmark_border, color: Colors.red),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      time,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                overflow: TextOverflow.ellipsis, // Handle overflow
                maxLines: 1, // Limit to one line
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                'By $author',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
