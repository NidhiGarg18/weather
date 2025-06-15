import 'package:flutter/material.dart';
import 'package:weather/api_services.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _city=TextEditingController();
  dynamic api;
  bool isReady=false;
  _getapiwithoutmodel()async{
    final city=_city.text;
    // final data=await api.getapiwithoutmodel(city);
    // setState(() {
    //   api=data;
    // });
    isReady=true;
    ApiServices().getapiwithoutmodel(city).then((value){
      setState(() {
        api=value;
        isReady=false;
      });
    });
  }
  @override
  void initState(){
    _getapiwithoutmodel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather"),
        ),
        body: isReady==true?
        Center(
          child: CircularProgressIndicator(),
        ):
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Center(
             child: Padding(
               padding: const EdgeInsets.all(25.0),
               child: TextField(
                controller: _city,
                decoration: InputDecoration(labelText: "Enter Your City",
                labelStyle: TextStyle(fontSize: 20,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2,color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2,color: Colors.blue),
                )
                ),
               ),
             ),
           ),
           SizedBox(height: 20,),
           ElevatedButton(onPressed: _getapiwithoutmodel,
           style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
           child: Text('Get Data',style: TextStyle(color: Colors.white),),
           ),
           SizedBox(height: 20,),
           Column(
          children: [
            Text('Temperature:${api ?['main']?['temp']??'N/A'}°C'),
            Text('Condition:${api?['weather']?[0]?['description']??'N/A'}')
          ],
         )
          ],
        )
      ),
    );
  }
}