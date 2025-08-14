import 'package:flutter/material.dart';
import 'package:vaca_app/cart_page.dart';
import 'package:vaca_app/global_variables.dart';
import 'package:vaca_app/places_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> filter = ['All', 'Mountain', 'Forest', 'Desert'];
  String selectedfilter = '';
  @override
  void initState() {
    super.initState();
    selectedfilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withValues(alpha: 0.9),
                    BlendMode.lighten,
                  ),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 239, 235, 235),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.messenger),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 239, 235, 235),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.airplanemode_active),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 65),
                    Text(
                      'Best Places',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(fontSize: 35),
                    ),
                    Text(
                      'For Travel',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(fontSize: 32),
                    ),
                    Text(
                      'Find The Best Places To Visit🔥',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            buildFilter(),
            SizedBox(height: 10),
            PlacesCard(),
          ],
        ),
      ),
    );
  }

  Widget buildFilter() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filter.length,
        itemBuilder: (context, index) {
          final filterf = filter[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedfilter = filterf;
                });
              },
              child: Chip(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                label: Text(
                  filter[index],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: selectedfilter == filterf
                        ? Colors.white
                        : Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: selectedfilter == filterf
                    ? Colors.blue[200]
                    : Colors.grey[200],
              ),
            ),
          );
        },
      ),
    );
  }
}
