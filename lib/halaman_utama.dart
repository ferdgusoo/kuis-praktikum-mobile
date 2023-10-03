import 'package:flutter/material.dart';
import 'package:kuisprakmobile/halaman_detail.dart';
import 'package:kuisprakmobile/data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Column(
            children: [Text('Halaman Utama')],
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku data = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetail(
                      data: data,
                    ),
                  ));
            },
            child: Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.network(
                      data.imageLink,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(data.title),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
