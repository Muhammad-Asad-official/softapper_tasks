import 'package:flutter/material.dart';
import 'package:softapper_tasks/models/user_model.dart';
import 'package:softapper_tasks/views/dashboard/hotel_screen.dart';
import 'package:softapper_tasks/views/dashboard/setting_screen.dart';
import 'package:softapper_tasks/views/drawer/profile_screen.dart';

import '../../models/hotel_model.dart';
import '../components/hotel_card.dart';

class DashboardScreen extends StatefulWidget {
  final User user;
  const DashboardScreen({super.key,required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Hotel> hotels = [
    Hotel(
      name: 'Grand Hotel',
      image: 'https://th.bing.com/th/id/OIP.yrJhmX5_BJZCPIFs7zsgLAHaEo?rs=1&pid=ImgDetMain',
      rating: 4.5,
    ),
    Hotel(
      name: 'Luxury Resort',
      image: 'https://th.bing.com/th/id/OIP.-wcXcPg9mUaWmMJuoWXgHgHaE8?rs=1&pid=ImgDetMain',
      rating: 4.8,
    ),
    Hotel(
      name: 'Cozy Inn',
      image: 'https://q-xx.bstatic.com/xdata/images/hotel/max1200/13800549.jpg?k=ff50353d2dd34d4addadf1d09d633282e0a42eac9b6bb4a4930354832bc4d847&o=',
      rating: 4.2,
    ),
    Hotel(
      name: 'Beachfront Paradise',
      image: 'https://th.bing.com/th/id/OIP.Zis2cXdglxbZemS3QNsdZQHaE8?rs=1&pid=ImgDetMain',
      rating: 4.7,
    ),
  ];
   final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      appBar: AppBar(
        surfaceTintColor: Colors.orangeAccent.shade100,
        backgroundColor: Colors.orangeAccent.shade100,
        title: const Text("Hotel Booking"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome ${widget.user.name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text(
                    "We have Every thing for you",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              splashColor: Colors.orange.shade100,
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              splashColor: Colors.orange.shade100,
              leading: const Icon(Icons.hotel),
              title: const Text('Hotels'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   HotelScreen(user: widget.user)));
              },
            ),
            ListTile(
              splashColor: Colors.orange.shade100,
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: widget.user),));
              },
            ),
            const Divider(),
            ListTile(
              splashColor: Colors.orange.shade100,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.shade100,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome ${widget.user.name}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
                        "We have Every thing for you",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                )
              ),
              const SizedBox(height: 30,),
              Expanded(
                child: ListView.builder(
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return HotelCard(hotel: hotels[index]);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 70,
            left: 50,
            child: SizedBox(
              height: 60,
              width: 300,
              child: TextFormField(
                controller: _searchController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
