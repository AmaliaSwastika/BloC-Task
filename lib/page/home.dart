import 'package:flutter/material.dart';
import 'package:state_management_bloc/page/detail_page.dart';

class Home extends StatelessWidget {
   Home({Key? key});

  final List<String> imageUrls = [
    'https://img.freepik.com/free-photo/frappe-coffee-white_144627-17433.jpg?w=360&t=st=1695749328~exp=1695749928~hmac=60eaa5ac0c8613284df66353a2e26c93e871232ada34bb493dfe4da49b14edc6',
    'https://img.freepik.com/free-photo/high-angle-glass-dessert-with-chocolate-biscuits_23-2148603290.jpg?w=360&t=st=1695749413~exp=1695750013~hmac=eab7eb9d20ec06269f6185d0837ed6a46cd8c8b46ec93c0a3b34d805068ad6a6',
    'https://img.freepik.com/free-photo/front-view-man-pours-strawberry-syrup-pancakes-with-strawberries-black-red-currants-plate_141793-12105.jpg?w=360&t=st=1695749793~exp=1695750393~hmac=29e362849256a54a3e7244a9f863184ef30d2ca9506229447ec180ba04f80027',
    'https://img.freepik.com/free-photo/assortment-tasty-breakfast-goodies_23-2148829543.jpg?w=360&t=st=1695749881~exp=1695750481~hmac=57cd2e89578ed58ed4080e792f4a1857eb4ab843b1b4c395be959f8b2819c4fa',
  ];

  _showImageBottomSheet(BuildContext context, String imageUrl) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white, 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: 410,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Text("Apakah anda ingin melihat lebih detail?"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Tidak'),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(imageUrl: imageUrl),
                      ),
                    );
                  },
                  child: const Text('Ya'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'Amel Cafe',
          style: 
          TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      drawer: Drawer( 
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contact'),
              onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/'); // Pindah ke halaman kontak
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery Menu'),
              onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/gallery'); // Pindah ke halaman Gallery
              },
            ),
          ],
        ),
      ),
      
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showImageBottomSheet(context, imageUrls[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                imageUrls[index],
                width: 100,
                height: 100,
              ),
            ),
          );
        },
      ),
    );
  }
}