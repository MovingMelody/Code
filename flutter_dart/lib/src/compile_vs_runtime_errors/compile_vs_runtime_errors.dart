// ignore_for_file: unused_local_variable, omit_local_variable_types, prefer_final_locals

/*
* Created on 13 August 2023
* 
* @author Sai Sumanth
*/

import 'dart:io';

///
/// Few examples for Compile Time Errors and Runtime Errors
///
void main(List<String> args) {
  int addNumbers(int a, int b) {
    return a + b;
  }

  ///
  /// **** COMPILE TIME ERRORS *****
  ///

  // 2 positional arguments expected by 'addNumbers', but 1 found.
  // Try adding the missing arguments.
  // addNumbers(5);

  // The body might complete normally, causing 'null' to be returned,
  // but the return type, 'int', is a potentially non-nullable type.
  // int getNumber() {}

  ///
  /// Type errors
  ///
  // A value of type 'String' can't be assigned to a variable of type 'int'.
  // int number = "42";

  int x1 = 10;
  String y1 = 'Hello';
  // The argument type 'int' can't be assigned to the parameter type 'String'.
  // var stringAdd = y1 + x1;
  // The argument type 'String' can't be assigned to the parameter type 'num'.
  // var intAdd = x1 + y1;
  // The argument type 'String' can't be assigned to the parameter type 'num'
  // print(x1 + y1);

  ///
  /// **** RUNTIME Errors ****
  ///
  /// Invalid cast
  ///
  const x = 10;
  const y = 'Hello';
  // type 'int' is not a subtype of type 'String' in type cast
  print(x as String); // This will cause an invalid cast error

  const str = 'string';
  // Invalid radix-10 number
  final val = int.parse(str);
  print(val);

  ///
  /// RangeError
  ///
  final list = List<int>.filled(4, 0);
  // RangeError (index): Invalid value: Not in inclusive range 0..3: 30
  final value = list[30];

  ///
  /// PathNotFoundException or File not Found
  ///
  final file = File('nonexistent.txt');
  // Unhandled exception: PathNotFoundException: Cannot open file,
  // path = 'nonexistent.txt' (OS Error: No such file or directory,
  final contents = file.readAsStringSync(); // File not found

  ///
  /// Infinite Loops:
  ///
  while (true) {
    print('This loop runs forever');
  }
}
