import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterSlider(
          height: 200,
          handler: FlutterSliderHandler(
            child: Icon(Icons.abc),
          ),
          values: [2],
          max: 4,
          min: 0,
          selectByTap: true,
          touchSize: 40,
          onDragging: (handlerIndex, lowerValue, upperValue) {},
          hatchMark: FlutterSliderHatchMark(
            labelsDistanceFromTrackBar: 60,
            density: 2,
            labels: [
              FlutterSliderHatchMarkLabel(
                percent: 4,
                label: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SliderMark(),
                    Text('6M'),
                  ],
                ),
              ),
              FlutterSliderHatchMarkLabel(
                percent: 25,
                label: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SliderMark(),
                    Text('1Y'),
                  ],
                ),
              ),
              FlutterSliderHatchMarkLabel(
                percent: 50,
                label: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SliderMark(),
                    Text('3Y'),
                  ],
                ),
              ),
              FlutterSliderHatchMarkLabel(
                percent: 75,
                label: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SliderMark(),
                    Text('5Y'),
                  ],
                ),
              ),
              FlutterSliderHatchMarkLabel(
                percent: 98,
                label: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SliderMark(),
                    Text('10Y+'),
                  ],
                ),
              ),
            ],
          ),
          trackBar: FlutterSliderTrackBar(
            activeTrackBarHeight: 8,
            inactiveTrackBarHeight: 8,
            inactiveTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFF232A38).withOpacity(.55),
            ),
            activeTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF30A1F0),
                  Color(0xFF2D6AD4),
                ],
              ),
            ),
          ),
          axis: Axis.horizontal,
          jump: true,
        ),
      ),
    );
  }
}

