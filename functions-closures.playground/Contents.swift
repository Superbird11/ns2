//: Playground - noun: a place where people can play

import UIKit


/*
*   Functions and Closures
*
* Apple's tutorial offers the following description of functions: "Functions are self-
* contained chunks of code that perform a specific task. You give a function a name that 
* identifies what it does, and this name is used to “call” the function to perform its task 
* when needed." In general, functions are very straightforward and work very similarly to how
* they do in other languages. I've used them in past playgrounds, but I'll go over syntax one
* more time.
*
* A function is preceded by the type ```func```, followed by the method name and then, in 
* parentheses, its arguments. The parentheses have to be there, like in C and Java, even if
* the function doesn't take any arguments. After that, the bulk of the function - what it
* does - is contained within the usual curly brackets.
*/

func myFunction () {
    print("This is a function.")
}

myFunction()

/*
* Functions can, like in other languages, take arguments. These go within the parentheses, 
* and are declared in the format ```variableName: VariableType```. Different declarations 
* are separated with parentheses. Functions in Swift can also, obviously, return variables
* of their own. Well, one variable, like most other languages. This variable is designated 
* by an arrow (```->```) immediately following the set of parentheses in which the arguments
* are declared, and followed by the type of variable the function returns. And though I did
* not demonstrate this fully, a simple designator in front of the declaration of each
* variable will serve as an External Variable Name, for easy access. And, finally, arguments
* can be assigned default values much the same way as in python, by simply setting them
* equal to a value in the method declaration.
*/

func addInts (firstNumber num1: Int, secondNumber num2: Int = 5) -> Int {
    let num3 = num1 + num2
    return num3
}

addInts(firstNumber:2)
addInts(firstNumber: 2,secondNumber: 7)


/*
* Program flow control also works as usual inside functions; ```break``` statements still
* exist for loops, and ```return``` statements will exit the function while bringing with
* them all the variables the function is supposed to return. As in other languages, 
* ```return``` can be used by itself without any arguments to exit a return-void function 
* on the spot.
*
* Functions also work with Tuples, Swift's wrapped variables that we covered a few posts ago.
* Tuples can be returned by a function, and can also function as arguments. Return statements
* can also be marked as optional with a question mark.
*/

func doMath (nums: (Int, Int)) -> (Int, Int)? {
    //returns the two numbers multiplied and then divided, but only if the quotient is an int.
    let multiplied = nums.0 * nums.1
    if(nums.0 % nums.1 == 0){
        let divided = nums.0 / nums.1
        return (multiplied, divided)
    }
    else{
        return nil
    }
}

var myNums = (3,4)
doMath(myNums)
myNums = (6,3)
doMath(myNums)

/*
* Closures
*
* Closures are similar to Blocks from Objective-C, in that they are self-contained snippets
* of code.  Closures are nearly identical in what can be done inside of them to functions; 
* however, *closures cannot access external variables*, even otherwise-global variables
* that its enclosing method might have access to. 
*
* There are two parts to using a closure: First, declaring a function to take a closure as
* an argument. This is done with the simple syntax 
* ```variableName: ( [Argument] -> [ReturnType] )```, in which Argument is the argument given
* to the closure (like the arguments of a function, this can be a tuple) and ReturnType is
* the type of variable the closure will return. 
*
* The actions the closure performs are instead designated when the enclosing method is called
* by a clienet. A closure is placed in the method call the same way as a normal variable, 
* inside a single set of curly brackets. The syntax is as follows:
* ```{ (var1: type1, var2: type2) -> returnType in ... }```. Inside the circle brackets are
* the arguments we decided on earlier when we declared what kind of closure would be inside
* our function. The return type is the same as before, too. The bulk of the method - what
* it's supposed to do - is what goes in the ```...``` above. The following example will be
* helpful:
*/

func performOperationOnNumber (num : Int, operation: (Int -> Int)) -> Int {
    //first argument is an Int, second is a Closure
    return operation(num)
}

performOperationOnNumber(5, { (x: Int) -> Int in
    return x * x } )
performOperationOnNumber(5, { (x: Int) -> Int in
    return 3*x })

/*
* So, in short, a closure is a custom method that can be passed to a function and executed by
* that function, that can change to meet the needs of any individual situation without having
* to create lots of different methods to handle every special situation. 
*
* There is also shorthand for making closures when calling the function they're part of. 
* Firstly, you can remove the variable types (e.g. change ```(x: Int)``` above to ```x```
* because, based on the closure declaration, the compiler knows what value type ```x```
* represents. Secondly, you can do away with the entire header of the function, leaving the 
* compiler to copy what it needs to from the declaration, and jump straight into the meat of
* the function, using ```$0```, ```$1```, etc. to designate usage of the first, second, etc. 
* declared argument in the closure. For example:
*/
performOperationOnNumber(5, {3*$0})
