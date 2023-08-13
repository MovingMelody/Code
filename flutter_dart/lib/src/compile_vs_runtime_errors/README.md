\*

Created on 13 August 2023

@author Sai Sumanth

\*

Compile time errors in Dart are errors that are detected by the Dart compiler during the process of converting your source code into machine-readable instructions. These errors occur due to violations of the language's syntax rules, type requirements, or other constraints that the compiler enforces.

1. **Syntax Errors:**
   These errors occur when the code does not follow the correct syntax of the Dart language.

   ```dart
   print("Hello, World"  // Missing closing parenthesis
   ```

2. **Missing Semicolons:**
   Dart requires semicolons at the end of statements. Omitting them leads to a compile time error.

   ```dart
   int x = 10  // Missing semicolon
   ```

3. **Undefined Variables:**
   Trying to use a variable that hasn't been declared or is out of scope.

   ```dart
   print(y);  // y is not defined
   ```

4. **Type Mismatches:**
   Assigning a value of one type to a variable of another incompatible type.

   ```dart
   int number = "42";  // String assigned to an int variable
   ```

5. **Missing Import Statements:**
   If you try to use a class from another library without importing it, the Dart compiler will throw an error.

   ```dart
   DateTime now = DateTime.now();  // Requires an import statement for the DateTime class
   ```

6. **Unreachable Code:**
   Code that will never be executed due to conditional logic or other constraints.

   ```dart
   bool condition = false;
   if (condition) {
       print("This will never be printed");
   }
   ```

7. **Missing Return Statement:**
   If a function has a non-void return type, it must return a value of that type.

   ```dart
   int getNumber() {}  // Missing return value
   ```

8. **Incorrect Function Calls:**
   Calling a function with the wrong number or type of arguments.

   ```dart
   int addNumbers(int a, int b) {
       return a + b;
   }

   addNumbers(5);  // Incorrect number of arguments
   ```

RUNTIME Errors will be detected by 'Dart Program Runtime'. These are the Problems that cannot be detected by the compiler, such as division by zero, accessing a nonexistent variable, or an invalid cast

1. **Invalid Cast:**

```dart
const x = 10;
const y = 'Hello';
// type 'int' is not a subtype of type 'String' in type cast
print(x as String); // This will cause an invalid cast error

const str = 'string';
// Invalid radix-10 number
final val = int.parse(str);
print(val);
```

2. **Range Errors**

```dart
final list = List<int>.filled(4, 0);
// RangeError (index): Invalid value: Not in inclusive range 0..3: 30
final value = list[30];
```

3. **PathNotFoundException or File not Found**

```dart
final file = File('nonexistent.txt');
// Unhandled exception: PathNotFoundException: Cannot open file,
// path = 'nonexistent.txt' (OS Error: No such file or directory)
final contents = file.readAsStringSync(); // File not found
```

4. **Infinite Loops:**

```dart
while (true) {
print('This loop runs forever');
}
```
