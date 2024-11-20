import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/createscreen.dart';
import 'package:food_recipe_app/pages/notificationscreen.dart';
import 'package:food_recipe_app/pages/profilescreen.dart';
import 'package:food_recipe_app/pages/savescreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedCategoryIndex = 0; // To store the selected category index

  @override
  Widget build(BuildContext context) {
    // Getting the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Find best recipes for cooking',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildTrendingSection(),
              const SizedBox(height: 20),
              _buildPopularCategorySection(screenWidth),
              const SizedBox(height: 20),
              _buildRecentRecipesSection(screenWidth),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
    switch (index) {
      case 0:
        // Handle home navigation (already on home screen)
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

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        hintText: 'Search recipes',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Trending now 🔥',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See all →'),
            ),
          ],
        ),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildTrendingRecipeCard('How to make sushi at home',
                  'Niki Samantha', '4.5', 'assets/sushi.jpg'),
              _buildTrendingRecipeCard('How to make chinese at home',
                  'Himanshu Kumar', '4.7', 'assets/chinese.jpg'),
              _buildTrendingRecipeCard('How to make pizza at home',
                  'Himasnhu Kumar', '4.7', 'assets/pizza.jpg'),
              _buildTrendingRecipeCard('How to make burger at home',
                  'Himanshu Kumar', '4.7', 'assets/maincorse.jpg'),
              _buildTrendingRecipeCard('How to soup at home', 'Himanshu Kumar',
                  '4.7', 'assets/soup.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingRecipeCard(
      String title, String author, String rating, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[300]!)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(imagePath,
                      height: 120, width: 160, fit: BoxFit.cover),
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
                        Text(rating, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('By $author', style: const TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularCategorySection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular category',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategoryChip('Salad', 0),
              _buildCategoryChip('Breakfast', 1),
              _buildCategoryChip('Appetizer', 2),
              _buildCategoryChip('Noodle', 3),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          children: [
            _buildPopularRecipeCard('Pepper sweetcorn ramen', '10 Mins'),
            _buildPopularRecipeCard('Cheddar cheese salad', '20 Mins'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(label),
        selected: _selectedCategoryIndex == index,
        onSelected: (bool selected) {
          setState(() {
            _selectedCategoryIndex = selected ? index : _selectedCategoryIndex;
          });
        },
        backgroundColor: Colors.grey[200],
        selectedColor: Colors.redAccent,
        labelStyle: TextStyle(
            color:
                _selectedCategoryIndex == index ? Colors.white : Colors.black),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
    );
  }

  Widget _buildPopularRecipeCard(String title, String time) {
    return Container(
      width: 160, // Set a fixed width to avoid overflow
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[300]!)],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset('assets/indian.jpg',
                height: 100, width: 160, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Time: $time', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentRecipesSection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent recipe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See all →'),
            ),
          ],
        ),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildRecentRecipeCard('Indonesian chicken burger',
                  'Himanshu Kumar', 'assets/burger.jpg'),
              _buildRecentRecipeCard(
                  'Homemade samosa', 'Himanshu Kumar', 'assets/samosa.jpg'),
              _buildRecentRecipeCard(
                  'Homemade pizza', 'Himanshu Kumar', 'assets/pizza.jpg'),
              _buildRecentRecipeCard(
                  'Homemade pancake', 'Himanshu Kumar', 'assets/pancake.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentRecipeCard(String title, String author, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[300]!)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(imagePath,
                  height: 100, width: 140, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('By $author', style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
