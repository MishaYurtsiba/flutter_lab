import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class CardData {
  final int id;
  String image;
  String name;
  String description;

  CardData({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cardData = [
    CardData(
        id: 0,
        image: './assets/images/mq_9.jpg',
        name: 'Mq_9',
        description: 'Наслідник MQ-1 Predatorа. Досі він числиться серед озброєння в США,  Британії та Італії.'
    ),
    CardData(
        id: 1,
        image: './assets/images/byraktar.jpg',
        name: 'Byraktar',
        description: ''
    ),
    CardData(
        id: 2,
        image: './assets/images/rq-4.jpg',
        name: 'Rq-4',
        description: 'Цей безпілотник вважають найбезпечнішим у світі. Так, його виготовили не для нанесення ударів, а для іншої мети.'
    ),
    CardData(
        id: 3,
        image: './assets/images/transis.jpg',
        name: 'Transis',
        description: 'Британський новітній безпілотник-штурмовик. Його місія – виконувати міжконтинентальні польоти. Має надзвукову швидкість.'
    ),
  ];

  int index = 0;

  void Next(){
    setState(() {
      if (index != 3){
        index += 1;
      } else {
        index = 0;
      }
    });
  }
  void Back(){
    setState(() {
      if (index != 3){
        index += 1;
      } else {
        index = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: const Text('My Stateful Widget'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 40),
          child: Column(
            children: [
              Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40,),
                      Image(image: AssetImage(cardData[index].image), height: 100,),
                      const SizedBox(height: 30,),
                      Text(cardData[index].name, style: const TextStyle(fontSize: 35),),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(cardData[index].description),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed:Next,
                      child: const Text('Back'),
                  ),
                  ElevatedButton(
                      onPressed: Back,
                      child: const Text('Next')
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}