import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/pages/product_details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Product> favoriteProducts =
      products.where((element) => element.isFavorite).toList();

  void updateFavoriteStatus(Product product, bool newStatus) {
    setState(() {
      final selectedProductIndex = products.indexOf(product);
      final selectedFavoriteProductIndex = favoriteProducts.indexOf(product);
      favoriteProducts[selectedFavoriteProductIndex] =
          products[selectedProductIndex] =
              product.copyWith(isFavorite: newStatus);
      favoriteProducts.removeAt(selectedFavoriteProductIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return favoriteProducts.isEmpty
        ? const Center(
            child: Text('No favorites yet'),
          )
        : ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(Platform.isIOS
                      ? CupertinoPageRoute(
                          builder: (context) => ProductDetailsPage(
                                productItem: favoriteProducts[index],
                                onUpdateFavorite: updateFavoriteStatus,
                              ))
                      : MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                                productItem: favoriteProducts[index],
                                onUpdateFavorite: updateFavoriteStatus,
                              )));
                },
                child: Card(
                  child: ListTile(
                    title: Text(favoriteProducts[index].name),
                    subtitle: Text(
                        '${categories.firstWhere((item) => item.id == favoriteProducts[index].category).name}, \$${products[index].price}'),
                    leading: Image.network(
                      favoriteProducts[index].imageURL,
                      height: 100,
                      width: 70,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          final selectedProductIndex =
                              products.indexOf(favoriteProducts[index]);
                          products[selectedProductIndex] =
                              favoriteProducts[index].copyWith(
                                  isFavorite:
                                      !favoriteProducts[index].isFavorite);
                          favoriteProducts.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              );
            });
  }
}
