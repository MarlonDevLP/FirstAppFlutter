import 'package:emulador_flutter/components/difficulty.dart';
import 'package:emulador_flutter/data/task_dao.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  int nivel = 0;

  Task(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);



  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: widget.nivel <= 10 ? Colors.blue : Colors.green),
            // opacity: opacidade ? 1.0 : 0.0,
            width: 360,
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white),
                width: 360,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Difficulty(difficultLevel: widget.dificuldade),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 9.0),
                      child: SizedBox(
                        width: 70,
                        height: 50,
                        child: ElevatedButton(
                          onLongPress: () {
                            TaskDao().delete(widget.nome);
                          },
                          onPressed: () {
                            setState(
                              () {
                                widget.nivel++;
                              },
                            );
                            //print(nivel);
                          },
                          child: Container(
                            alignment: AlignmentDirectional.topEnd,
                            child: const Column(
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  "nvl",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
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
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 200,
                      height: 6,
                      child: LinearProgressIndicator(
                        color: (Colors.black54),
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível: ${widget.nivel}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
