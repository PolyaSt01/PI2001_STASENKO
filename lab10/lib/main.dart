import 'dart:io';
import 'enum.dart';

class Resources{
  late var coffeeBeans = 0;
  late var milk = 0;
  late var water = 0;
  late var cash = 0;

  get getResources{
    return "Кофейных зерен: $coffeeBeans; Молока: $milk; Воды: $water; Денег:$cash";
  }

  void setResources(int products, int quantity) {
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
        print("Выберите ресурс! \n");
    }
  }
}

class Machine{
  var resources = Resources();
  ICoffee? icoffee;
  ICoffee cof(ICoffee){
    return icoffee = ICoffee;
  }

  bool isAvailableResource(ICoffee icoffee) {
    if(resources.coffeeBeans >= icoffee.coffee() && resources.milk >= icoffee.milk() && resources.water >= icoffee.water() && resources.cash >= icoffee.cash()){
      return true;
    }
    else{
      return false;
    }
  }

  void subStractResources(ICoffee icoffee) {
    if(isAvailableResource(icoffee)) {
      resources.coffeeBeans = resources.coffeeBeans - icoffee.coffee();
      resources.water = resources.water - icoffee.water();
      resources.milk = resources.milk - icoffee.milk();
      resources.cash = resources.cash - icoffee.cash();

      print("Кофе готов!\n"
          "Осталось:\n"
          "${resources.getResources} \n");
    } else {
      print("Недостаточно ресурсов для приготовления кофе!\n\n"
          "Для приготовления нужно ${icoffee.coffee()} гр кофейных зерен, "
          "${icoffee.milk()} мл молока и ${icoffee.water()} мл воды. Стоимость: ${icoffee.cash()}руб.\n\n"
          "Осталось:\n"
          "${resources.getResources} \n");
    }
  }

  void makingCoffee(ICoffee icoffee) {
    subStractResources(icoffee);
  }

  void makeCoffeeByType(int products) {
    switch (products) {
      case 1:
        makingCoffee(ICoffee.getCappuccino());
        break;
      case 2:
        makingCoffee(ICoffee.getEspresso());
        break;
      case 3:
        makingCoffee(ICoffee.getAmericano());
        break;
      default:
        print("Неправильно выбран кофе!");
    }
  }
}

void main() {
  var resources = Resources();
  var machine = Machine();

  while (true) {
    print("Выберите действие:");
    print("1. Добавить ресурсов");
    print("2. Сделать кофе");
    print("3. Выход");

    var choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      print("Выберите ресурс:");
      print("1. Кофейные зерна");
      print("2. Молоко");
      print("3. Вода");
      print("4. Наличные");

      var products = int.parse(stdin.readLineSync()!);
      print("Введите количество:");
      var quantity = int.parse(stdin.readLineSync()!);
      machine.resources.setResources(products, quantity);
      print("Ресурсы добавлены!");

    } else if (choice == 2) {
      print("Выберите кофе:");
      print("1. Капучино");
      print("2. Эспрессо");
      print("3. Американо");

      var typeOfCoffee = int.parse(stdin.readLineSync()!);
      machine.makeCoffeeByType(typeOfCoffee);
    } else if (choice == 3) {
      break;
    } else {
      print("Неправильно выбрано действие!");
    }
  }
}