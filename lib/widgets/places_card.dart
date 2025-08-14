import 'package:flutter/material.dart';
import 'package:vaca_app/pages/details_page.dart';
import 'package:vaca_app/global_variables.dart';

class PlacesCard extends StatefulWidget {
  const PlacesCard({super.key});

  @override
  State<PlacesCard> createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: travelPlaces.length,
        itemBuilder: (context, index) {
          final place = travelPlaces[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(travelPlace: place),
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 250, 249, 249),
                elevation: 25,
                shadowColor: Colors.black.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          cacheWidth: 500,
                          cacheHeight: 250,
                          place['cardImage'],
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        place['name'],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rating: ${place['rating']}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Cost:\$ ${place['cost']} per person',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'City: ${place['city']}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            'Country: ${place['country']}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
