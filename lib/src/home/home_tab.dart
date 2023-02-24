import 'package:app_greengrosser/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              //Text
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: customColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: customColors.contratstColors,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: customColors.contratstColors,
                textColor: Colors.white,
                label: const Text(
                  '2',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: customColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: customColors.contratstColors,
                ),
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
