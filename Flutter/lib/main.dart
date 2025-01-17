import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Gallery(),
    );
  }
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List img = [
    "https://images.unsplash.com/photo-1566763306929-a936c7856f7f?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1590013330451-3946e83e0392?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1590013335840-83bbe7031d4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=680&q=80",
    "https://images.unsplash.com/photo-1587613980697-aaf1a97de24c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1589829996053-dd41d0a5123a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1590043336529-b7a5157acb14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My Gallery",
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18.0,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Searh Image",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              SizedBox(
                height: 24.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            img[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(1, index.isEven ? 1.2 : 2);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
