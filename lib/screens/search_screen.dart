import 'package:flutter/material.dart';
import 'package:dangkidangnhap/components/custtom_app_bar.dart';
import 'package:dangkidangnhap/components/text_field_widget.dart';
import 'package:dangkidangnhap/screens/all_recipe.dart';

import '../constants/search_tag.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: 'Search', back: false,),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h*.016, horizontal: w*.032),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldWidget(),
            SizedBox(height: h*.04,),

            Text(
              'Search Tags',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w*.06,
              ),
            ),
            Wrap(
              spacing: 8,
              children: tags.map((label) {
                return ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>AllRecipe(recipe: label))
                      );
                    },
                    child: Text(label),
                );
              }).toList()
            )
          ],
        ),
      ),
    );
  }
}
