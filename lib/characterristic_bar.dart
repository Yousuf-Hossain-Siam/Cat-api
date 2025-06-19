import 'package:flutter/material.dart';

class CharacteristicBar extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;

  const CharacteristicBar({
    Key? key, 
    required this.label, 
    required this.value,
    this.maxValue = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: value / maxValue,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      value <= 2 ? Colors.red : 
                      value <= 3 ? Colors.orange : Colors.green,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text('$value/$maxValue'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}