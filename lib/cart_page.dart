import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaca_app/cartprovider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookings')),
      body: Consumer<Cartprovider>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.travelPlaces.length,
            itemBuilder: (context, index) {
              final travelPlace = cart.travelPlaces[index];
              return ListTile(
                title: Text('${travelPlace['name']}'),
                leading: Icon(Icons.airplane_ticket),
                subtitle: Text('\$${travelPlace['cost']}'),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('Do you want to delete this booking?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              cart.removeTravelPlace(travelPlace);
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
