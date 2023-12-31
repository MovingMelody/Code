// ignore_for_file: public_member_api_docs, sort_constructors_first, comment_references
// ignore_for_file: use_raw_strings, cascade_invocations, omit_local_variable_types

/*
* Created on 29 September 2023
* @author Sai Sumanth
*/

/*
              🎭 Polymorphism in Dart 🎭
Polymorphism is the ability of an object to take on many forms. 
As humans, we have the ability to take on many forms. 
We can be a student, a teacher, a parent, a friend...

Polymorphism, allows objects of different classes in the inheritance hierarchy 
to be treated as objects of a common superclass or interface.

*/

///
/// 1️⃣ Example
///
abstract class Animal {
  final int age;

  Animal({required this.age});

  // concrete method
  void makeSound() {
    print('Animal makes a sound.');
  }
}

/// concrete subclass
class Dog extends Animal {
  final String name;

  Dog({required this.name, required super.age});

  @override
  void makeSound() {
    /// 💡 Observe the Super keyword here
    super.makeSound();
    print('Dog barks.');
  }

  int get getDogLegsCount => 4;
}

void main() {
  // Polymorphism: Dog treated as an Animal
  final Animal myPet = Dog(age: 12, name: 'myPet');
  print(myPet.age); // prints 12
  myPet.makeSound(); // Calls Dog's makeSound method
  // myPet.getDogLegsCount; // ❌ he getter 'getDogLegsCount' isn't defined for the type 'Animal'
  // print(myPet.name); // ❌ The getter 'name' isn't defined for the type 'Animal'

  final Dog myDogPet = Dog(age: 10, name: 'myDogPet');
  // final myDogPetWithoutTypeAnnotation = Dog(); // ✅ Totally Valid, No need to specify type explicitly
  myDogPet.makeSound();
  print(myDogPet.getDogLegsCount);
  print(myDogPet.name);
  print(myDogPet.age);

  main2();
}

///
/// class Message
///
class Message {
  final String text;

  const Message({required this.text});
}

class ImageMessage extends Message {
  final String imageUrl;

  ///
  /// Unnamed constructor
  ///
  /// [Constructors] in Dart are not [inherited], so we give [ImageMessage] its own constructor,
  /// and it needs to accept two values labeled text and imageUrl.
  /// Since text is technically part of [Message], not [ImageMessage],
  /// we can't use automatic initialization for it, and we need to specify its type (String)
  /// so Dart doesn't accept just any type of value there.
  ///
  const ImageMessage({required super.text, required this.imageUrl});

  /// another way of creating unnamed constructor, Totally Valid ✅
  // const ImageMessage({required this.imageUrl, required String txt})
  //     : super(text: txt);

  /// Named constructor
  const ImageMessage.onlyMessage({required super.text}) : imageUrl = '';
}

void main2() {
  /// Message
  ///
  const msg1 = Message(text: 'hi');
  const imgMsg = ImageMessage(text: 'text', imageUrl: 'https://image.com');
  const Message imgMsg2 =
      ImageMessage(text: 'text', imageUrl: 'https://image.com');
  const emptyImageMessage = ImageMessage.onlyMessage(text: 'text');

  print(msg1.text);
  print(imgMsg.imageUrl + imgMsg.text);

  print(imgMsg2.text);
  // print(imgMsg2.imageUrl); // ❌ The getter 'imageUrl' isn't defined for the type 'Message'.

  print(emptyImageMessage.text + emptyImageMessage.imageUrl);

  // Example 2
  runShapeExample();

  // Example 3
  runHigherOrdersExample();

  // example 4
  runEmpExample();
}

///
/// 2️⃣ Example
///
abstract class Shape {
  ///
  /// abstract method
  ///
  /// Concrete subclass should override this method
  ///
  double area();

  /// mandatory to override this getter in concrete sub classes
  String get paintedColor;
}

class Circle extends Shape {
  final double radius;

  Circle({required this.radius});

  /// Achieving polymorphism by Method Overriding
  @override
  double area() {
    return 3.14 * radius * radius;
  }

  @override
  String get paintedColor => 'Red';
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle({required this.width, required this.height});

  @override
  double area() {
    return width * height;
  }

  @override
  String get paintedColor => 'Orange';
}

void runShapeExample() {
  final Shape circle =
      Circle(radius: 5); // Polymorphism: Circle treated as a Shape
  final Shape rectangle = Rectangle(
      width: 4, height: 6); // Polymorphism: Rectangle treated as a Shape

  print('Circle area: ${circle.area()}');
  print('Rectangle area: ${rectangle.area()}');

  // List type is Shape but allows Circle and Rectanle types (Polymorphism)
  final shapes = <Shape>[
    Circle(radius: 5),
    Rectangle(height: 4, width: 6),
  ];

  for (final shape in shapes) {
    print('Area: ${shape.area()}');
  }
}

///
/// 3️⃣ Example
///
class HigherOrderFunctions {
  static int add(int a, int b) {
    return a + b;
  }

  static int subtract(int a, int b) {
    return a - b;
  }

  static int calculate(int Function(int, int) operation, int x, int y) {
    return operation(x, y);
  }
}

void runHigherOrdersExample() {
  /// Polymorphism: Passing 'add' function
  final result1 =
      HigherOrderFunctions.calculate(HigherOrderFunctions.add, 5, 3);

  /// Polymorphism: Passing 'subtract' function
  final result2 =
      HigherOrderFunctions.calculate(HigherOrderFunctions.subtract, 8, 2);

  print('Result1: $result1'); // Output: Result1: 8
  print('Result2: $result2'); // Output: Result2: 6
}

///
/// 4️⃣ Example
///

/// Base class [BaseEmployee]
class BaseEmployee {
  void salary() {
    print('Employee Salary is ₹100');
  }
}

class WebDev extends BaseEmployee {
  @override
  void salary() {
    print("WebDev salary is ₹2000");
  }
}

class FlutterDev extends BaseEmployee {
  @override
  void salary() {
    print("Developer salary is ₹3000");
  }

  String get flutterFeatures => 'list of flutter features';
}

void runEmpExample() {
  final BaseEmployee emp1 = WebDev();
  final BaseEmployee emp2 = FlutterDev();

  final onlyFlutterDev = FlutterDev();
  print(onlyFlutterDev.flutterFeatures);

  emp1.salary();
  emp2.salary();
}
