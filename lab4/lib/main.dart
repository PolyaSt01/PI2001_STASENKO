import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Общежития КУБГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _titleAndButton = Container(
    padding: const EdgeInsets.all(28),
    child: Row(
      children:
      [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Общежитие № 20',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Text(
                'Краснодар, ул. Калинина, 13',
                style: TextStyle(color: Colors.grey,fontSize: 16,),
              ),
            ],
          ),
        ),
        Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        const Text('27',
        style: TextStyle(fontSize: 17),),
      ],
    ),
  );

  var _buttonCall = Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.phone,
        color: Colors.green,
      ),

      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          'Позвонить',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.green),
        ),
      )
    ],
  );

  var _buttonPath = Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.navigation,
        color: Colors.green,
      ),


      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          'Маршрут',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.green),
        ),
      )
    ],
  );

  var _buttonShare = Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.share,
        color: Colors.green,
      ),

      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          'Поделиться',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.green),
        ),
      )
    ],
  );

  var _descriptionOfTheHostel = Padding(
    padding: EdgeInsets.all(28),
    child: Text(
      'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
      style: TextStyle(fontSize: 16, color: Colors.black,),
    ),
  );


  var _descriptionOfTheHostel = Padding(
    padding: EdgeInsets.all(28),
    child: Text(
      'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
      style: TextStyle(fontSize: 16, color: Colors.black,),
    ),
  );


  @override
  Widget build(BuildContext context) {

    var _buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          _buttonCall,
          _buttonPath,
          _buttonShare,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Общежития КУБГАУ'),
      ),

    body: ListView(
        children: [
          Image.asset('assets/images/15.jpg'),
          _titleAndButton,
          _buttons,
          _descriptionOfTheHostel,
        ],
      ),
    );
  }
}