class Resources {
  int coffeeBeans;
  int milk;
  int water;
  int cash;

  Resources(this.coffeeBeans, this.milk, this.water, this.cash);

  int get getMilk => milk;
  int get getCoffee => coffeeBeans;
  int get getWater => water;
  int get getCash => cash;

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
  void setResourcesSubtract(int products, int quantity) {
    switch (products) {
      case 1:
        coffeeBeans = coffeeBeans - quantity;
        break;
      case 2:
        milk = milk - quantity;
        break;
      case 3:
        water = water - quantity;
        break;
      case 4:
        cash = cash - quantity;
        break;
      default:
        print("Выберите ресурс! \n");
    }
  }
  @override
  get getResources{
    return "Кофейных зерен: $coffeeBeans; Молока: $milk; Воды: $water; Денег:$cash";
  }
}