/* 
*   Complex Variable Types
*
* For this document, extended comments like this one will designate the write-up portion of
* this post. That is, they are informational. Smaller comments using the standard two slashes
* will designate code comments to help clarify individual lines of code.
*/
import UIKit

/*
* In short, an enumerated variable is a variable with a set amount of possible values,
* all of which have been enumerated prior to initialization.
*
* As Enumerations are distinct variable types, they should always start with capital
* letters. This can be seen in variable types like Int, Double, and String, as well as
* class names in all languages.
*
* Enumerations can also be tied to values, similarly to functions. These values are
* actually tuples, so they can have as many subvalues and types as necessary.
*/
enum Planet {
    //the first variable represents mass of an object
    case Mercury(Double, Double) //for these first four, the second variable is height above the surface
    case Venus(Double, Double)
    case Earth(Double, Double)
    case Mars(Double, Double)
    case Jupiter(Double, Double) //for these last four, the second variable is distance from the center of the planet, as these planets do not have surfaces.
    case Saturn(Double, Double)
    case Uranus(Double, Double)
    case Neptune(Double, Double)
    
    case AnotherPlanet(Double, Double, Double, Double)
    //planet mass, radius, object mass, distance from surface
}

func getGravitationalForce (planet: Planet) -> Double {
    let G = 6.67384 * pow(10,-11)
    var objectMass = Double(), planetMass = Double(), distanceFromCenter = Double()
    switch(planet) {
    case .Mercury(let mass, let height):
        objectMass = mass
        planetMass = 3.3*pow(10,23)
        distanceFromCenter = 2440000 + height*1000
    case .Venus(let mass, let height):
        objectMass = mass
        planetMass = 4.87*pow(10,24)
        distanceFromCenter = 6052000+height*1000
    case .Earth(let mass, let height):
        objectMass = mass
        planetMass = 5.97*pow(10,24)
        distanceFromCenter = 6078000+height*1000
    case .Mars(let mass, let height):
        objectMass = mass
        planetMass = 6.42*pow(10,23)
        distanceFromCenter = 3397000+height*1000
    case .Jupiter(let mass, let distance):
        objectMass = mass
        planetMass = 1.9*pow(10,27)
        distanceFromCenter = distance*1000
    case .Saturn(let mass, let distance):
        objectMass = mass
        planetMass = 5.68*pow(10,26)
        distanceFromCenter = distance*1000
    case .Uranus(let mass, let distance):
        objectMass = mass
        planetMass = 8.68*pow(10,25)
        distanceFromCenter = distance*1000
    case .Neptune(let mass, let distance):
        objectMass = mass
        planetMass = 1.02*pow(10,26)
        distanceFromCenter = distance*1000
    case .AnotherPlanet(let pMass, let pRadius, let mass, let height):
        objectMass = mass
        planetMass = pMass
        distanceFromCenter = (pRadius+height)*1000
    default:
        objectMass = 0
        planetMass = 0
        distanceFromCenter = 1
    }
    return G*(planetMass*objectMass/pow(distanceFromCenter,2))
}



