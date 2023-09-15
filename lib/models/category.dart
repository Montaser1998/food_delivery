class Category {
  final int id;
  final String name;
  final String imageURL;

  Category({required this.id, required this.name, required this.imageURL});
}

List<Category> categories = [
  Category(
      id: 1,
      name: "Burger",
      imageURL: "https://cdn-icons-png.flaticon.com/128/1161/1161695.png"),
  Category(
      id: 2,
      name: "Pizza",
      imageURL: "https://cdn-icons-png.flaticon.com/512/1867/1867922.png"),
  Category(
      id: 3,
      name: "Pasta",
      imageURL: "https://cdn-icons-png.flaticon.com/512/5100/5100074.png"),
  Category(
      id: 4,
      name: "Chicken",
      imageURL: "https://cdn-icons-png.flaticon.com/512/1895/1895685.png"),
  Category(
      id: 5,
      name: "Drinks",
      imageURL: "https://cdn-icons-png.flaticon.com/512/3025/3025900.png"),
  Category(
      id: 5,
      name: "Beef",
      imageURL: "https://cdn-icons-png.flaticon.com/512/2619/2619468.png"),
];
