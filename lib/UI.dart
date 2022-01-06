import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Info.dart';
import 'InfoService.dart';

class UItest extends StatefulWidget {
  const UItest({ Key? key }) : super(key: key);

  @override
  _UItestState createState() => _UItestState();
}

class _UItestState extends State<UItest> {
  InfoService info =   InfoService(); 

  @override
  void initState(){
    super.initState();    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Align(
          child: Text(
            'Members'
            ),
            alignment: Alignment.center,
        ),
        ),
      body: FutureBuilder<List<Info>>(
        future: info.getInfo(),
        builder: (context, snapshot){
          if(snapshot.hasData){
           return ListView.builder(
             itemCount: snapshot.data?.length,
             itemBuilder: (BuildContext context, int index ){
               return buildInfo(snapshot.data![index]);
             });
          }else if(snapshot.hasError){
            return Text('$snapshot.error');
          }else{
            return const CircularProgressIndicator();
          }

        },
      ),
      
    );
  }
   Widget buildInfo(Info info){
    return Container( 
      color: const Color(0xff32a852),
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: 
      Row(        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox( height: 50, width: 50,
             child: ClipOval(
              child: Image.network(info.avatar, fit: BoxFit.cover,),
        ),
           ),
         ),
        Expanded(           
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children:[ 
              Row(  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(info.name, style: 
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(info.age.toString() + ' Age'),
                  ),
                ],
              ),       
              Text(info.company),
              Text(info.address, style: 
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
              
              Container(
        
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  color:Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Text(info.bio) ,)
            ],
          ),
        ),
      ],),
    );

  } 
}