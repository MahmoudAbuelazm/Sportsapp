import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("All Country"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
  
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1 / 17,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 195, 197, 232),
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://cdn.alweb.com/thumbs/egyptencyclopedia/article/fit710x532/%D8%B9%D9%84%D9%85-%D9%85%D8%B5%D8%B1-%D8%A3%D9%87%D9%85-%D8%A7%D9%84%D8%AD%D9%82%D8%A7%D8%A6%D9%82.jpg'),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Egypt"),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
