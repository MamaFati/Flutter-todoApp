```
body: Center(
        child: TextField(
          controller: myController,
        ),
      ),
```

TextField comes with controller

```
  TextEditingController myController = TextEditingController();
```

This will get the user input
These are the codes to get user input and display their output

```
  // #### TextFeild controller to get acess to user input
  TextEditingController myController = TextEditingController();
  // GreetingsMessage
  String greatingMessage = "";
  // Greatuser
  void greatuser() {
    String userName = myController.text;
    setState(() {
      greatingMessage = "Hello : " + userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Greetings message
              Text(greatingMessage),
              // TextFeild
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // The hint text works like a placeholder
                    hintText: " Fnter Your Name ",
                  ),
                ),
              ),
              // Buttom
              ElevatedButton(
                onPressed: greatuser,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Tap",
                    style: TextStyle(color: Colors.white),

                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                ),
              ),
            ],
            // Buttom
          ),
        ),
      ),
    );
  }


```

########################
TODO APP section
#####################
TODO APP
A simple and elegant todo application built with Flutter and Hive for local storage.

# Introduction

This project is a simple todo application that allows users to manage their tasks efficiently. It uses Hive for local storage and Google Fonts for a custom look.

## Features

1.  Add, update, and delete tasks
2.  Persistent storage using Hive
3.  Custom fonts with Google Fonts

# Getting Started

Follow these instructions to set up the project on your local machine for development and testing purposes.

## Prerequisites

Ensure you have the following software and tools installed:
  Flutter SDK
  Android Studio or Visual Studio Code
  An Android/iOS device or emulator

## Installation
Step-by-step guide to install and set up the project:
  i. Clone the repository:
  ```
  git clone https://github.com/MamaFati/Flutter-todoApp.git

  ```
  ii. Navigate to the project directory:
  ```
  cd Flutter-todoApp

  ```
  iii. Install dependencies:
  ```
  flutter pub get

  ```
  iv. Run the app:
  ```
  flutter run

  ```

# Usage
Once the project is set up, you can use the app to manage your todos. Add new tasks, update existing ones, and delete tasks you no longer need.