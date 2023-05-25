import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  var _width;
  var _height;
  var _square;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:
      Form(
        key: _formKey,
        child:
        Column(
          children: [
            TextFormField(
              decoration: new InputDecoration(labelText: "Ширина, мм"),
              keyboardType: TextInputType.number,
              validator: (value) {
              if (value!.isEmpty) return 'Введите ширину';
              try {
                _width = double.parse(value);
              } catch (elem) {
                _width = null;
                return 'Введите число';
              }
              },
            ),

            const SizedBox(height: 20,),

            TextFormField(
              decoration: new InputDecoration(labelText: "Высота, мм"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) return 'Введите высоту';
                try {
                  _height = double.parse(value);
                } catch(elem) {
                  _height = null;
                  return 'Введите число';
                }
              },
              ),

            const SizedBox(height: 30,),

            ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Успешное вычисление'), backgroundColor: Colors.green,)
                    );
                    setState(() {
                      if (_width is double && _height is double) {
                        _square = _width * _height;
                      };
                    });
                  };
                },
                child: Text('Вычислить')
            ),

            const SizedBox(height: 30,),

            Text(_square == null
                ? 'Задайте параметры'
                : 'S = $_width * $_height = $_square (мм2)',
              style: TextStyle(fontSize: 30),),

          ],
        ),
      ),
    );
  }
}

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Форма ввода')),
        body: MyForm(),
      ),
    )
);

