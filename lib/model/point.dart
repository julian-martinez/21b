class Point {
  Point(this.relativeX, this.relativeY, this.productId);

  final double relativeX;
  final double relativeY;
  final int productId;

}

class Product {
  Product(this.id, this.brand, this.model, this.price, this.saved, this.image);

  final int id;
  final String brand;
  final String model;
  final String price;
  final int saved;
  final String image;
}