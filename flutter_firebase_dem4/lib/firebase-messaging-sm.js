// importScripts(
//   "https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js"
// );
// importScripts(
//   "https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js"
// );

// // todo Copy/paste firebaseConfig from Firebase Console
// const firebaseConfig = {
//   apiKey: "AIzaSyCXwXlUYS9HDopAwSJfXoqpRB2N5OooAyM",
//   authDomain: "login-register-firebase-d7462.firebaseapp.com",
//   projectId: "login-register-firebase-d7462",
//   storageBucket: "login-register-firebase-d7462.appspot.com",
//   messagingSenderId: "1048741213886",
//   appId: "1:1048741213886:web:d32b72e8017bb13f4350ef",
// };

// firebase.initializeApp(firebaseConfig);
// const messaging = firebase.messaging();

// // todo Set up background message handler

import { initializeApp } from "firebase/app";
import { getMessaging } from "firebase/messaging/sw";

// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object
const firebaseApp = initializeApp({
  apiKey: "AIzaSyCXwXlUYS9HDopAwSJfXoqpRB2N5OooAyM",
  authDomain: "login-register-firebase-d7462.firebaseapp.com",
  projectId: "login-register-firebase-d7462",
  storageBucket: "login-register-firebase-d7462.appspot.com",
  messagingSenderId: "1048741213886",
  appId: "1:1048741213886:web:d32b72e8017bb13f4350ef",
});

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
const messaging = getMessaging(firebaseApp);
