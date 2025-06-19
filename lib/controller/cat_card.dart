import 'package:flutter/material.dart';
import 'package:flutter_application_1/characterristic_bar.dart';
import 'package:flutter_application_1/info_row.dart';
import 'package:flutter_application_1/model/cat_model.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cat name and image
            Row(
              children: [
                Expanded(
                  child: Text(
                    cat.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),
                ),
                if (cat.imageLink.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      cat.imageLink,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[300],
                          child: Icon(Icons.pets, color: Colors.grey[600]),
                        );
                      },
                    ),
                  ),
              ],
            ),
            
            SizedBox(height: 16),
            
            // Basic info
            InfoRow(label: 'Origin', value: cat.origin),
            InfoRow(label: 'Length', value: cat.length),
            InfoRow(
              label: 'Weight', 
              value: '${cat.minWeight} - ${cat.maxWeight} lbs'
            ),
            InfoRow(
              label: 'Life Expectancy', 
              value: '${cat.minLifeExpectancy} - ${cat.maxLifeExpectancy} years'
            ),
            
            SizedBox(height: 16),
            
            // Characteristics
            Text(
              'Characteristics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            
            CharacteristicBar(label: 'Family Friendly', value: cat.familyFriendly),
            CharacteristicBar(label: 'Children Friendly', value: cat.childrenFriendly),
            CharacteristicBar(label: 'Other Pets Friendly', value: cat.otherPetsFriendly),
            CharacteristicBar(label: 'Playfulness', value: cat.playfulness),
            CharacteristicBar(label: 'Intelligence', value: cat.intelligence),
            CharacteristicBar(label: 'Grooming Needs', value: cat.grooming),
            CharacteristicBar(label: 'Shedding', value: cat.shedding),
            CharacteristicBar(label: 'General Health', value: cat.generalHealth),
          ],
        ),
      ),
    );
  }
}