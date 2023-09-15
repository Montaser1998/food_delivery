import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/pages/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB

  int? selectedCategoryIndex;

  late List<Product> filteredProduct;

  @override
  void initState() {
    super.initState();
    filteredProduct = products;
  }

  void updateFavoriteStatus(Product product, bool newStatus) {
    setState(() {
      // product.isFavorite = newStatus;
      final selectedProductIndex = products.indexOf(product);
      final selectedFilteredProductIndex = filteredProduct.indexOf(product);
      filteredProduct[selectedFilteredProductIndex] =
          products[selectedProductIndex] =
              product.copyWith(isFavorite: newStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => {},
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.menu),
                            )),
                      ),
                      const Column(
                        children: [
                          Text(
                            "Current Location",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Jericho, Palestine",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => {},
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.notifications),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(251, 192, 45, 1),
                            blurRadius: 90,
                            offset: Offset(0, 50),
                            spreadRadius: -60),
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 60,
                            offset: Offset(0, 30),
                            spreadRadius: -30),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        'https://t4.ftcdn.net/jpg/02/94/30/59/360_F_294305984_6Oloa4kkSKjpHXegEWFqryY1PrhRRMeN.jpg',
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    focusNode: FocusNode(canRequestFocus: false),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      hintText: "Find your food...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  SizedBox(
                    height: 110.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedCategoryIndex == null ||
                                        selectedCategoryIndex != index) {
                                      selectedCategoryIndex = index;
                                    } else {
                                      selectedCategoryIndex = null;
                                      filteredProduct = products;
                                    }
                                  });

                                  if (selectedCategoryIndex != null) {
                                    final selectedCategory =
                                        categories[selectedCategoryIndex!];
                                    filteredProduct = products
                                        .where((element) =>
                                            element.category ==
                                            selectedCategory.id)
                                        .toList();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == selectedCategoryIndex
                                        ? Colors.deepOrange
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(children: [
                                      Image.network(
                                        categories[index].imageURL,
                                        height: 50,
                                        width: 50,
                                        color: index == selectedCategoryIndex
                                            ? Colors.white
                                            : null,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        categories[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                index == selectedCategoryIndex
                                                    ? Colors.white
                                                    : Colors.black54),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            )),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two elements in each row
                      crossAxisSpacing: 15.0, // Spacing between columns
                      mainAxisSpacing: 15.0, // Spacing between rows
                      childAspectRatio: 0.80,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredProduct.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(Platform.isIOS
                            ? CupertinoPageRoute(
                                builder: (context) => ProductDetailsPage(
                                      productItem: filteredProduct[index],
                                      onUpdateFavorite: updateFavoriteStatus,
                                    ))
                            : MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                      productItem: filteredProduct[index],
                                      onUpdateFavorite: updateFavoriteStatus,
                                    )));
                      },
                      child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Column(children: [
                              Image.network(
                                filteredProduct[index].imageURL,
                                height: 100,
                                width: 100,
                              ),
                              Flexible(
                                child: Text(
                                  filteredProduct[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  categories
                                      .firstWhere((item) =>
                                          item.id ==
                                          filteredProduct[index].category)
                                      .name,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                '\$ ${filteredProduct[index].price}',
                                style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ]),
                            PositionedDirectional(
                              top: 0,
                              end: 0,
                              child: IconButton(
                                icon: Icon(
                                  filteredProduct[index].isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline_outlined,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    final selectedProductIndex = products
                                        .indexOf(filteredProduct[index]);
                                    filteredProduct[index] =
                                        products[selectedProductIndex] =
                                            filteredProduct[index].copyWith(
                                                isFavorite:
                                                    !filteredProduct[index]
                                                        .isFavorite);
                                  });
                                },
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
