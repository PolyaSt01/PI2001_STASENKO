import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'classes/mainMachine.dart';
import 'classes/async.dart';
import 'classes/enum.dart';
import 'classes/res.dart';


class resourceScreen extends StatefulWidget {
  final Resources resources;

  const resourceScreen({Key? key, required this.resources}) : super(key: key);

  @override
  State<resourceScreen> createState() => _resourceScreenState();
}

class _resourceScreenState extends State<resourceScreen> {
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

  final textControllerMilk = TextEditingController();
  final textControllerWater = TextEditingController();
  final textControllerBeans = TextEditingController();
  final textControllerCash = TextEditingController();
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Container(
                color: Colors.lime,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      windowWidget(250),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textFieldWidget('milk', textControllerMilk,),
            textFieldWidget('water', textControllerWater),
            textFieldWidget('beans', textControllerBeans),
            textFieldWidget('cash', textControllerCash),

            const SizedBox(
              height: 20,
            ),

            SizedBox(
              child: Container(
                width: 360,
                padding: EdgeInsets.only(top: 0, bottom:0, left:130, right:0),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Color.fromRGBO(165, 235, 159, 1),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            int cash;
                            int milk;
                            int water;
                            int beans;
                            cash = int.tryParse(textControllerCash.text) ?? 0;
                            milk = int.tryParse(textControllerMilk.text) ?? 0;
                            water = int.tryParse(textControllerWater.text) ?? 0;
                            beans = int.tryParse(textControllerBeans.text) ?? 0;

                            widget.resources.setResources(4, cash);
                            widget.resources.setResources(1, beans);
                            widget.resources.setResources(3, water);
                            widget.resources.setResources(2, milk);

                            textControllerMilk.text = '';
                            textControllerWater.text = '';
                            textControllerBeans.text = '';
                            textControllerCash.text = '';
                          });
                        },
                        icon: const Icon(Icons.add),
                        iconSize: 30,
                        splashRadius: 30,
                        padding: const EdgeInsets.all(0),
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),

                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Color.fromRGBO(228, 108, 108, 1),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            int cash = widget.resources.getCash;
                            int milk = widget.resources.getMilk;
                            int water = widget.resources.getWater;
                            int beans = widget.resources.getCoffee;

                            widget.resources.setResourcesSubtract(4, cash);
                            widget.resources.setResourcesSubtract(1, beans);
                            widget.resources.setResourcesSubtract(3, water);
                            widget.resources.setResourcesSubtract(2, milk);

                            textControllerMilk.text = '';
                            textControllerWater.text = '';
                            textControllerBeans.text = '';
                            textControllerCash.text = '';
                          });
                        },
                        icon: const Icon(Icons.remove),
                        iconSize: 30,
                        splashRadius: 30,
                        padding: const EdgeInsets.all(0),
                        color: Colors.black,
                      ),
                    ),
                  ],
              ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget windowWidget(double height) {
    return SizedBox(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 30, bottom:10, left:0, right:0),
        height: 275,
        width: 380,
        color: Colors.white54,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 10),
              child: Text(
                'Resources:',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(140, 15, 0, 10),
              child: resourceWidget('milk: ${widget.resources.getMilk}'),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(140, 2, 0, 10),
              child: resourceWidget('water: ${widget.resources.getWater}'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(140, 2, 0, 10),
              child: resourceWidget('beans: ${widget.resources.getCoffee}'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(140, 2, 0, 10),
              child: resourceWidget('cash: ${widget.resources.getCash}'),
            ),
          ],
        ),
      ),
    );
  }
  Padding resourceWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
  Row textFieldWidget(String text, TextEditingController textController) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'Введите значение';
              },
              controller: textController,
              onEditingComplete: () {
                setState(() {
                  if (textControllerMilk.text == '') {
                    errorText = 'Введите значение';
                  } else {
                    errorText = null;
                  }
                });
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: errorText,
                hintText: 'put $text',
              ),
            ),
          ),
        ),
      ],
    );
  }
}