
import 'package:flutter/material.dart';
import 'package:softapper_tasks/views/dashboard/dashboard_screen.dart';
import 'package:softapper_tasks/views/dashboard/setting_screen.dart';

import '../../models/hotel_model.dart';
import '../../models/user_model.dart';
import '../components/hotel_card.dart';
import '../drawer/profile_screen.dart';

class HotelScreen extends StatefulWidget {
  final User user;
  const HotelScreen({super.key, required this.user});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  List<Hotel> hotels = [

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
  ];
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
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  DashboardScreen(user: widget.user)));

              },
            ),
            ListTile(
              splashColor: Colors.orange.shade100,
              leading: const Icon(Icons.hotel),
              title: const Text('Hotels'),
              onTap: () {
                Navigator.pop(context);
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


        ],
      ),
    );
  }
}
