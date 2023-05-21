import "dart:async";
Future<void> heatingTheWater() async {
  print('Нагреваем воду');
  var wait = Future<Object?>.delayed(const Duration(seconds: 3));
  await wait.then((_) => print('Вода нагрета'));
}

Future<void> brewingCoffee() async {
  print('Завариваем кофе');
  var wait = Future<Object?>.delayed(const Duration(seconds: 5));
  await wait.then((_) => print('Кофе заварен'));
}

Future<void> whippingMilk() async {
  print('Взбиваем молоко');
  var wait = Future<Object?>.delayed(const Duration(seconds: 5));
  await wait.then((_) => print('Молоко взбито'));
}

Future<void> mixing() async {
  print('Смешиваем кофе и молоко');
  var wait = Future<Object?>.delayed(const Duration(seconds: 3));
  await wait.then((_) => print('Кофе и молоко смешаны'));
}