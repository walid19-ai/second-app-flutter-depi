
import 'package:depi_bloc/models/article_model.dart';
import 'package:depi_bloc/widgets/custom_appbar_details.dart';
import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.model});
  final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppbarDetails(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(model.image ?? '',
                  errorBuilder: (context,error,stackTracke){
                    return Icon(Icons.error,color: Colors.red,);
                  }
              )),
          Row(
            spacing: 4,
            children: [
              Text(model.author ??'No Author',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
              Spacer(),
              Icon(Icons.favorite_border_sharp),
              Text('204',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600))
            ],
          ),
            Text(model.date??'date',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600)),
            Text(model.description??'desc',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
            SizedBox(height: 10,),
            Text(model.con??'content'),
          ],
        ),
      ),
    );
  }
}
