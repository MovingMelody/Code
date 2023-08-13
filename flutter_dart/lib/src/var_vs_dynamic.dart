/*
* Created on 13 August 2023
* 
* @author Sai Sumanth
*/

///
/// Var vs Dynamic in Dart
///
void main(List<String> args) {
  ///
  /// No need to specify the type explicitly for variables declared using var or dynamic keywords
  ///
  /// The var keyword is used for type inference. When you declare a variable using var,
  /// the Dart compiler infers the type of that variable based on the assigned value.
  /// Once the type is inferred, the variable's type becomes fixed and cannot be changed.
  ///
  var score = 99;
  score = 98;
  score = 67;
  score = 100;

  // A value of type 'String' can't be assigned to a variable of type 'int'.
  // score = 'hundred'; not allowed. Error
  print('var variable score value : $score'); // 100

  ///
  /// Type inference concept isn't applicable for variables declared with dynamic keyword.
  /// Type can be changed at runtime.
  ///
  /// So the usage of dynamic should be minimized unless you're dealing with situations where
  /// dynamic typing is absolutely necessary.
  ///
  dynamic userInput = 43;
  print(userInput.runtimeType); // int

  userInput = 'forty three'; // Type changed to String
  print(userInput.runtimeType); // String

  print('User entered : $userInput');
}
