import 'dart:io';
class Machine{
  late var coffeeBeans = 0;
  late var milk = 0;
  late var water = 0;
  late var cash = 0;

  get getResourceCoffeeBeans => coffeeBeans;
  get getResourceMilk => milk;
  get getResourceWater => water;
  get getResourceCash => cash;

  set setResourceCoffeeBeans(int quantity){
    if (quantity >= 0) {
      coffeeBeans = quantity;
    }
  }
  set setResourceMilk(int quantity){
    if (quantity >= 0) {
      milk = quantity;
    }
  }
  set setResourceWater(int quantity){
    if (quantity >= 0) {
      water = quantity;
    }
  }
  set setResourceCash(int quantity){
    if (quantity >= 0) {
      cash = quantity;
    }
  }

  bool isAvailable() {
    if (coffeeBeans >= 50 && water >= 100) {
      return true;
    }
    return false;
  }

  void subtractResources() {
    coffeeBeans = coffeeBeans - 50;
    water = water - 100;
  }

  void makingCoffee() {
    if (isAvailable()) {
      print('Кофейные зерна: $getResourceCoffeeBeans');
      print('Вода: $getResourceMilk');
      print('Молоко: $getResourceWater');
      print('Деньги: $getResourceCash');

      subtractResources();

      print("Кофе готов!");
    }
    else {
      print("Для приготовления нужно 50 гр кофейный зёрен и 100 мл воды\n");
      print('Кофейные зерна: $getResourceCoffeeBeans');
      print('Вода: $getResourceMilk');
      print('Молоко: $getResourceWater');
      print('Деньги: $getResourceCash \n');
    }
  }

  void setResource(int products, int quantity) {
    switch (products) {
      case 1:
        coffeeBeans = coffeeBeans + quantity;
        break;
      case 2:
        milk = milk + quantity;
        break;
      case 3:
        water = water + quantity;
        break;
      case 4:
        cash = cash + quantity;
        break;
      default:
        print("Выберите тип ресурса! \n");
        break;
    }
  }
}

void main() {
  var machine = Machine();

  while (true) {
    print("Выберите действие:");
    print("1. Добавить продукты");
    print("2. Сделать кофе");
    print("3. Выход");

    var choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      print("Выберите тип продукта: ");
      print("1. Кофейные зерна");
      print("2. Молоко");
      print("3. Вода");
      print("4. Наличные");

      var products = int.parse(stdin.readLineSync()!);
      print("Введите количество продукта: ");
      var quantity = int.parse(stdin.readLineSync()!);
      machine.setResource(products, quantity);
    }
    else if (choice == 2) machine.makingCoffee();
    else if (choice == 3) break;
    else print("Выберите действие!");
  }
}