class _SliderMark extends StatelessWidget {
  const _SliderMark({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.2,
      height: 7,
      color: Colors.red,
      margin: const EdgeInsets.only(bottom: 5),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _lowerValue = 50;
  double _upperValue = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // width: 100,
              // height: 50,
              padding: EdgeInsets.all(50),
              child: FlutterSlider(
                values: [0],
                max: 100,
                min: 0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 50, right: 50),
              alignment: Alignment.centerLeft,
              child: FlutterSlider(
                values: [60, 160],
//              ignoreSteps: [
//                FlutterSliderIgnoreSteps(from: 120, to: 150),
//                FlutterSliderIgnoreSteps(from: 160, to: 190),
//              ],
                max: 200,
                min: 50,
                maximumDistance: 300,
                rangeSlider: true,
                rtl: true,
                handlerAnimation: FlutterSliderHandlerAnimation(
                    curve: Curves.elasticOut,
                    reverseCurve: null,
                    duration: Duration(milliseconds: 700),
                    scale: 1.4),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                  });
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                alignment: Alignment.centerLeft,
                child: FlutterSlider(
                  values: [1000, 15000],
                  rangeSlider: true,
//rtl: true,
                  ignoreSteps: [
                    FlutterSliderIgnoreSteps(from: 8000, to: 12000),
                    FlutterSliderIgnoreSteps(from: 18000, to: 22000),
                  ],
                  max: 25000,
                  min: 0,
                  step: FlutterSliderStep(step: 100),

                  jump: true,

                  trackBar: FlutterSliderTrackBar(
                    activeTrackBarHeight: 5,
                  ),
                  tooltip: FlutterSliderTooltip(
                    textStyle: TextStyle(fontSize: 17, color: Colors.lightBlue),
                  ),
                  handler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: Material(
                      type: MaterialType.canvas,
                      color: Colors.orange,
                      elevation: 10,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.adjust,
                            size: 25,
                          )),
                    ),
                  ),
                  rightHandler: FlutterSliderHandler(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                  disabled: false,

                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                    setState(() {});
                  },
                )),
            Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                alignment: Alignment.centerLeft,
                child: FlutterSlider(
                  values: [3000, 17000],
                  rangeSlider: true,
//rtl: true,

//                ignoreSteps: [
//                  FlutterSliderIgnoreSteps(from: 8000, to: 12000),
//                  FlutterSliderIgnoreSteps(from: 18000, to: 22000),
//                ],
                  max: 25000,
                  min: 0,
                  step: FlutterSliderStep(step: 100),
                  jump: true,
                  trackBar: FlutterSliderTrackBar(
                    inactiveTrackBarHeight: 2,
                    activeTrackBarHeight: 3,
                  ),

                  disabled: false,

                  handler: customHandler(Icons.chevron_right),
                  rightHandler: customHandler(Icons.chevron_left),
                  tooltip: FlutterSliderTooltip(
                    leftPrefix: Icon(
                      Icons.attach_money,
                      size: 19,
                      color: Colors.black45,
                    ),
                    rightSuffix: Icon(
                      Icons.attach_money,
                      size: 19,
                      color: Colors.black45,
                    ),
                    textStyle: TextStyle(fontSize: 17, color: Colors.black45),
                  ),

                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                    setState(() {});
                  },
                )),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              alignment: Alignment.centerLeft,
              child: FlutterSlider(
                key: Key('3343'),
                values: [300000000, 1600000000],
                rangeSlider: true,
                tooltip: FlutterSliderTooltip(
                  alwaysShowTooltip: true,
                ),
                max: 2000000000,
                min: 0,
                step: FlutterSliderStep(step: 20),
                jump: true,
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  _lowerValue = lowerValue;
                  _upperValue = upperValue;
                  setState(() {});
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 50, right: 50),
              alignment: Alignment.centerLeft,
              child: FlutterSlider(
                values: [30, 60],
                rangeSlider: true,
                max: 100,
                min: 0,
                visibleTouchArea: true,
                trackBar: FlutterSliderTrackBar(
                  inactiveTrackBarHeight: 14,
                  activeTrackBarHeight: 10,
                  inactiveTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                    border: Border.all(width: 3, color: Colors.blue),
                  ),
                  activeTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blue.withOpacity(0.5)),
                ),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  _lowerValue = lowerValue;
                  _upperValue = upperValue;
                  setState(() {});
                },
              ),
            ),

            /*Fixed Values*/
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FlutterSlider(
                jump: true,
                values: [10],
                fixedValues: [
                  FlutterSliderFixedValue(percent: 0, value: "1000"),
                  FlutterSliderFixedValue(percent: 10, value: "10K"),
                  FlutterSliderFixedValue(percent: 50, value: '50000'),
                  FlutterSliderFixedValue(percent: 80, value: "80M"),
                  FlutterSliderFixedValue(percent: 100, value: "100B"),
                ],
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  if (lowerValue is String)
                    _lowerValue = double.parse(lowerValue);
                  else
                    _lowerValue = lowerValue;
                  setState(() {});
                },
              ),
            ),

            /*Hatch Mark Example*/
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FlutterSlider(
                handlerWidth: 15,
                hatchMark: FlutterSliderHatchMark(
                  linesDistanceFromTrackBar: 5,
                  density: 0.5,
                  labels: [
                    FlutterSliderHatchMarkLabel(
                        percent: 0, label: Text('Start')),
                    FlutterSliderHatchMarkLabel(
                        percent: 10, label: Text('10,000')),
                    FlutterSliderHatchMarkLabel(
                        percent: 50, label: Text('50 %')),
                    FlutterSliderHatchMarkLabel(
                        percent: 80, label: Text('80,000')),
                    FlutterSliderHatchMarkLabel(
                        percent: 100, label: Text('Finish')),
                  ],
                ),
                jump: true,
                trackBar: FlutterSliderTrackBar(),
                handler: FlutterSliderHandler(
                  decoration: BoxDecoration(),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                rightHandler: FlutterSliderHandler(
                  decoration: BoxDecoration(),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                values: [30000, 70000],
                visibleTouchArea: true,
                min: 0,
                max: 100000,
                touchSize: 15,
                rangeSlider: true,
                step: FlutterSliderStep(step: 1000),
                onDragging: (handlerIndex, lowerValue, upperValue) {},
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text('Lower Value: ' + _lowerValue.toString()),
            SizedBox(height: 25),
            Text('Upper Value: ' + _upperValue.toString())
          ],
        ),
      ),
    );
  }

  customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Container(
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 23,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 0.05,
                blurRadius: 5,
                offset: Offset(0, 1))
          ],
        ),
      ),
    );
  }
}
