import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  bool opacidade = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter: Primeiros Passos'),
          leading: Icon(Icons.add_task),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Color.fromARGB(255, 208, 221, 237),
            child: ListView(
              children: const [
                Padding(//aula 5.4
                  padding: EdgeInsets.only(top:8),
                  child: Tasks(
                      'Estudar Flutter',
                      'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                      3),
                ),
                Tasks(
                    'Andar de Bike',
                    'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                    2),
                Tasks(
                    'Ler 50 páginas',
                    'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                    1),
                Tasks(
                    'Meditar',
                    'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                    4),
                Tasks('Jogar',
                    'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 0),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          backgroundColor: Colors.blue[100],
          child: const Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Tasks(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int level = 1;

  void levelUp() {
    setState(() {
      level++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black12,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            height: 100,
                            width: 72,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Difficulty(widget.dificuldade),
                          // vai ser um novo componente.
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                            onPressed: levelUp,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0
                              ? ((level / widget.dificuldade) / 10)
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nivel: $level',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Difficulty extends StatelessWidget {
  final int dificulty;

  const Difficulty(this.dificulty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(//aula 5.4
      child: Row(
        children: [
          Icon(Icons.star,
              size: 15,
              color: (dificulty >= 1) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 15,
              color: (dificulty >= 2) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 15,
              color: (dificulty >= 3) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 15,
              color: (dificulty >= 4) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 15,
              color: (dificulty >= 5) ? Colors.blue : Colors.blue[100]),
        ],
      ),
    );
  }
}

