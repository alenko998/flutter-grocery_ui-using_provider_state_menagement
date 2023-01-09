// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_cart_ui/models/shopping_cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 36,
                        ),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text('\$' + value.cartItems[index][1]),
                        trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemFromCart(index),
                        ),
                      ),
                    ),
                  );
                },
              )),
              // pay now and price
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(color: Colors.green[100]),
                            ),
                            Text(
                              '\$' + value.calculate(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green.shade100),
                          child: Row(
                            children: [
                              Text("Pay Now"),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
