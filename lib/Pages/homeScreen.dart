import 'package:flutter/material.dart';
import '../Custom/customTitle.dart';
import '../model/model.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("News App",
                style: TextStyle(color: Colors.black, fontSize: 25))),
      ),

      //Now let's call the APi services with futurebuilder wiget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  customListTile(articles![index], context),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        },
      ),
    );
  }
}
