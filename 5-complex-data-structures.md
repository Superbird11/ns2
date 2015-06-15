# Complex Variable Types

(Sidenote: It might be better to read this from the playground. Nearly all of what is here
has been transcribed from there.

## Enumerated variables

In short, an enumerated variable is a variable with a set amount of possible values,
all of which have been enumerated prior to initialization.

As Enumerations are distinct variable types, they should always start with capital
letters. This can be seen in variable types like Int, Double, and String, as well as
class names in all languages.

Enumerations can also be tied to values, similarly to functions. These values are
actually tuples, so they can have as many subvalues and types as necessary.

## Structures (Structs)

Structs work differently from how they do in other languages - that is, in other languages
I've worked in, structs always functioned as a way to wrap several variables together in a
complex variable. However, in Swift, structs are treated just like classes, except without
a few vital functions.

Rather than say what structs have, I'm instead going to assume we all know what classes are
and say what structs don't have. What they don't have is polymorphism and inheritance -
there's no such thing as a substruct or superstruct, and structs cannot thus be typecasted
in the same way classes can. In addition, unlike classes, structs can only have a single
reference to any instance. If one struct is assigned to the value of another struct, the
values are copied, not the pointers. Think of it as passing by value rather than by 
reference. For example, 
```
var structB = structA
```
would create a new struct that was identical to the first struct, whereas 
```
var classB = classA 
```
would set classB's reference to point to classA. Thus, modifying class B in any way would
end up also modifying class A. This is very important. This is actually a general rule that
applies to value types, and despite their similar functionality to classes, **structs are
value types, not objects**. Classes are objects, and thus are still passed by reference,
as shown above.

Apple's Swift tutorial mentions one other difference (structs can't deinitialize to free
up data) but that isn't relevant to the level I expect to be programming at.

## Classes

Classes work exactly the same way they've always worked, actually. Well, not exactly -
gone are the necessary typeless constructors of C and Java and the self-returning
initialization functions of Objective-C. You can still make a return-void initialization
function if you want to, and for several purposes it's still a very good idea, but 
variables can now be given distinct values as they are declared within the class. This
works in exactly the same way as a struct; in fact, struct and class notation are essentially
identical; classes' difference comes only from functionality.

Superclassing, subclassing, polymorphism, and inheritance also works the same way as it
does in other languages. Syntax for inheritance is, somewhat surprisingly, exactly the 
same as it is in Objective-C - that is, ``` class Subclass : Superclass { ```.

Like in other languages, variable and method names are lower camel case, while struct and
class names are upper camel case.

*Fun Fact*: Strings, Arrays, and Dictionaries are defined as structures, while their 
Foundation equivalents NSString, NSArray, and NSDictionary are defined as classes. This is
very useful to know, as there may be times it is wise to use one over the other.

### The Triple-Equals Operator

Relating to the above, Swift has introduced a new operator: the triple-equals (``` === ```). It
is a boolean operator, just like the double-equals, except rather than checking if both
sides are equal, it checks if both sides are identical. In other words, double-equals 
compares the total values of both sides and compares them, while triple equals checks 
whether they're actually the same. Triple equals can only be applied to objects; otherwise
it causes a compile-time error. Similarly, don't use double-equal with objects; use a 
``` compare ``` function or check specific values instead.





