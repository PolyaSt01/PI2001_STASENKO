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

  var _descriptionOfTheHostel = Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    textBaseline: TextBaseline.alphabetic,
    // textBaseline: TextBaseline.alphabetic,
    children: const <Widget>[
      Text(
        'Общежитие №20',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      ),

      Text(
        'Краснодар, ул. Калинина, 13',
        style: TextStyle(fontSize: 16, color: Colors.grey,),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      ),
    ],
  );

  var _buttonHeart = Column(
    children: const <Widget>[
      IconButton(
        icon: const Icon(Icons.favorite, color: Colors.red,),
        onPressed: null,
      ),
      Text('27',
      style: TextStyle(fontSize: 16),
      ),
    ],
  );



  @override
  Widget build(BuildContext context) {

    var _descriptionButton = Row(
      children: <Widget>[
        _descriptionOfTheHostel,
        _buttonHeart,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Общежития КУБГАУ'),
      ),

    body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/15.jpg'),


          _descriptionButton,

          // descriptionOfTheHostel,
          // buttonHeart,

          const Text(
          'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитияхуниверситета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов инаглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
          style: TextStyle(fontSize: 16, color: Colors.grey,),
        ),

        ],
      ),




      // onPressed: () {
      //   setState(() {
      //     _volume += 10;
      //   });
      // },
      // Text('Volume : $_volume'),


      // body: Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Image.asset('assets/images/15.jpg'),
      //
      //       Column(
      //         children: [
      //           descriptionOfTheHostel,
      //
      //           Icon(Icons.favorite, color: Colors.red,),
      //           const Text('27'),
      //
      //         ],
      //       ),
      //
      //
      //       // const Text(
      //       //   'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитияхуниверситета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов инаглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
      //       //   style: TextStyle(fontSize: 20, color: Colors.grey,),
      //       // ),
      //     ],
      //   ),
      // ),




      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}




// IconButton(
// icon: const Icon(Icons.volume_up),
// tooltip: 'Increase volume by 10',
// onPressed: () {
// setState(() {
// _volume += 10;
// });
// },
// ),
// Text('Volume : $_volume'),


// body: Container(
// child: Column(
// children: [
// Image.asset('assets/images/15.jpg'),
//
// descriptionOfTheHostel,
//
// const Icon(Icons.favorite, color: Colors.red,),
// const Text('27'),
// ],
//
//
//
// // const Text(
// //   'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитияхуниверситета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов инаглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
// //   style: TextStyle(fontSize: 20, color: Colors.grey,),
// // ),
// ),
//
//
//
// // body: Container(
// //   child: Column(
// //     mainAxisAlignment: MainAxisAlignment.start,
// //     children: [
// //       Image.asset('assets/images/15.jpg'),
// //
// //       Column(
// //         children: [
// //           descriptionOfTheHostel,
// //
// //           Icon(Icons.favorite, color: Colors.red,),
// //           const Text('27'),
// //
// //         ],
// //       ),
// //
// //
// //       // const Text(
// //       //   'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитияхуниверситета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов инаглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
// //       //   style: TextStyle(fontSize: 20, color: Colors.grey,),
// //       // ),
// //     ],
// //   ),
// // ),
//
//
//
//
// // floatingActionButton: FloatingActionButton(
// //   onPressed: _incrementCounter,
// //   tooltip: 'Increment',
// //   child: const Icon(Icons.add),
// // ), // This trailing comma makes auto-formatting nicer for build methods.
// ),



// body: ListView(
// children: [
// Image.asset('assets/images/15.jpg'),
// const Text(
// 'Общежитие №20',
// style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),
// textAlign: TextAlign.left,
// ),
//
// const Text(
// 'Краснодар, ул. Калинина, 13',
// style: TextStyle(fontSize: 16, color: Colors.grey,),
// textAlign: TextAlign.left,
// ),
// ],
// ),