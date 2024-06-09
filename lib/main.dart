import 'package:flutter/material.dart';
import 'package:http_api/http_handler.dart';
import 'package:http_api/photo_class.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const MyHomePage(),
    );
  }
}
//رغد موسى
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  HTTPHandler httpHandler = HTTPHandler();
   late Future<List<Photo>> photoList ;
    @override
  void initState() {
    super.initState();
   photoList= httpHandler.fetchData();
  }

   

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       title: const Text("HTTP"),
     ),
       //آلاء أحمد شعبانو & حلا حمود
    body:FutureBuilder
    (future: photoList,
    builder: (context , snapshot)
    {
        if(snapshot.hasData)
        {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context,index) {
              return Divider();
            }, 
            itemBuilder: (context , index)
            {
               return buildCard(snapshot.data![index]) ;
            },
           
          );
        }
        else if(snapshot.hasError)
        {
          return Center(child: Text('Somthing went wrong'),);
        }
        else {
          return Center(child: CircularProgressIndicator(),);
        }
    },
    ) 
    );
  }

  //الزهراء كيخيا 
  buildCard (Photo photo){
    return Card(
      elevation: 7,
      margin:  const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: ListTile(
          title: Text(photo.title),
          leading: CircleAvatar(child:
          Image.network(photo.url,
              errorBuilder: (BuildContext context,
              Object exception, StackTrace? stackTrace) {
          return Icon(Icons.image);
          },),),
          ),),

    ) ;
  }
}