/*
* Structs work differently from how they do in other languages - that is, in other languages
* I've worked in, structs always functioned as a way to wrap several variables together in a
* complex variable. However, in Swift, structs are treated just like classes, except without
* a few vital functions.
*
* Rather than say what structs have, I'm instead going to assume we all know what classes are
* and say what structs don't have. What they don't have is polymorphism and inheritance -
* there's no such thing as a substruct or superstruct, and structs cannot thus be typecasted
* in the same way classes can. In addition, unlike classes, structs can only have a single
* reference to any instance. If one struct is assigned to the value of another struct, the
* values are copied, not the pointers. Think of it as passing by value rather than by 
* reference. For example, 
*     var structB = structA
* would create a new struct that was identical to the first struct, whereas
*     var classB = classA
* would set classB's reference to point to classA. Thus, modifying class B in any way would
* end up also modifying class A. This is very important. This is actually a general rule that
* applies to value types, and despite their similar functionality to classes, **structs are
* value types, not objects**. Classes are objects, and thus are still passed by reference,
* as shown above.
*
* Relating to that last point, Swift has introduced a new operator: the triple-equals. It
* is a boolean operator, just like the double-equals, except rather than checking if both
* sides are equal, it checks if both sides are identical. In other words, double-equals 
* compares the total values of both sides and compares them, while triple equals checks 
* whether they're actually the same. Triple equals can only be applied to objects; otherwise
* it causes a compile-time error.
*
* Apple's Swift tutorial mentions one other difference (structs can't deinitialize to free
* up data) but that isn't relevant to the level I expect to be programming at.
*
* Like in other languages, variable and method names are lower camel case, while struct and
* class names are upper camel case.
*
* Fun Fact: Strings, Arrays, and Dictionaries are defined as structures, while their 
* Foundation equivalents NSString, NSArray, and NSDictionary are defined as classes. This is
* very useful to know, as there may be times it is wise to use one over the other.
*/

struct StellarLocation {
    var x = 0.0, y = 0.0, z = 0.0
    //Structs do not have formal constructors. Rather, on initialization, variable values
    //are set.
    
    func distanceTo (point: StellarLocation) -> Double {
        let dx = point.x - x
        let dy = point.y - y
        let dz = point.z - z
        return sqrt(pow(dx,2)+pow(dy,2)+pow(dz,2))
    }
}

class Star {
    var mass = Double() // in kilograms
    var radius = Double() // in kilometers
    var location = StellarLocation(x: 0.0, y: 0.0, z: 0.0)
    
    //this function is a constructor.
    func initWithMass (newMass: Double, newRadius: Double, newLocation: StellarLocation) {
        mass = newMass
        radius = newRadius
        location = newLocation
    }
    
    func doFusion () -> String {
        return "I Did Fusion"
    }
    
    func getGravitationalConstantForLocation (loc: StellarLocation) -> Double {
        let r = location.distanceTo(loc)
        let G = 6.67384 * pow(10,-11)
        return G * mass / pow(r, 2)
    }
}

//this is inheritance. The child class inherits all the variables and functions of the parent
//class, while being able to override them.
class Sun : Star {
    func initSun () {
        mass = 7.36 * pow(10,22)
        radius = 696000
        location = StellarLocation(x:0, y:0, z:0)
    }
    override func doFusion() -> String {
        //overriding a function of the parent class
        return "I did not do fusion."
        //our sun is a sassy, rebellious child.
    }
}


/* Demonstration of Enumerated Variables */

var myMass = 50.0 // in kg
var myPlanet = Planet.Earth(myMass, 0);
    //How much force am I exerting on the ground due to gravity?
getGravitationalForce(myPlanet)
    //what if I was at the border of space, 100km from the surface?
myPlanet = Planet.Earth(myMass, 100);
getGravitationalForce(myPlanet)
    //how about if I was on mars?
myPlanet = Planet.Mars(myMass, 0);
getGravitationalForce(myPlanet)
    //And what about if I was on the moon?
myPlanet = Planet.AnotherPlanet(7.35*pow(10,22), 1738, myMass, 0)
getGravitationalForce(myPlanet)



/* Demonstration of Structs and Classes */

var myStar = Star()
myStar.initWithMass(50, newRadius: 66, newLocation: StellarLocation(x: 5, y: -702, z: 664))
var myStar2 = Star()
myStar2.initWithMass(50, newRadius: 0.001, newLocation: StellarLocation(x: 0, y: -699, z: 77))

myStar.getGravitationalConstantForLocation(myStar2.location)

myStar === myStar2
myStar2 = myStar
myStar === myStar2

myStar.doFusion()

//demonstration of inheritance and overriding
var mySun = Sun()
mySun.initWithMass(200, newRadius: 60, newLocation: StellarLocation(x:1,y:1,z:1))
mySun.getGravitationalConstantForLocation(StellarLocation(x:0,y:0,z:0))
mySun.initSun()

mySun.doFusion()





