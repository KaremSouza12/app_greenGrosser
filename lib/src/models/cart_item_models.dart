import 'package:app_greengrosser/src/models/item_models.dart';

class CartItemModel {
  final ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;
}
