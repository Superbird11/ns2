//: Playground - noun: a place where people can play

import UIKit

/*
* This basic swap function demonstrates a tuple, which is little more than several
* variables wrapped together and moved around at the same time. A tuple is created
* by wrapping two variable types in parenthesis, such as the (Int, Int) below - that
* represents a tuple of two integers. Tuples are used similarly to how they are in
* Python; in this case, it allows the function to return two variables instead of 
* one.
*/
func swap (num1: Int, num2: Int) -> (Int, Int) {
    return (num2, num1)
}

/*
* The following function is meant to demonstrate how dictionary data structures
* work. Their notation is illustrated as the parameter, and the usage of searching
* for keys and the requisite determination of the object for each key is also
* demonstrated in a stupid little useless function.
*/
func verifyDictionary (dict: [String : Int]) -> Bool {
    //returns TRUE if this dictionary contains the key "three" matched to the integer 3
    //return FALSE otherwise.
    if let x = dict["Three"] {
        if(x == 3) {
            return true;
        }
    }
    return false;
}

/*
* In Swift, functions are created as follows:
* func denotes a function. Follow it with its name. In parenthesis, state variable
* classifications and corresponding types (for example, the parameter "array" in the
* function below is of type Integer Array). Follow the parentheses with an arrow, 
* and then the type of variable the function will return.
*/
func quicksort (array:[Int]) -> [Int] {
    // Sorts this array from lowest value to highest value, with efficiency O(nlog(n)).
    if(array.count <= 1){
        return array
    }
    var smaller = [Int]()
    var larger = [Int]()
    // for statements work mostly how they do in Python. Mostly it's shorthand.
    for a in array[1...(array.count-1)] {
        if(a <= array[0]){
            smaller.append(a) }
        else{
            larger.append(a) }
    }
    return quicksort(smaller) + [array[0]] + quicksort(larger)
}

///The following are a bunch of sorting algorithms.
func bubblesort (arr:[Int]) -> [Int] {
    // Sorts this array from lowest to highest, with efficiency O(n^2)
    var array = arr
    for a in 0...(array.count - 2) {
        for b in a...(array.count - 1) {
            if(array[b] < array[a]){
                (array[a],array[b]) = swap(array[a],array[b])
            }
        }
    }
    return array
}

func gnomesort (arr:[Int]) -> [Int] {
    // Sorts this array from lowest to highest, with efficiency O(n^2)
    var array = arr
    var a = 0;
    while (a < array.count - 1) {
        if(array[a+1] < array[a]) {
            (array[a+1],array[a]) = swap(array[a+1],array[a])
            a--
            if(a < 0) { a = 0 }
        }
        else { a++ }
    }
    return array
}

func selectionsort (arr:[Int]) -> [Int] {
    //sorts this array from lowest to highest, with efficiency O(n^2)
    var array = arr
    var final = [Int]()
    while (array.count > 0) {
        var lowest = array[0]
        var lowestIndex = 0
        for a in 1...(array.count) {
            if(array[a] < lowest) {
                lowest = array[a]
                lowestIndex = a
            }
        }
        final.append(lowest)
        array.removeAtIndex(lowestIndex)
    }
    return final
}

func insertionsort (arr:[Int]) -> [Int] {
    //sorts this array from lowest to highest, with efficiency O(n^2)
    var array = [Int]()
    if (!arr.isEmpty) { array.append(arr[0]) }
    for a in arr[1...(arr.count - 1)] {
        var hasInserted = false
        for b in 0...(array.count - 1) {
            if (array[b] > a) {
                array.insert(a,atIndex: b)
            }
        }
    }
    return array
}

func switchsort (arr:[Int]) -> [Int] {
    //sorts this array from lowest to highest, with efficiency O(n^2)
    var array = arr
    for a in 0...(array.count - 2) {
        var lowest = array[a]
        var lowestIndex = a
        for b in a...(array.count - 1) {
            if(array[b] < lowest) {
                lowest = array[b]
                lowestIndex = b
            }
        }
        if(lowestIndex != a) {
            (array[a], array[lowestIndex]) = swap(array[a],array[lowestIndex])
        }
    }
    return array
}

func luckysort (arr:[Int]) -> [Int] {
    //The most efficient sorting algorithm, with efficiency O(0)
    //you're so lucky, the array is already sorted!
    return arr
}

//I debated putting taco sort here but that would be terrible
///the sorting algorithms end here.


//demonstration of the swap function
var a = 1, b = 5;
println(a);
println(b);
(a,b) = swap(a,b); //this line uses a tuple.
println(a);
println(b);


//demonstration of dictionaries
var myDict = ["One":1, "Two":2, "Three":3,"Four":4];
myDict.updateValue(5, forKey: "Five")
println(myDict)
println(verifyDictionary(myDict))
myDict = ["One":3, "Two":1, "Three":4, "Four":2];
println(verifyDictionary(myDict))


//demonstration of arrays
var myArray = [5,2,7,8,4,2,3,9,7,3,4,6,7,10,1]
println(myArray) //before sorting
myArray = quicksort(myArray)
println(myArray) //after sorting


//demonstration of 2-D arrays
var My2DArray = [[Int]]()
My2DArray = [[5,2,7,8,4,2,3,9,7,3,4,6,7,10,1],
                 [9,3,6,7,1,5,8,4,2,10,3,2,4,7,7],
                 [7,4,4,2,5,10,1,2,7,3,7,9,8,3,6],
                 [10,1,9,2,8,3,7,3,7,4,7,4,6,5,2],
                 [6,3,5,4,4,9,1,3,8,2,2,7,10,7,5],
                 [1,2,2,3,3,4,4,5,6,7,7,7,8,9,10]]
for i in My2DArray { println(i) }
/*
* [5, 2, 7, 8, 4, 2, 3, 9, 7, 3, 4, 6, 7, 10, 1]
* [9, 3, 6, 7, 1, 5, 8, 4, 2, 10, 3, 2, 4, 7, 7]
* [7, 4, 4, 2, 5, 10, 1, 2, 7, 3, 7, 9, 8, 3, 6]
* [10, 1, 9, 2, 8, 3, 7, 3, 7, 4, 7, 4, 6, 5, 2]
* [6, 3, 5, 4, 4, 9, 1, 3, 8, 2, 2, 7, 10, 7, 5]
* [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 10]
*/
My2DArray[0] = bubblesort(My2DArray[0]);
My2DArray[1] = switchsort(My2DArray[1]);
My2DArray[2] = gnomesort(My2DArray[2]);
My2DArray[3] = selectionsort(My2DArray[3]);
My2DArray[4] = insertionsort(My2DArray[4]);
My2DArray[5] = luckysort(My2DArray[5]);
for i in My2DArray { println(i) }
/*
* [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 10]
* [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 10]
* [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 10]
* [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 10]
* [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 10]
* [1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 10]
*/




