import 'package:flutter/material.dart';
import 'package:flutter_aplication/components/my_button.dart';
import 'package:flutter_aplication/components/my_textfield.dart';
import 'package:flutter_aplication/pages/home_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateReportPage extends StatefulWidget {
  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final addressController = TextEditingController();
  late String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0E1429),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset('lib/assets/images/logo.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Let's create a report!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: titleController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    labelText: "Title",
                    hintText: "Inform the title",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  MyTextField(
                    controller: descriptionController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    labelText: "Description",
                    hintText: "Inform the description",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: FormField(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Category',
                            errorText: state.hasError ? state.errorText : null,
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            fillColor: Colors.grey.shade200,
                            labelStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                            filled: true,
                          ),
                          isEmpty: selectedCategory.isEmpty,
                          child: DropdownButtonHideUnderline(
                            child: SizedBox(
                              width: double.infinity,
                              child: PopupMenuButton<String>(
                                onSelected: (String value) {
                                  state.didChange(value);
                                  setState(() {
                                    selectedCategory = value;
                                  });
                                },
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: 'Roubo',
                                      child: Text('Roubo'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Furto',
                                      child: Text('Furto'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Violência',
                                      child: Text('Violência'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Dano material',
                                      child: Text('Dano material'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Tráfico de drogas',
                                      child: Text('Tráfico de drogas'),
                                    ),
                                  ];
                                },
                                child: Text(selectedCategory),
                                offset: Offset(0, 32),
                                elevation: 4,
                                padding: EdgeInsets.zero,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      validator: (value) {
                        if (selectedCategory.isEmpty) {
                          return 'Select a category';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  MyTextField(
                    controller: addressController,
                    obscureText: false,
                    keyboardType: TextInputType.streetAddress,
                    labelText: "Address",
                    hintText: "Inform the address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          controller: dateController,
                          obscureText: false,
                          keyboardType: TextInputType.datetime,
                          labelText: "Date",
                          hintText: "Inform the date",
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '##/##/####')
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required field";
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: MyTextField(
                          controller: timeController,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          labelText: "Time",
                          hintText: "Inform the time",
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '##:##')
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required field";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    text: "Send Report",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
