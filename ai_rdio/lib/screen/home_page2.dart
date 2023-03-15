import 'package:ai_rdio/screen/RegLoginUi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue, Colors.blueAccent])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomBar(),
        bottomNavigationBar: CustomBtnNav(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Lets enjoy your songs',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search your Fav.',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey.shade500),
                  )),
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlueAccent),
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.remove('Verified');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegLoginUi()));
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class CustomBtnNav extends StatelessWidget {
  const CustomBtnNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.white,
        selectedFontSize: 15,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: 'Play'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: 'Profile')
        ]);
  }
}

class CustomBar extends StatelessWidget with PreferredSizeWidget {
  const CustomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1677247191557-4abd28b7c387?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
