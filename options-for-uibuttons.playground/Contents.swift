//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

/*:
Forenote: Before viewing this playground/write-up, open the Assistant Editor; that's where you can see all my examples put into practice. (To do this, I'm just using the ```XCPShowView``` function from the ```XCPlayground``` framework. It takes a String and a descendant of UIView.)

# UIButtons

A button can be easily defined as any object that executes an action when tapped by the user. There is a type of object in the Cocoa framework called ```UIButton```, but to make a "button" one need not necessarily use this - a regular ```UILabel``` can work just fine as a button.

I will start by showing an example of a normal ```UIButton```.
*/
var myButton1 = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
myButton1.frame = CGRectMake(0,0,300,100)
myButton1.backgroundColor = UIColor(white:0,alpha:1)
myButton1.setTitle("This Is A Button", forState: UIControlState.Normal)
XCPShowView("Button 1", myButton1)
/*:
Now, when we click the button, nothing will happen. That's just because we haven't mapped any functions to it yet. First, I'm going to go into what I did above: setting the button's text based on its control state. An object's ```UIControlState``` is essentially how the object is being treated by its environment. ```UIControlState``` is an enumerated variable, with possible values:
-```Normal```: Nothing else is happening. The button is just sitting there and you're looking at it. This also serves as the default.
-```Highlighted```: You're currently pressing down on the button. The button enters this state when you touch down, and leaves it when you release your touch by lifting up your finger (or, in this case, mouse).
-```Disabled```: This state takes precedence over all other modes when the button, for whatever reason, has interaction disabled - that is, no matter what the user does to it, the button will not respond. ```UIButtons``` can be set as enabled or disabled through use of their ```enabled``` property.
-```Selected```: You know how you can select text by clicking and dragging over it? This works on the same general principle - in certain situations, it's possible to, as a user, select a bunch of objects in the UI in much the same way as selecting all the images on a webpage. This state is triggered then.
-```Application``` and ```Reserved``` are less well-defined states, used respectively for internal application usage and internal framework usage. You shouldn't play around with these, nor should you need to.
I'll demonstrate the Disabled state now:
*/
var myButton1b = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton //creating a new button to the same specifications as the old one
myButton1b.frame = myButton1.frame
myButton1b.backgroundColor = myButton1.backgroundColor
myButton1b.setTitle("This Is A Button", forState: .Normal)
myButton1b.setTitle("You Can't Press Me", forState: .Disabled)
myButton1b.enabled = false
XCPShowView("Button 1B", myButton1b)

//: It's not easy to demonstrate the Highlighted state in a playground, but you should get the gist of it. In the accompanying app, I'll demonstrate this, since I can't easily do it here. I won't be demonstrating the actual linking of actions and objects to programmatic declarations, but that's really simple and can be easily looked up by googling "XCode Linking UI to Code" or similar.

/*:
That's a basic button. Of course, it doesn't look that pretty, but we can fix that. One way is by adding a background image, which can be done by using ```UIButton```'s ```backgroundImageForState``` method. As above, you can also change background color, and you can change font and other appearence aspects rather easily. For more information on that, see the developer library: https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIButton_Class/
The thing I will go over here is button types. Like ```UIControlState```, ```UIButtonType``` is an enumerated variable. In particular, choosing a button type removes the need to do a lot of manual visual customization. UIButtons are custom by default, such as the one above, but here are the other types you can choose:

A System button has no immediate borders, and is simply blue text centered within the bounds of its button. It looks nice and simple.
*/

var myButton2 = UIButton.buttonWithType(UIButtonType.System) as! UIButton
myButton2.frame = CGRectMake(0,0,300,100)
myButton2.setTitle("This is a Second Button", forState: UIControlState.Normal)
XCPShowView("Button 2",myButton2)

/*: 
A Detail Disclosure button looks a lot like a System button, with the difference being that there is an info icon in front of whatever text is to be set. The purpose of this button is generally to be placed inside of (that is, on top of) other elements or buttons to provide information regarding function when pressed.
*/
var myButton3 = UIButton.buttonWithType(.DetailDisclosure) as! UIButton
XCPShowView("Button 3",myButton3)

