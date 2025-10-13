import 'package:court/favorite.dart';
import 'package:court/pembelian.dart';
import 'package:court/favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> _data = [
    {
      'name': 'Futsal Court A',
      'image': 'assets/images/futsal.png',
      'type': 'Indoor',
      'facility': 'Air Conditioned',
      'rating': 4.8,
      'price': 50000,
    },
    {
      'name': 'Basketball Court B',
      'image': 'assets/images/basket.png',
      'type': 'Outdoor',
      'facility': 'Premium Floor',
      'rating': 4.7,
      'price': 75000,
    },
    {
      'name': 'Badminton Court C',
      'image': 'assets/images/badmin.png',
      'type': 'Indoor',
      'facility': 'Wooden Floor',
      'rating': 4.9,
      'price': 45000,
    },
    {
      'name': 'Tennis Court D',
      'image': 'assets/images/tennis.png',
      'type': 'Outdoor',
      'facility': 'Hard Surface',
      'rating': 4.6,
      'price': 80000,
    },
    {
      'name': 'Volley Court E',
      'image': 'assets/images/volley.png',
      'type': 'Indoor',
      'facility': 'Synthetic Floor',
      'rating': 4.5,
      'price': 60000,
    },
  ];

  late List<bool> isLoved;

  @override
  void initState() {
    super.initState();
    isLoved = List.generate(_data.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.heart, color: Colors.transparent),
            ),
            Text(
              "Sports Courts",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorite()),
                );
              },
              icon: Icon(CupertinoIcons.heart_solid, color: Colors.red),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final court = _data[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            shadowColor: Colors.black26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    court['image'],
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama + rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              court['name'],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                court['rating'].toString(),
                                style: GoogleFonts.poppins(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${court['type']} • ${court['facility']}",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp ${court['price']}/hour",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLoved[index] = !isLoved[index];
                                  });
                                },
                                child: Container(
                                  child: Icon(
                                    isLoved[index]
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color: isLoved[index]
                                        ? Colors.red
                                        : Colors.black,
                                    size: 22,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pembelian(
                                          courtName: court['name'],
                                          type: court['type'],
                                          price: court['price'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Select",
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
