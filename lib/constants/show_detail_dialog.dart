
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowDialog {

  static Future showColories(Map<String, dynamic> item,
      BuildContext context) async {

    int fat = item['FAT']['quantity'].toInt();
    int carb = item['CHOCDF']['quantity'].toInt();
    int cholesterol = item['CHOLE']['quantity'].toInt();
    int sugar = item['SUGAR']['quantity'].toInt();
    int protein = item['PROCNT']['quantity'].toInt();

    int vitaA = item['VITA_RAE']['quantity'].toInt();
    int vitaC = item['VITC']['quantity'].toInt();
    int vitaD = item['VITD']['quantity'].toInt();
    int vitaE = item['TOCPHA']['quantity'].toInt();


    return showDialog(
        context: context, builder: (context){
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Padding(padding: EdgeInsets.only(bottom: 18),
            child: const Text(
              'Nutrutional Fact',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        content: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Fat'),
                    Text(fat.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Carb'),
                    Text(carb.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Cholesterol'),
                    Text(cholesterol.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sugar'),
                    Text(sugar.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Protein'),
                    Text(protein.toString()),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Vitamin A'),
                    Text(vitaA .toString()),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Vitamin C'),
                    Text(vitaC .toString()),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Vitamin D'),
                    Text(vitaD .toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Vitamin E'),
                    Text(vitaE  .toString()),
                  ],
                ),


              ],
            ),
          ),
        ),
      );
    }
    );
  }
}