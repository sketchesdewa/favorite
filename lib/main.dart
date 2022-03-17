import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

main() {
  runApp(MaterialApp(
    home: FavoritePage(),
  ));
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  get favoriteDataList => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
      children: [
        ListView.builder(
          itemCount: mainDataList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        mainDataList[index],
                        style: const TextStyle(fontSize: 19.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        favoriteDataList.add(mainDataList[index]);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurple,
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        favoriteDataList.isEmpty
            ? const Center(
                child: Text(
                  'There are no favorites yet!',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : ListView.builder(
                itemCount: favoriteDataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              favoriteDataList[index],
                              style: const TextStyle(fontSize: 19.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              favoriteDataList.remove(favoriteDataList[index]);
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple,
                            ),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ],
    ));
  }
}

void setState(Null Function() param0) {
  var index;
  favoriteDataList.add(mainDataList[index]);
}
