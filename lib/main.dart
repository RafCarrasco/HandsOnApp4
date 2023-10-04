import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageUrl = '';
  bool isImageDisplayed = false;

  void _resetImage() {
    setState(() {
      imageUrl = '';
      isImageDisplayed = false;
    });
  }

  void _setImageFromNetwork() {
    setState(() {
      imageUrl = 'https://avatars.githubusercontent.com/u/110987163?s=96&v=4';
      isImageDisplayed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Imagens + Stateful Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _setImageFromNetwork();
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                strokeCap: StrokeCap.square,
                dashPattern: const [8, 8],
                color: const Color.fromARGB(255, 49, 47, 47),
                strokeWidth: 2,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.circular(10), 
                  ),
                  child: Stack(
                 
                    children: [
                      Center(
                        child: isImageDisplayed
                            ? Image.network(
                                imageUrl,
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                child: const Center(
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Visibility(
                        visible:
                            !isImageDisplayed, 
                        child: const Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Adicionar Imagem',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold, 
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
                onPressed: () {
                  _resetImage();
                },
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.fromLTRB(60, 30, 60, 30))),
                child: const Text('Resetar Imagem')),
          ],
        ),
      ),
    );
  }
}
