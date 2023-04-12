import 'package:flutter/material.dart';
import 'package:flutter_aplication/components/my_button.dart';
import 'package:flutter_aplication/components/my_textfield.dart';
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
                  MyTextField(
                    controller: categoryController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    labelText: "Category",
                    hintText: "Inform the category",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
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
                  MyTextField(
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
                  SizedBox(height: 16),
                  MyTextField(
                    controller: timeController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    labelText: "Time",
                    hintText: "Inform the time",
                    inputFormatters: [MaskTextInputFormatter(mask: '##:##')],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: () {},
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
