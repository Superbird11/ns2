# Data Structures in Swift

This post will be focusing on tuples, arrays, and dictionaries, although other data 
structures such as sets also exist. Of these, arrays have been present in programming
for a long time - at least since the development of C, and probably before that (I'm a 
little rusty on my history). Dictionaries were part of Objective-C, which is the language
I'm most familiar with, and tuples are becoming more and more common in newer languages 
such as python. In particular, one of the large differences I'm seeing in Swift
from Objective-C is that *it's not C-derived any more*. Objective-C had very clear
influences from its mother language, and actually maintained almost all primitive C
functionality, from arrays to functions, in addition to what it built on top of that. You
could still use simple bracketed arrays, even though the language encouraged use of the
```NSArray``` objects, as well as old-style functions in the form of  
```int function(int var1, int var2)```  
rather than Objective-C's  
```- (int) function: (int) var1 withVariable: (int) var2```.  
Other than syntax, 
however, Swift's method declarations are similar in structure to those of Objective-C.  

## Tuples

Tuples are the most basic of the data structures we'll be focusing on today. A tuple is,
in essence, nothing more than several variables bound together. They can serve a similar
purpose to structs, if need be, but structs still exist and tuples are better used for
functions and data movement. In particular, tuples allow functions to return more than
one variable, which has always been somewhat of a limitation of other languages. Of the
languages I've dabbled in, python is the one that has almost the exact same feature,
allowing method declarations as, for example, ```int,int swap(int a, int b)```. 
Swift does something similar - a tuple is designated by wrapping the variables you want
to put in a tuple together in parenthesis - for example, ```(Int, Int)``` is a
duple of integers, and a ```(String, Double, Int, Int)``` would be a quadruple of
a string, a double, and two integers. The utility of the functionality is shown in my
playground's ```swap``` function, which is utilized in many different sorting 
algorithms (such as Bubble Sort, Switch Sort, and Gnome Sort) that are not Quicksort. 
While a swap function is easy to do in three lines
		var temp = a;
		a = b;
		b = temp;
the usage of tuples allows it to be done in only one line, and, if we're being honest,
removes the need to actually create a method for it.  

## Arrays

Arrays have been a staple of programming languages for a long time, and the way Swift
handles them is reminiscent of a slightly clunkier python. They still work the same way
they always have, though - *an array is an ordered collection of objects or values*. 
While the ```NSArray``` class still exists in Swift, along with all its functionalities, arrays
are no longer relegated to antiquity as they were in Objective-C; most importantly, 
arrays are now mutable. While I would still use ```NSArray```s if, for some reason,
I needed to put several objects of different types into an array, elementary arrays are
now much easier to use.   

At a glance, Swift arrays work similarly to ArrayLists in Java - they are mutable, but
must be typed at initialization. The declaration of an array in Swift is as easy as 
bracketing the variable type it will contain - for example, ```[Int]``` is an 
array of integers, and ```[String]``` would be an array of strings. This functionality
can also be used with objects. 2-dimensional arrays can also be created - for example,
```[[Int]]``` is a two-dimensional array of integers. When initialized without any
values, arrays must be followed by a blank set of parenthesis, like so:
```var myArray = [Int]()```, but they can be pre-initialized with a very simple
notation: ```var myArray = [1,2,3,4,5]```.   

Getting things out of an array is as simple as saying ```myArray[index]```, the
same way as you would in C - there's no need for ```myArray.get(index)``` or 
```[myArray objectAtIndex: index]```. There are a few built-in functions for arrays,
like ```myArray.count```, which returns the number of elements in the array, as well
as ```myArray.append(item)``` and ```myArray.insert(item, atIndex: index)```,
both of which are fairly self-explanatory. I have demonstrated all of this functionality
in my Swift playground within the various swap functions I put there and in the testing
zone at the bottom where all the code is executed.  

## Dictionaries

Dictionaries are a data type I was introduced to in Objective-C and ended up never using,
simply because the situation never called for it.
They are, however, very easy thing to understand - they work just like real dictionaries.
You have your key, corresponding to the word in the dictionary, and then you have an
associated value, which is the dictionary entry. A dictionary is created with the syntax  
```var myDict = [String : String]()``` –  
the similarities to arrays in this respect
are apparent and I won't go into the obvious. What's important here is what's within the
brackets. Like Arrays, Dictionaries need to be typed upon initialization - the keys must 
be a single variable type and the entries must be a single variable type, although they do
not have to be the same type - Something like ```[Int : Double]``` is perfectly 
possible to do. Dictionaries can also be initialized with values in the same way as arrays:  
```var myDict = [key1:entry1, key2:entry2, key3:entry3]```.  

You can get the count of a dictionary with the same ```count``` function as with arrays. The function
```updateValue(entry, forKey: key)``` will change an entry in the dictionary, or
create a new one if the given key doesn't already exist. You can determine if a dictionary
key is valid with the boolean function ```indexForKey(key)```, which returns either
the integer index of the key if it exists, or ```nil``` if it doesn't. Finally, 
accessing the entry for a given key is as simple as ```myDict[key]```.  

The usefulness Dictionaries have is that they're better for storing data that needs to go
together - they have very specific uses. They also gain versatility in the fact that 
arrays or other dictionaries can serve as entries, and nesting them can provide more options
for data storage. Dictionaries do, of course, work with objects, but also do keep in mind
that the more traditional ```NSDictionary``` class that existed in Objective-C is
still an option if it would be easier to use.  