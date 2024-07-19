# vertex

A new Flutter project.

## Getting Started

This project is a starting point for a VertexAi Flutter application.

## How to run

To run the project, you need to have Flutter installed on your machine. If you don't have it installed.
You also need to setup a firebase project or connect the existing one.
To make VertexAi work, you need to enable it in Google Cloud and setup billing for it. 

### Set up a Firebase project
1. Sign into the Firebase console.

2. Click Create project, and then use either of the following options:

    Option 1: Create a wholly new Firebase project (and its underlying Google Cloud project automatically) by entering a new project name in the first step of the "Create project" workflow.
    
    Option 2: "Add Firebase" to an existing Google Cloud project by selecting your Google Cloud project name from the drop-down menu in the first step of the "Create project" workflow.

    Note that when prompted, you do not need to set up Google Analytics to use the Vertex AI for Firebase SDKs.

3. In the Firebase console, go to the Build with Gemini page, and then click the second card to launch a workflow that helps you do the following tasks. If you see a tab in the console for Vertex AI, then these tasks are complete.

    Upgrade your project to use the Blaze pay-as-you-go pricing plan.

    Enable the following two APIs for your project:
    aiplatform.googleapis.com and firebaseml.googleapis.com.

### Connect your app to Firebase
1. Install the required command line tools:

    If you haven't already, install the Firebase CLI.
    
    Log into Firebase using your Google Account by running the following command:

```firebase login```

   Install the FlutterFire CLI by running the following command from any directory:

```dart pub global activate flutterfire_cli```

2.Configure your apps to use Firebase:

Use the FlutterFire CLI to configure your Flutter apps to connect to Firebase.

From your Flutter project directory, run the following command to start the app configuration workflow:

```flutterfire configure```



![Video Preview](video/vertex-ai.mp4)