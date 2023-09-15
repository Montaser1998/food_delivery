import 'package:flutter/material.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/models/product.dart';

late Product _productItem;
late Function(Product, bool) _onUpdateFavorite;

class ProductDetailsPage extends StatefulWidget {
  final Product productItem;
  final Function(Product, bool) onUpdateFavorite;

  ProductDetailsPage(
      {super.key, required this.productItem, required this.onUpdateFavorite}) {
    _productItem = productItem;
    _onUpdateFavorite = onUpdateFavorite;
  }
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  bool isFavorite = _productItem.isFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_productItem.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                // Toggle the favorite status
                isFavorite = !_productItem.isFavorite;

                // Update the favorite status through the callback
                _onUpdateFavorite(_productItem, isFavorite);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Image.network(
                  _productItem.imageURL,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _productItem.name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            categories
                                .firstWhere(
                                    (item) => item.id == _productItem.category)
                                .name,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: decreaseQuantity,
                          ),
                          Text(
                            "$quantity",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: increaseQuantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Size",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Text(
                              _productItem.size,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.grey, //color of divider
                          width: 20, //height spacing of divider
                          thickness: 1, //thickness of divier line
                          indent: 8, //spacing at the start of divider
                          endIndent: 8, //spacing at the end of divider
                        ),
                        Column(
                          children: [
                            const Text(
                              "Calories",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Text(
                              _productItem.calories,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.grey, //color of divider
                          width: 20, //height spacing of divider
                          thickness: 1, //thickness of divier line
                          indent: 8, //spacing at the start of divider
                          endIndent: 8, //spacing at the end of divider
                        ),
                        Column(
                          children: [
                            const Text(
                              "Cooking",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Text(
                              _productItem.estimatedTime,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(_productItem.description),
                  const SizedBox(height: 16),
                  // Moved the price and Add to Cart to the bottom navigation
                ],
              ),
            ),
            // Add more features like ratings, reviews, similar products, etc. here
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                "\$${_productItem.price}",
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 200.0, // Set the desired width here
              height: 100.0, // Set the desired width here
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {
                    // Add to cart logic here
                  },
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
