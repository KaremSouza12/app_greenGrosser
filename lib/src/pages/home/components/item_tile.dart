import 'package:app_greengrosser/src/app_router.dart';
import 'package:app_greengrosser/src/config/custom_colors.dart';
import 'package:app_greengrosser/src/models/item_models.dart';
import 'package:app_greengrosser/src/services/utils_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemTile extends StatefulWidget {
  ItemTile({super.key, required this.item, required this.cartAnimetionMethod});

  final ItemModel item;
  final void Function(GlobalKey) cartAnimetionMethod;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGK = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData iconTile = Icons.shopping_cart_checkout_outlined;

  Future<void> switchIcon() async {
    setState(() => iconTile = Icons.check);
    await Future.delayed(const Duration(seconds: 1500));
    setState(() => iconTile = Icons.shopping_cart_checkout_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => context.push(productScreenRoute, extra: widget.item),
          child: Card(
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
                  //Imagem
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Container(
                        key: imageGK,
                        child: Image.asset(
                          widget.item.imgUrl,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Price
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${widget.item.unit}',
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
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  widget.cartAnimetionMethod(imageGK);
                  switchIcon();
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    iconTile,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
