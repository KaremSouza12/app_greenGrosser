import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:app_greengrosser/src/config/custom_colors.dart';
import 'package:app_greengrosser/src/pages/home/components/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:app_greengrosser/src/config/app_data.dart' as app_data;

import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  void itemSelectedCartAnimations(GlobalKey gkImage) async {
    runAddToCartAnimation(gkImage);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }

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
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: CustomColors.contratstColors,
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
              child: AddToCartIcon(
                badgeOptions: const BadgeOptions(
                  backgroundColor: Colors.red,
                ),
                key: cartKey,
                icon: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: AddToCartAnimation(
        cartKey: cartKey,
        createAddToCartAnimation: (addToCartAnimationMethod) {
          runAddToCartAnimation = addToCartAnimationMethod;
        },
        child: Column(
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
                    color: CustomColors.contratstColors,
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
            ),
            //Categorias
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      onPressed: () {
                        setState(() {
                          selectedCategory = app_data.categoties[index];
                        });
                      },
                      category: app_data.categoties[index],
                      isSelected:
                          app_data.categoties[index] == selectedCategory,
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 10),
                  itemCount: app_data.categoties.length,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: app_data.items[index],
                    cartAnimetionMethod: itemSelectedCartAnimations,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
