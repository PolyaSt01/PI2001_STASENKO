import 'res.dart';
import 'enum.dart';

class Machine {
  final Resources res;
  Machine(this.res);

  ICoffee? ctype;
  ICoffee cof(ICoffee value) {
    return ctype = value;
  }

  bool isAvailableRes() {
    if (res.coffeeBeans >= ctype!.coffeeBeans() &&
        res.water >= ctype!.water() &&
        res.cash >= ctype!.cash() &&
        res.milk >= ctype!.milk()) {
      return true;
    }
    return false;
  }

  Future<void> subStractRes() async {
    int milk = ctype!.milk();
    int water = ctype!.water();
    int cash = ctype!.cash();
    int beans = ctype!.coffeeBeans();

    res.setResourcesSubtract(2, milk);
    res.setResourcesSubtract(3, water);
    res.setResourcesSubtract(1, beans);
    res.setResourcesSubtract(4, cash);
  }

  bool makeCoffeeByType(String? type) {
    type = type!.toLowerCase();
    switch (type) {
      case 'americano':
        cof(coffeeAmericano());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
      case 'cappucino':
        cof(coffeeCappuccino());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
      case 'espresso':
        cof(coffeeEspresso());
        if (!isAvailableRes()) {
          return false;
        }
        subStractRes();
        break;
    }
    res.setResources(2, 0);
    return true;
  }
}