import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzastask/theme/themedata.dart';
import 'package:sliding_switch/sliding_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(),
      home: const MyHomePage(title: 'Pizza calculation'),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

enum SoucesCharacter { hot, sweet, cheese }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SoucesCharacter? _soucesCharacter = SoucesCharacter.hot;
  double _currentSliderValue = 20;
  double value = 20;
  bool _cheese = false;
  bool _typeDough = false;
  int pizzaCost = 100;
  double summCalc = 0;

  double _pizzaCalculateCost() {
    double _souces = 0;
    double dough = 0;
    int additional_cheese = 0;

    switch (_soucesCharacter) {
      case SoucesCharacter.hot:
        _souces = 30.0;
        break;
      case SoucesCharacter.sweet:
        _souces = 40.0;
        break;
      case SoucesCharacter.cheese:
        _souces = 50.0;
        break;
    }

    if (_cheese) {
      additional_cheese = 30;
    }
    ;
    if (_typeDough) {
      dough = 50;
    } else
      dough = 0;

    this.summCalc = pizzaCost +
        _currentSliderValue / 0.5 +
        _souces +
        additional_cheese +
        dough;
    return summCalc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 1,
          ),
          Align(
            child: SizedBox(
              width: 232,
              height: 123,
              child: Image(
                image: AssetImage('assets/pizza2.png'),
              ),
            ),
            alignment: Alignment.bottomRight,
          ),
          SizedBox(
            width: 88,
            height: 33,
          ),
          Text('Калькулятор пиццы',
              style: Theme.of(context).textTheme.headline6),
          Text('Выберете параметры',
              style: Theme.of(context).textTheme.headline5),
          SizedBox(
            height: 14,
          ),
          SlidingSwitch(
            value: false,
            width: 300,
            onChanged: (bool value) {
              setState(() {
                _typeDough = value;
              });
            },
            height: 35,
            animationDuration: const Duration(milliseconds: 400),
            onTap: () {},
            onDoubleTap: () {},
            onSwipe: () {},
            textOff: "Обычное тесто",
            textOn: "Тонкое тесто",
            colorOn: Colors.white,
            colorOff: Colors.white,
            buttonColor: Colors.lightBlue,
            inactiveColor: Colors.grey,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text('Размер',
                style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: SizedBox(
              width: 300,
              height: 34,
              child: TextField(
                enableInteractiveSelection: false,
                focusNode: new AlwaysDisabledFocusNode(),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(36)),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0), width: 20)),
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: _currentSliderValue.round().toString() + ' см',
                  focusColor: Colors.white,
                ),
              ),
            ),
          ),
          Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 10,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text('Соус',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5),
            // MyStatefulWidget(),
          ),
          RadioListTile<SoucesCharacter>(
              title: const Text('Острый'),
              value: SoucesCharacter.hot,
              groupValue: _soucesCharacter,
              onChanged: (SoucesCharacter? value) {
                setState(
                  () {
                    _soucesCharacter = value;
                  },
                );
              }),
          RadioListTile<SoucesCharacter>(
              title: const Text('Кисло-сладкий'),
              value: SoucesCharacter.sweet,
              groupValue: _soucesCharacter,
              onChanged: (SoucesCharacter? value) {
                setState(
                  () {
                    _soucesCharacter = value;
                  },
                );
              }),
          RadioListTile<SoucesCharacter>(
              title: const Text('Сырный'),
              value: SoucesCharacter.cheese,
              groupValue: _soucesCharacter,
              onChanged: (SoucesCharacter? value) {
                setState(
                  () {
                    _soucesCharacter = value;
                  },
                );
              }),
          SizedBox(
            width: 300,
            child: Card(
              elevation: 0,
              color: Colors.black12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: 38,
                      height: 30,
                      child: Image.asset('assets/cheese.png'),
                    ),
                  ),
                  const Text(
                    'Дополнительный сыр',
                    style: TextStyle(fontSize: 16, color: Colors.black38),
                  ),
                  Switch(
                    value: _cheese,
                    onChanged: (bool value) {
                      setState(() {
                        _cheese = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text('Стоимость',
                style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: SizedBox(
              width: 300,
              height: 35,
              child: TextField(
                enableInteractiveSelection: false,
                focusNode: new AlwaysDisabledFocusNode(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: _pizzaCalculateCost().toString(),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(36)),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0), width: 10)),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(154, 30)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              onPressed: () {},
              child: Text('Заказать'))
        ],
      ),
      //  body:
    ));
  }
}
