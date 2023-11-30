import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        // Implement go back functionality
                      },
                    ),
                    Spacer(), // Add Spacer to push the following content to the right
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      color: Color(0xFFF9E17E),
                      child: Center(
                        // Center the text inside the container
                        child: Text(
                          "User Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Spacer(), // Add Spacer to push the following content to the right
                  ],
                ),
                SizedBox(height: 40),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child:
                            Icon(Icons.person, size: 40.0, color: Colors.black),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                buildDetailBox('email@email.com'),
                buildDetailBox('Address'),
                buildDetailBox('Phone Number'),
                SizedBox(height: 16.0),
                Text(
                  'Listed Items',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                buildListedItemsRow(['Product 1', 'Product 2'], [4, 3]),
                buildListedItemsRow(['Product 3', 'Product 4'], [5, 2]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFFF5BA41),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  // Implement home button functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // Implement cart button functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Implement profile button functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.list, color: Colors.white),
                onPressed: () {
                  // Implement listing button functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailBox(String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF6592D1),
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF4A7FCA),
      ),
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildListedItemsRow(List<String> productNames, List<int> ratings) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < productNames.length; i++)
          Expanded(
            child: buildListedItem(productNames[i], ratings[i]),
          ),
      ],
    );
  }

  Widget buildListedItem(String productName, int rating) {
    // Determine the number of filled and empty stars based on the rating
    int filledStars = rating.clamp(0, 5);
    int emptyStars = 5 - filledStars;

    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              //image: DecorationImage(
              //image: Image.network(
              // 'https://img.freepik.com/psd-gratuit/fauteuil-oreiller_176382-870.jpg',
              //),
              //fit: BoxFit.cover,
              //),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Image.network(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4478bc05-6740-4374-8ef8-e740fce2a2ad/d1myrli-38076490-e4bf-408e-b259-5b146aff2775.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQ0NzhiYzA1LTY3NDAtNDM3NC04ZWY4LWU3NDBmY2UyYTJhZFwvZDFteXJsaS0zODA3NjQ5MC1lNGJmLTQwOGUtYjI1OS01YjE0NmFmZjI3NzUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.g8s1UDX_zcxnZ6qoRIXurRltUkbA-OdW2son3URfBJc',
            ),
          ),
          Container(
            height:
                120.0, // Adjusted height to accommodate stars and additional content
            decoration: BoxDecoration(
              color: Color(0xFF4A7FCA).withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    // Filled stars
                    for (int i = 0; i < filledStars; i++)
                      Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    // Empty stars
                    for (int i = 0; i < emptyStars; i++)
                      Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                  ],
                ),
                SizedBox(height: 8.0),
                Spacer(), // Add Spacer to push the following content to the right
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Align to the right
                  children: [
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        // Implement add item functionality
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
