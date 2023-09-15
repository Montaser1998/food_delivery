class Product {
  final int id;
  final String name;
  final int category;
  final String imageURL;
  final double price;
  final String estimatedTime;
  final String description;
  final String size;
  final String calories;
  final int numberOfSales;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageURL,
    required this.price,
    this.estimatedTime = '30 Mins',
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut fringilla lacus. Quisque magna quam, elementum sed odio quis, faucibus mattis augue. Curabitur vestibulum eros a ornare faucibus. Donec sollicitudin dapibus leo, ut elementum erat consequat et. Nullam placerat metus tellus, eget consectetur magna pretium vitae. Pellentesque at tristique dui, vel rhoncus urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin maximus neque eu mollis pharetra. Donec faucibus nisl vel diam fermentum, sit amet lobortis magna rhoncus.',
    this.size = 'Medium',
    this.calories = '150 Kcal',
    this.numberOfSales = 2,
    this.isFavorite = false,
  });

  Product copyWith({bool? isFavorite}) {
    return Product(
      id: id,
      name: name,
      category: category,
      imageURL: imageURL,
      price: price,
      estimatedTime: estimatedTime,
      numberOfSales: numberOfSales,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

final List<Product> products = [
  Product(
      id: 0,
      name: 'Beef Burger',
      category: 1,
      price: 8.99,
      imageURL:
          'https://static.wixstatic.com/media/7971e4_db4e0b3c51ca4275a766075acdcfc5b7~mv2.png/v1/fill/w_372,h_322,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Original%20Chicken%20.png'),
  Product(
      id: 1,
      name: 'Beef Burger',
      category: 1,
      price: 5.99,
      imageURL:
          'https://purepng.com/public/uploads/large/purepng.com-fast-food-burgerburgerfast-foodhammeatfast-food-burgermc-donaldsburger-king-2315193402011tqil.png'),
  Product(
      id: 2,
      name: 'Beef Burger',
      category: 1,
      price: 10.99,
      imageURL:
          'https://pngfile.net/public/uploads/preview/chicken-berger-png-free-free-download-21566138887tbrwlnnfpp.png'),
  Product(
      id: 3,
      name: 'Beef Burger',
      category: 1,
      price: 3.99,
      imageURL:
          'https://www.transparentpng.com/thumb/burger/hot-burger-king-hd-png-9dzyCE.png'),
  Product(
      id: 4,
      name: 'Beef Burger',
      category: 1,
      price: 12.99,
      imageURL:
          'https://i.pinimg.com/originals/0b/48/58/0b48589f05314a60902254b9af080944.png'),
  Product(
      id: 5,
      name: 'Margreta Pizza',
      category: 2,
      imageURL:
          'https://peaceloveandpizza.com/wp-content/uploads/2019/04/Margherita-Nuff-Said-min.png',
      price: 23.99),
  Product(
      id: 6,
      name: 'Pizza',
      category: 2,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/024/589/239/original/pizza-side-view-with-ai-generated-free-png.png',
      price: 19.99),
  Product(
      id: 7,
      name: 'Pizza',
      category: 2,
      imageURL: 'https://www.pngall.com/wp-content/uploads/4/Dominos-Pizza.png',
      price: 23.99),
  Product(
      id: 8,
      name: 'MacNCheese',
      category: 3,
      imageURL:
          'https://www.pngkit.com/png/full/59-598247_mac-and-cheese-png-mac-and-cheese-transparent.png',
      price: 38.99),
  Product(
      id: 9,
      name: 'Koshary',
      category: 3,
      imageURL:
          'https://hsaa.hsobjects.com/h/menuitems/images/000/716/412/a232af405eb92fc74ba498ae5b35686b-size1200.png',
      price: 35.99),
  Product(
      id: 10,
      name: 'Lazania',
      category: 3,
      imageURL:
          'https://www.pngall.com/wp-content/uploads/5/Lasagna-PNG-Free-Download.png',
      price: 30.99),
  Product(
      id: 11,
      name: 'Fried Chicken',
      category: 4,
      imageURL:
          'https://www.freepnglogos.com/uploads/fried-chicken-png/fried-chicken-doyle-restaurant-inc-welcome-8.png',
      price: 23.99),
  Product(
      id: 12,
      name: 'Grilled Chicken',
      category: 4,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/021/665/576/original/delicious-grilled-chicken-cutout-png.png',
      price: 43.99),
];
