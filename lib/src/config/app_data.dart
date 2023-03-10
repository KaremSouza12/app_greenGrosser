import 'package:app_greengrosser/src/models/item_models.dart';

import 'package:app_greengrosser/src/models/cart_item_models.dart';
import 'package:app_greengrosser/src/models/order_model.dart';
import 'package:app_greengrosser/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

final List<String> categoties = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Tempero',
  'Sereais'
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 2,
  ),
  CartItemModel(
    item: mango,
    quantity: 1,
  ),
  CartItemModel(
    item: guava,
    quantity: 2,
  )
];

UserModel user = UserModel(
  email: 'krmcristine@gmail.com',
  name: 'Karem de Souza',
  phone: '99 9 90900099',
  cpf: '02039712216',
  password: '2100923',
);

List<OrderModel> orders = [
  OrderModel(
    id: '21de2342',
    createdDateTime: DateTime.parse('2023-03-04 20:16:39'),
    overDueDateTime: DateTime.parse('2023-03-04 22:16:39'),
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: guava, quantity: 3),
    ],
    status: 'panding_payment',
    copyAndPaste: '2ee484h64245b34',
    total: 11,
  ),
  OrderModel(
    id: '21de2342',
    createdDateTime: DateTime.parse('2023-03-04 20:16:39'),
    overDueDateTime: DateTime.parse('2023-03-04 23:16:39'),
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: guava, quantity: 3),
    ],
    status: 'delivered',
    copyAndPaste: '2ee484h64245b34',
    total: 11,
  ),
];
