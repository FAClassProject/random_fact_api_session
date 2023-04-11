import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_fact_api_session/services/apicall.dart';

class FactScreen extends StatelessWidget {
  const FactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Flutter API')),
      body: FutureBuilder(
        future: APICall().getRandomFact(),
          builder: (context, snapshotData){
          if(snapshotData.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshotData.hasError){
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("An error Occurred"),
                Text("No Data"),
              ],),
            );
          }
          if(snapshotData.data == null){
            return Center(child: Text("Do data Found"),);
          }
          return Center(child: Text(snapshotData.data!,
            style: TextStyle(fontSize: 20, color: Colors.deepOrange),),);
      }),
    );
  }
}
