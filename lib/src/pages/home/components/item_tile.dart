import 'package:app_greengrosser/src/config/custom_colors.dart';
import 'package:app_greengrosser/src/models/item_models.dart';
import 'package:app_greengrosser/src/services/utils_service.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  ItemTile({super.key, required this.item});

  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Image
            Expanded(
              child: Image.asset(item.imgUrl),
            ),
            Text(
              item.itemName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Price
            Row(
              children: [
                Text(
                  utilsServices.priceToCurrency(item.price),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
                Text(
                  '/${item.unit}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
