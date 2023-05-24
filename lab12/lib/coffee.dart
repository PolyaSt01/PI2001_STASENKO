import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'classes/mainMachine.dart';
import 'classes/enum.dart';
import 'classes/res.dart';
import 'classes/async.dart';

class coffeeScreen extends StatefulWidget {
  final Resources resources;

  const coffeeScreen({Key? key, required this.resources}) : super(key: key);

  @override
  State<coffeeScreen> createState() => _coffeeScreenState();
}

class _coffeeScreenState extends State<coffeeScreen> {
  late Machine machine;
  @override
  void initState() {
    super.initState();
    machine = Machine(widget.resources);
  }
  int get milk => widget.resources.getMilk;
  int get water => widget.resources.getWater;
  int get coffeeBeans => widget.resources.getCoffee;
  int get cash => widget.resources.getCash;
  Coffee? coffee = Coffee.Americano;
  final textController = TextEditingController();
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return ListView(
    children: [
      Column(
        children: [
          SizedBox(
              child: Container(
                color: Colors.lime,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      rowWidget('Beans: ${widget.resources.getCoffee}'),
                      rowWidget('Milk: ${widget.resources.getMilk}'),
                      rowWidget('Water: ${widget.resources.getWater}'),
                      const SizedBox(
                        height: 10,
                      ),
                      windowWidget(220),
                    ],
                  ),
                ),
              )),
          radioPickerWidget(),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          textFieldWidget(),
        ],
      ),
    ]);
  }

  Stack radioPickerWidget() {
    return Stack(children: [
      SizedBox(
        height: 160,
        child: ListView(
          children: [
            listTileWidget('Americano', Coffee.Americano),
            listTileWidget('Cappucino', Coffee.Cappucino),
            listTileWidget('Espresso', Coffee.Espresso),
          ],
        ),
      ),
      Positioned(
        right: 10,
        bottom: 0,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Color.fromRGBO(16, 124, 111, 1),
          child: IconButton(
              color: Colors.black,
              iconSize: 30,
              splashRadius: 5,
              padding: const EdgeInsets.all(0),
              onPressed: () async {
                var check = machine.makeCoffeeByType(coffee!.toNewString());
                if (!check) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Добавьте ингредиенты'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Греем воду'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                  await heatingTheWater();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Вода нагрета'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Варим кофе'),
                      duration: const Duration(seconds: 5),
                    ),
                  );
                  await brewingCoffee();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Кофе сварено'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Добавляем молоко'),
                      duration: const Duration(seconds: 5),
                    ),
                  );
                  await whippingMilk();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Молоко добавлено'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Смешиваем ингредиенты'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                  await mixing();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Кофе готов!'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.play_arrow),
              ),
        ),
      ),
    ]);
  }
  Row textFieldWidget() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'Введите значение';
              },
              onEditingComplete: () async {
                if (textController.text.isEmpty || textController.text == '0') {
                  setState(() {
                    errorText = 'Не забудьте поплнить баланс';
                  });
                } else {
                  setState(() {
                    errorText = null;
                    widget.resources.setResources(4, int.tryParse(textController.text)!);
                    textController.text = '';
                  });
                }
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: errorText,
                hintText: 'Put money here',
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Color.fromRGBO(165, 235, 159, 1),
          child:
            IconButton(
              iconSize: 30,
              splashRadius: 5,
              padding: const EdgeInsets.all(0),
              onPressed: () {
              setState(() {
                widget.resources.setResources(4, int.tryParse(textController.text)!);
                textController.text = '';
              });
            },
            icon: const Icon(Icons.attach_money),
            color: Colors.black,
          ),
        ),

        const SizedBox(width: 10,),

        CircleAvatar(
          radius: 20,
          backgroundColor: Color.fromRGBO(235, 159, 173, 1),
          child:
            IconButton(
              iconSize: 30,
              splashRadius: 5,
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  int cash = widget.resources.getCash;
                  widget.resources.setResourcesSubtract(4, cash);
                  textController.text = '';
                });
              },
              icon: const Icon(Icons.money_off_csred),
              color: Colors.black,
            ),
        ),
      ],
    );
  }

  SizedBox windowWidget(double height) {
    return SizedBox(
      width: 380,
      height: 190,
      child: Container(
        color: Colors.white54,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 45, 0, 30),
              child: Text(
                'Coffee Maker',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child:
                Text(
                  'Your money: ${widget.resources.cash}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Color.fromRGBO(100, 100, 100, 1),),
                )
            ),
          ],
        ),
      ),
    );
  }

  ListTile listTileWidget(String title, Coffee value) {
    return ListTile(
      title: Text(title),
      leading: Radio<Coffee>(
        groupValue: coffee,
        value: value,
        activeColor: Color.fromRGBO(35, 21, 1, 1),
        onChanged: (Coffee? value) {
          setState(() {
            coffee = value;
          });
        },
      ),
    );
  }

  Row rowWidget(String text) {
    return Row(
      children: [
        Text(text),
      ],
    );
  }
}