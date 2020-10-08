import 'package:flutter/material.dart';
import 'BottomButton.dart';
import 'constants.dart';
import 'FormBMI.dart';

class ResultBMI extends StatelessWidget {
  ResultBMI(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Body Mass Index Result',
                style: styleTitle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              col: inactive,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: styleValue,
                  ),
                  Text(
                    bmiResult,
                    style: styleValue,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: styleLabel,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
