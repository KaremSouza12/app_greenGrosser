import 'package:app_greengrosser/src/config/custom_colors.dart';
import 'package:app_greengrosser/src/models/cart_item_models.dart';
import 'package:app_greengrosser/src/pages/common_widgets/quantity_widget.dart';
import 'package:app_greengrosser/src/services/utils_service.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  CartTile({super.key, required this.caartItem});

  final CartItemModel caartItem;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        //Imagem
        leading: Image.asset(
          caartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        //Nome
        title: Text(
          caartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        //Total
        subtitle: Text(
          utilsServices.priceToCurrency(caartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Quantidade
        trailing: SizedBox(
          width: 100,
          child: QuantityWidget(
            suffixText: caartItem.item.unit,
            value: caartItem.quantity,
            result: (q) {},
          ),
        ),
      ),
    );
  }
}
