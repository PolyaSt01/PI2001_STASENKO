abstract class ICoffee {
  int coffee();
  int milk();
  int water();
  int cash();

  static ICoffee getEspresso() => coffeeEspresso();
  static ICoffee getCappuccino() => coffeeCappuccino();
  static ICoffee getAmericano() => coffeeAmericano();
}

class coffeeEspresso implements ICoffee {
  @override
  int coffee() => 40;
  @override
  int milk() => 0;
  @override
  int water() => 150;
  @override
  int cash() => 150;
}

class coffeeCappuccino implements ICoffee {
  @override
  int coffee() => 50;
  @override
  int milk() => 200;
  @override
  int water() => 100;
  @override
  int cash() => 300;
}

class coffeeAmericano implements ICoffee {
  @override
  int coffee() => 60;
  @override
  int milk() => 0;
  @override
  int water() => 150;
  @override
  int cash() => 200;
}