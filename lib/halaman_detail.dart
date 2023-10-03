import 'package:flutter/material.dart';
import 'package:kuisprakmobile/data_buku.dart';
import 'package:kuisprakmobile/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatelessWidget {
  final DataBuku data;

  const HalamanDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    bool isFav;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
        title: Text(data.title,),
        actions: <Widget>[
          Bookmark(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image.network(data.imageLink)),

              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.title, style: TextStyle(
                    color: Colors.blue[900],
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Alamat:',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    data.author,
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Bahasa:',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    data.language,
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Harga Tiket:',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    data.country,
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Jumlah Halaman:',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    data.pages.toString(),
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Tahun terbit:',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    data.year.toString(),
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl((data.link));
        },
        child: Icon(Icons.open_in_browser, color: Colors.indigo,),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}

class Bookmark extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<Bookmark> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.favorite : Icons.favorite_border,
        color: _isBookmarked ? Colors.white : null,
      ),
      onPressed: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isBookmarked ? 'Bookmark Added' : 'Bookmark Deleted'),
            backgroundColor : _isBookmarked ? Colors.green[700] : Colors.red[700],
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}