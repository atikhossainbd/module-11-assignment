import 'package:flutter/material.dart';

class IncreaseDecreaseButtons extends StatefulWidget {
  final int value;
  final Function(int) onValueChanged;

  const IncreaseDecreaseButtons({super.key, required this.value, required this.onValueChanged});

  @override
  State<IncreaseDecreaseButtons> createState() =>
      _IncreaseDecreaseButtonsState();
}

class _IncreaseDecreaseButtonsState extends State<IncreaseDecreaseButtons> {

  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  void _increment() {
    setState(() {
      _currentValue++;
      widget.onValueChanged(_currentValue);
    });
  }

  void _decrement() {
    if (_currentValue > 0) {
      setState(() {
        _currentValue--;
        widget.onValueChanged(_currentValue);
      });
    }
  }

  double screen331 = 350.0;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: screenWidth <= screen331 ? 35 : 45,
          width: screenWidth <= screen331 ? 35 : 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  _decrement();
                },
                icon: Icon(
                  Icons.remove,
                  color: Colors.grey,
                  size: screenWidth <= screen331 ? 20 : 25,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 14,
        ),
        Text(
          _currentValue.toString(),
          style: TextStyle(fontSize: screenWidth <= screen331 ? 14 : 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: screenWidth <= screen331 ? 35 : 40,
          width: screenWidth <= screen331 ? 35 : 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                _increment();
              },
              icon: Icon(
                Icons.add,
                color: Colors.grey,
                size: screenWidth <= screen331 ? 20 : 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