var myButton4 = UIButton.buttonWithType(.System) as! UIButton
myButton4.setTitle("Press This", forState: .Normal)
myButton4.frame = CGRectMake(0,0,300,100)
myButton3.center = CGPointMake(100,50)
myButton4.addSubview(myButton3)
XCPShowView("Button 4",myButton4)
/*: As you can see, our detail disclosure button has been strategically placed inside button 4. If we were to press the detail disclosure button, we would activate whatever method it's connected to, rather than that which Button 4 is connected to.


An info button generally works in the same way as a disclosure button, although its purpose is to reveal app configuration details rather than to provide the user details about the functionality of an item on which it is placed. In practice, info buttons and Detail Disclosure buttons are pretty much interchangeable. Info buttons come in two types: .InfoLight and .InfoDark, which correspond to the background colors of the buttons. As these can be changed manually, I don't see them as worth worrying about, or demonstrating outside of this playground, where the difference would be noticeable.
*/
var myButton5 = UIButton.buttonWithType(.InfoDark) as! UIButton
XCPShowView("Button 5",myButton5)

/*:
Finally, a Contact Add button is exactly the same as a Detail Disclosure button and an Info button in designer-defined functionality, but rather than appearing as an 'i' in a circle, it instead appears as a plus sign. Its intended purpose is to be used to add the values of text fields to code (see its use in the iPhone's built in Contacts app), but in practice it can be made to do anything any other button could do.
*/
var myButton6 = UIButton.buttonWithType(.ContactAdd) as! UIButton
XCPShowView("Button 6",myButton6)

/*:
## Bar Buttons

Bar buttons are buttons that appear on the navigation bars towards the top of the screen, such as those used in many built-in apps (Apple Music, Contacts, etc.). They are not technically UIButtons - in fact, they have an entirely different inheritance tree - and they act a bit differently. Bar buttons cannot just be placed on the screen - they are intended for use only in ```UINavigationItem``` descendants and ```UIToolbar```s. In fact, these types of objects have built-in places for bar buttons in their design: a ```leftBarButtonItem``` and ```rightBarButtonItem``` variable into which can be inserted a bar button.

The constructor for a ```UIBarButtonItem``` that you're going to want to use most of the time is
```init(barButtonSystemItem:[item], target:[target], action: [action])```
in which the item is an enumerated variable of type ``UIBarButtonSystemItem```, the target is the object on which to execute the action, and the action is the name of the method to be performed. Actions and Targets are how normal buttons work, too (for ```UIButton```s, these can be set programmatically with the function 
```addTarget([target],action:[action],forControlEvents:[event])```
That last parameter, the control event, I'll explain in a moment).

The possible system items for bar buttons can be found more quickly at the developer library (https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIBarButtonItem_Class/#//apple_ref/occ/instm/UIBarButtonItem/ ) than they could be if I were to describe them all here. I'll just leave a single example.
*/
var myBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Trash, target: nil, action: nil)
/*: The reason this doesn't display properly is because it only works when within a navigation item. I can't show it as a view as I could a button because, unlike ```UIButton```, ```UIBarButtonItem``` does not descend from ```UIView```.

You can also use 
```Swift
init(image: [image], style:[style], target:[target], action:[action])
```
to create a bar button item with a custom image, and 
```Swift
init(title: [image], style:[style], target:[target], action:[action])
```
if you want your own title there instead of one of the built-in system titles. Style is an enumerated variable of type ```UIBarButtonItemStyle```, and as of IOS 8.0 has only two values: ```.Plain```, which makes it look like a system button, and ```.Done```, which makes it more like a return button that returns the user to the previous view when tapped (this latter style is built-in in ```UINavigationController```s and must be overwritten if the user wishes). 

Elsewise, bar buttons share many properties with ```UIButton```s, even if they are completely different classes - background color, image, title, etc.


## Other Objects as Buttons

We can also make buttons that are not of the type ```UIButton```. Specifically, it is possible to make labels that function like buttons, activating a method when pressed. That is done by creating a label, and then creating a ```UIGestureRecognizer``` to recognize taps:
```Swift
let myTapRecognizer = UITapGestureRecognizer(target:[target],action:[action])
```
where, as above, target and action refer to the method to call on which class. After that, you can just add that gesture recognizer to the label, and turn on user interactivity:
```Swift
myLabel.addGestureRecognizer(myTapRecognizer)
myLabel.userInteractivityEnabled = true
```
*/
