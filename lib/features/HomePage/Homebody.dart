import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/ColorsName.dart';
import '../../core/databasessqlf.dart';
import '../../core/textfiledwidget.dart';

class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  int selectedIndex = 1;
  List<Map<String, dynamic>> notesList = [];
  final DataBaseSql datab = DataBaseSql();
  final TextEditingController taskController = TextEditingController();
  final TextEditingController decController = TextEditingController();

  List<DateTime> generateWeekDates() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  void initState() {
    super.initState();
    fetchNote();
  }

  Future fetchNote() async {
    final data = await datab.getAllNotes();
    setState(() {
      notesList = data;
    });
  }

  Future deleteNote(int id) async {
    await datab.deleteData(id);
    fetchNote();
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> weekDates = generateWeekDates();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                color: Colors.purple[100],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Today",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weekDates.length,
                      itemBuilder: (context, index) {
                        DateTime date = weekDates[index];
                        bool isSelected = index == selectedIndex;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.purple[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.E().format(date),
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.purple
                                          : Colors.purple[200],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      DateFormat.d().format(date),
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            notesList.isEmpty
                ? Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Image.asset("assets/images/HomeScreen.png"),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 70,
                          width: 280,
                          decoration: BoxDecoration(
                              color: ColorManger.purple,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(notesList[index]['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(notesList[index]['content']),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await deleteNote(notesList[index]['id']);
                                    },
                                    icon: Container(
                                        decoration: BoxDecoration(
                                          color: ColorManger.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: Icon(Icons.done,
                                            color: Colors.black)))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: ColorManger.purple,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "New Task",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Click to change the emoji",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManger.white,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    contentText(
                      hint: "Task Name",
                      controller: taskController,
                      returnCond: "",
                      cond: "",
                    ),
                    const SizedBox(height: 10),
                    contentText(
                      hint: "Describe",
                      controller: decController,
                      returnCond: "",
                      cond: "",
                    ),
                  ],
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManger.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 20,
                        ),
                        onPressed: () {
                          datab.insertData({
                            'title': taskController.text,
                            'content': decController.text,
                          });
                          fetchNote();
                          taskController.clear();
                          decController.clear();
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Add",
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
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.black),
        elevation: 20,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      ),
    );
  }
}
