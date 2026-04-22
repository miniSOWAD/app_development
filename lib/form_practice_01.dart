import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlassUI(),
    );
  }
}

class GlassUI extends StatefulWidget {
  const GlassUI({super.key});

  @override
  State<GlassUI> createState() => _GlassUIState();
}

class _GlassUIState extends State<GlassUI> {
  final _formKey = GlobalKey<FormState>();

  String name="", roll="", reg="", phone="", about="";
  String? blood, gender, place;

  Map data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 248, 179, 90), Color.fromARGB(255, 24, 214, 252)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                ///GLASS CARD
                Container(
                  constraints: const BoxConstraints(maxWidth: 420),
                  margin: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.25),
                              Colors.white.withOpacity(0.05)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            )
                          ],
                        ),

                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [

                              const Text(
                                "Student Form",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 20),

                              input("Name", (v)=>name=v),
                              input("Roll", (v)=>roll=v),
                              input("Registration", (v)=>reg=v),

                              dropdown("Blood Group", blood,
                                  ["A+","B+","O+","AB+","A-","B-","O-","AB-"],
                                      (v)=>blood=v),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Expanded(child: dropdown("Gender", gender,
                                      ["Male","Female"],
                                          (v)=>gender=v)),
                                  const SizedBox(width: 10),
                                  Expanded(child: dropdown("Place", place,
                                      ["Dhaka","Sylhet","Chittagong","Rajshahi","Khulna","Barishal","Rangpur","Mymensingh"],
                                          (v)=>place=v)),
                                ],
                              ),

                              input("Phone", (v)=>phone=v),
                              input("About Me", (v)=>about=v, maxLines: 2),

                              const SizedBox(height: 20),

                              /// BUTTON
                              GestureDetector(
                                onTap: (){
                                  if(_formKey.currentState!.validate()){
                                    setState(() {
                                      data = {
                                        "Name": name,
                                        "Roll": roll,
                                        "Reg": reg,
                                        "Blood": blood!,
                                        "Gender": gender!,
                                        "Place": place!,
                                        "Phone": phone,
                                        "About": about,
                                      };
                                    });
                                    _formKey.currentState!.reset();
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                      colors: [Color.fromARGB(255, 187, 243, 255), Color.fromARGB(255, 255, 214, 51)],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(255, 215, 243, 33).withOpacity(0.5),
                                        blurRadius: 15,
                                        offset: const Offset(0,5),
                                      )
                                    ],
                                  ),
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// OUTPUT CARD
                if(data.isNotEmpty)
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    margin: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.3)),
                          ),
                          child: Column(
                            children: data.entries.map<Widget>((e){
                              return Text(
                                "${e.key}: ${e.value}",
                                style: const TextStyle(color: Colors.white),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget input(String label, Function(String) onChanged,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        maxLines: maxLines,
        onChanged: onChanged,
        validator: (v)=>v!.isEmpty ? "Enter $label" : null,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget dropdown(String hint, String? value, List<String> items,
      Function(String?) onChanged) {
    return DropdownButtonFormField(
      value: value,
      hint: Text(hint, style: const TextStyle(color: Colors.white70)),
      dropdownColor: const Color.fromARGB(221, 4, 172, 178),
      items: items.map((e)=>DropdownMenuItem(
        value: e,
        child: Text(e, style: const TextStyle(color: Colors.white)),
      )).toList(),
      onChanged: onChanged,
      validator: (v)=>v==null ? "Select $hint" : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
