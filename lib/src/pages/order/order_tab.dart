import 'package:app_greengrosser/src/pages/order/components/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:app_greengrosser/src/config/app_data.dart' as app_data;

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (_, index) {
          return OrderTile(
            order: app_data.orders[index],
          );
        },
        itemCount: app_data.orders.length,
      ),
    );
  }
}
