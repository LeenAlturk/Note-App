import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class toast {
//   void showToast() {
//     Fluttertoast.showToast(
//       msg: " task added",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity:
//           ToastGravity.BOTTOM, // Position of the toast message on the screen
//       timeInSecForIosWeb:
//           1, // Time duration for which the toast message will be shown
//       backgroundColor: Colors.black, // Background color of the toast message
//       textColor: Colors.white, // Text color of the toast message
//       fontSize: 16.0, // Font size of the toast message
//     );
//   }
// }

///88
// class Toast {
//   static FToast fToast = FToast();

//   static void showToast(BuildContext context, String text) {
//     fToast.init(context);
//     Widget toast = Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               const Color(0x00000000).withOpacity(0.5),
//               const Color.fromARGB(0, 8, 8, 8).withOpacity(0.8),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 7),
//             child: Text(
//               text,
//               style: const TextStyle(color: Colors.white, fontSize: 22),
//             ),
//           ),
//         ),
//       ),
//     );

//     fToast.showToast(
//         child: toast,
//         positionedToastBuilder: (context, child) {
//           return Positioned(
//             bottom: 100.0,
//             left: 0,
//             right: 0,
//             child: child,
//           );
//         });
//   }
// }

class CustomToast {
  static FToast _fToast = FToast();

  static void showToast(BuildContext context, String text) {
    _fToast.init(context);
    Widget toast = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(0, 211, 35, 203).withOpacity(0.5),
              Color.fromARGB(0, 114, 4, 120).withOpacity(0.8),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ),
    );

    _fToast.showToast(
      child: toast,
      positionedToastBuilder: (context, child) {
        return Positioned(
          bottom: 100.0,
          left: 0,
          right: 0,
          child: child,
        );
      },
    );
  }
}
