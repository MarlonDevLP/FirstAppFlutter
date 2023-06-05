import 'package:emulador_flutter/data/database.dart';
import 'package:emulador_flutter/components/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT ) ';
  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    print('Iniciando o Save');
    final Database bancoDedados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa não existe');
      return await bancoDedados.insert(_tablename, taskMap);
    } else {
      print('s tarefa já exite');
      return await bancoDedados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo Trefa em Map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de tarefas : $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList( result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('convertend to list');
    final List<Task> tarefas =
        []; //agora temos que adicionar pre nossa lista de tarefa os  <map> tranformados  em tarefas
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      //verifica cada linha Map
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('lista de tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(
    String nomeTarefa,
  ) async {
    print('Acessando find:');
    final Database banDeDados = await getDatabase();
    List<Map<String, dynamic>> result = await banDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeTarefa]);
    print('tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
