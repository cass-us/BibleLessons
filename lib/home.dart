import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/theeCross.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay with content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Login button (Top-Right)
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to LoginPage
                      Navigator.pushNamed(context, '/CurrencyMaterialPage');
                    },
                    child: const Text('Login'),
                  ),
                ),

                const Spacer(),

                // Mission and Vision (Center)
                // Center(
                //   child: Column(
                //     children: const [
                //       Text(
                //         'Our Mission',
                //         style: TextStyle(
                //           fontSize: 28,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //         ),
                //       ),
                //       SizedBox(height: 10),
                //       Text(
                //         'To spread the love and teachings of Jesus Christ\n'
                //         'through compassion, service, and truth.',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(fontSize: 18, color: Colors.white),
                //       ),
                //       SizedBox(height: 30),
                //       Text(
                //         'Our Vision',
                //         style: TextStyle(
                //           fontSize: 28,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //         ),
                //       ),
                //       SizedBox(height: 10),
                //       Text(
                //         'To be a light in the world, empowering communities\n'
                //         'with faith, hope, and love for all.',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(fontSize: 18, color: Colors.white),
                //       ),
                //     ],
                //   ),
                // ),
                const Spacer(),

                // Bible Verse (Bottom-Right)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '"For I know the plans I have for you," declares the Lord, '
                      '"plans to prosper you and not to harm you, plans to give you hope and a future." - Jeremiah 29:11',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
