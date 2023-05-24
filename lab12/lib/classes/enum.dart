enum Coffee {
  Americano,
  Espresso,
  Cappucino,
}

extension ParseToString on Coffee {
  String toNewString() {
    return toString().split('.').last;
  }
}

abstract class ICoffee {
  int milk();
  int coffeeBeans();
  int water();
  int cash();

  static ICoffee getEspresso() => coffeeEspresso();
  static ICoffee getCappuccino() => coffeeCappuccino();
  static ICoffee getAmericano() => coffeeAmericano();
}

class coffeeAmericano implements ICoffee {
  final type = Coffee.Americano;
  @override
  int cash() => 80;
  @override
  int coffeeBeans() => 50;
  @override
  int milk() => 0;
  @override
  int water() => 100;
  @override
  String toString() {
    return 'Американо';
  }
}

class coffeeEspresso implements ICoffee {
  final type = Coffee.Espresso;
  @override
  int cash() => 120;
  @override
  int coffeeBeans() => 30;
  @override
  int milk() => 250;
  @override
  int water() => 50;
  @override
  String toString() {
    return 'Эспрессо';
  }
}

class coffeeCappuccino implements ICoffee {
  final type = Coffee.Cappucino;
  @override
  int cash() => 150;
  @override
  int coffeeBeans() => 50;
  @override
  int milk() => 140;
  @override
  int water() => 30;
  @override
  String toString() {
    return 'Каппучино';
  }
}