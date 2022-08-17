import 'package:apiclassonline/services/get_users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/add_users.dart';
import '../services/delete_users.dart';
import '../services/updated_users.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 93, 169),
        title: Text("CRUD API INTEGERATION",
        style: GoogleFonts.belleza(fontSize: 20, fontWeight: FontWeight.bold),
        ),centerTitle: true,
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, AsyncSnapshot snapshot) {
           if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
            itemCount: snapshot.data.data.length,
            itemBuilder:  (context, index) {
              return ListTile(
                    title: Text(snapshot.data.data[index].name, 
                    style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                    leading: Text("${snapshot.data.data[index].id}",
                    style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                deleteUser(id: snapshot.data.data[index].id);
                              });
                            },
                            icon: const Icon(Icons.delete, color: Colors.red,),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                updateUserData(
                                    context: context,
                                    data: snapshot.data,
                                    index: index);
                              });
                            },
                            icon: const Icon(Icons.edit, color: Colors.blue,),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
          floatingActionButton: FloatingActionButton(
           onPressed: () {
              setState(() {
              AddUserData(context: context);
           });
         },
        child: const Icon(Icons.add),
        ));
        }
  }
