class Product {
  final String image, title, reviews, star, starImg, description;
  final int price, id;

  Product({
    required this.reviews,
    required this.star,
    required this.starImg,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Ant-Esports",
      price: 1200,
      image: "assets/images/items/Ant-Esports.jpg",
      reviews: "80",
      star: "4.8",
      description:
          "Ant-Esports Gaming Mouse, Wired Gaming Mouse with RGB Backlit, 8000 DPI Adjustable, Mouse with 9 Programmable Macro Buttons & Fire Button, Software Supports DIY Keybinds, M910-K",
      starImg: "assets/images/items/star.png"),
  Product(
      id: 2,
      title: "Logitech G305",
      price: 4933,
      image: "assets/images/items/Logitech G305.jpg",
      reviews: "100",
      star: "5.0",
      description:
          "Logitech G305 LIGHTSPEED Wireless Gaming Mouse, Hero 12K Sensor, 12,000 DPI, Lightweight, 6 Programmable Buttons, 250h Battery Life, On-Board Memory, PC/Mac - Black",
      starImg: "assets/images/items/star.png"),
  Product(
      id: 3,
      title: "Logitech G402",
      price: 3125,
      image: "assets/images/items/Logitech g402.jpg",
      reviews: "250",
      star: "3.8",
      description:
          "Logitech G402 Hyperion Fury Wired Gaming Mouse, 4,000 DPI, Lightweight, 8 Programmable Buttons, Compatible with PC/Mac - Black",
      starImg: "assets/images/items/star.png"),
  Product(
      id: 4,
      title: "Razer",
      price: 6758,
      image: "assets/images/items/Razer.jpg",
      reviews: "90",
      star: "4.0",
      description:
          "Razer Basilisk Ultimate HyperSpeed Wireless Gaming Mouse: Fastest Gaming Mouse Switch, 20K DPI Optical Sensor, Chroma RGB Lighting, 11 Programmable Buttons, 100 Hr Battery, Classic Black",
      starImg: "assets/images/items/star.png"),
  Product(
      id: 5,
      title: "Steel Series",
      price: 4193,
      image: "assets/images/items/Steel-Series.jpg",
      reviews: "150",
      star: "4.2",
      description:
          "SteelSeries Rival 5 Gaming Mouse with PrismSync RGB Lighting and 9 Programmable Buttons – FPS, MOBA, MMO, Battle Royale – 18,000 CPI TrueMove Air Optical Sensor - Black",
      starImg: "assets/images/items/star.png"),
  Product(
      id: 6,
      title: "Viper",
      price: 4111,
      image: "assets/images/items/Viper.jpg",
      reviews: "153",
      star: "4.1",
      description:
          "Razer Viper 8KHz Ultralight Ambidextrous Wired Gaming Mouse: Fastest Gaming Switches - 20K DPI Optical Sensor - Chroma RGB Lighting - 8 Programmable Buttons - 8000Hz HyperPolling - Classic Black",
      starImg: "assets/images/items/star.png"),
];
