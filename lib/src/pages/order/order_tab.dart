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
        itemBuilder: itemBuilder,
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: itemCount,
      ),
    );
  }
}
