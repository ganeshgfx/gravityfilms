import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gravity Films',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
        backgroundColor:Colors.black,
      ),
      home: const MyHomePage(title: 'Gravity Films'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double phoneSize = 425;
    double tabletSize = 768;
    double LaptopSize = 1440;
    double padding = 500;
    if(screenSize.width<=phoneSize){
      padding = 0;
    }
    if(screenSize.width<tabletSize && screenSize.width>phoneSize){
      padding = 50;
    }
    if(screenSize.width>tabletSize && screenSize.width<LaptopSize){
      padding = 200;
    }
    //print(padding);
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Row(
          children: [
            SizedBox(width: 9,),
            Container(child:  SvgPicture.asset(
              "assets/gvt.svg",
              height: 40,
              width: 40,
            )),
            SizedBox(width: 9,),
            Text(widget.title)
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(100, 10, 100, 20),
                  child: Image.asset('assets/logo_big.png')),
              RichText(
                  softWrap:true,
                  textAlign:TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.white
                      ),
                      text: 'Sound | Camera | Action !\nVFX / GFX / SFX / Digital Marketing \nVisual Effects Filmmaking'
                  )
              ),
              Divider(
                height: 70,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.grey[900],
              ),
              Text(
                "Our Services",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
              ListTile(
                leading: Icon(Icons.auto_graph),
                title: Text('Digital Marketing Agency'),
              ),
              ListTile(
                leading: Icon(Icons.newspaper_outlined),
                title: Text('Press Release & Magazines'),
              ),
              ListTile(
                leading: Icon(Icons.video_camera_back_outlined),
                title: Text('Video Production'),
              ),
              ListTile(
                leading: Icon(Icons.music_note_outlined),
                title: Text('Music Production'),
              ),
              ListTile(
                leading: Icon(Icons.brush_outlined),
                title: Text('Nelson’s Art'),
              ),
              ListTile(
                leading: Icon(Icons.mode_edit_outline_sharp),
                title: Text('Graphic Design'),
              ),
              ListTile(
                leading: Icon(Icons.handshake),
                title: Text('Wedding & Events'),
              ),
              ListTile(
                leading: Icon(Icons.spa_rounded),
                title: Text('Commercial Branding'),
              ),
              SizedBox(height: 40,),
              Text(
                "This website is under Construction...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          _launchUrl("https://wa.me/919033535655");
          //launch("https://www.instagram.com/gravity.films_/");
          // final snackBar = SnackBar(
          //   content: const Text(
          //     'We are working on it...🫡',
          //     style: TextStyle(
          //       // color: Colors.white
          //     ),
          //   ),
          //   // backgroundColor: Colors.black26,
          //   action: SnackBarAction(
          //     label: 'Okay',
          //     onPressed: () async {
          //      await launch("https://www.instagram.com/gravity.films_/");
          //     },
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Contact Us',
        // backgroundColor: Colors.white,
        label: Text("Contact Now"),
        icon: const Icon(Icons.mark_chat_unread_sharp),
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
