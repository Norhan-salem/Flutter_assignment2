import 'package:flutter/material.dart';
import 'package:session3/constants/asset_data.dart';
import 'package:session3/screens/todo_home_page.dart';
import 'package:session3/util/validators.dart';
import 'package:session3/widgets/input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {

  final _formKey = GlobalKey<FormState>();
  final _taskTitleController = TextEditingController();
  final _todoController = TextEditingController();

  List<TextEditingController> _controllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context,
                '/todolist'); // This line will navigate to the previous page
          },
        ),
        title: Text('Create Task'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InputField(
                  controller: _taskTitleController,
                  hintText: 'Task title',
                  prefix: Container(
                      child: SvgPicture.asset('lib/constants/svgs/title.svg',
                          fit: BoxFit.scaleDown)),
                  validator: (String? input) =>
                      Validators.checkLengthValidator(input, 3),
                ),
                const SizedBox(height: 15),
                const Divider(color: AssetData.subtextColor),
                const SizedBox(height: 15),
                const Text(
                  'ToDos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ..._controllers.map((controller) =>
                    Column(
                      children: [
                        InputField(
                          controller: controller,
                          hintText: 'Todo ${_controllers.indexOf(controller) + 1}',
                          prefix: Container(child: SvgPicture.asset(
                              'lib/constants/svgs/clipboard.svg',
                              fit: BoxFit.scaleDown)),
                          suffix: IconButton(
                            icon: const Icon(Icons.cancel_outlined,
                              color: AssetData.crossColor,),
                            onPressed: () {
                              setState(() {
                                _controllers.remove(controller);
                              });
                            },
                          ),
                          validator: (String? input) =>
                              Validators.checkLengthValidator(input, 3),
                        ),
                        SizedBox(height: 10),
                      ],
                    )).toList(),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AssetData.secondaryColor, // This makes the button blue
                      maximumSize: Size(200, 60), // This makes the button wider
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // This centers the row contents
                      children: [
                        SvgPicture.asset('lib/constants/svgs/plus.svg', fit: BoxFit.scaleDown), // Replace with your plus sign SVG
                        SizedBox(width: 10), // This adds some spacing between the icon and the text
                        Text('Add', style: TextStyle( fontSize: 18, color: Colors.white)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        _controllers.add(TextEditingController());
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        // The button for some reason won't appear as a circle even though that's the default :( :(
        // I tried wrapping it in a container and changing the borderRadius it didn't work
        floatingActionButton:
          FloatingActionButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // If the form is valid, navigate to the new page and pass the data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoHomePage(
                      title: _taskTitleController.text,
                      todos: _controllers.map((controller) => controller.text).toList(),
                    ),
                  ),
                );
              }
            },
            backgroundColor: AssetData.secondaryColor,
            child: Icon(Icons.check),
          ),

    );


  }
}