# Different Approaches to UI

Finally, we begin to make apps. Extremely basic apps, at this point, but apps nonetheless.  

Now, User Interface is something XCode makes very easy. UIKit has many built-in UI objects 
and classes, such as view controllers, labels, buttons, and many more, and there are 
many ways to access these. Storyboards are the encouraged method, allowing the developer
to view all the UI elements of the project at once as well as how those elements connect
to each other and, most importantly, how they are laid out. Editing a storyboard is
generally as simple as clicking and dragging where you want elements to go, although more
flourish requires a little bit more coding. Nibs are another method - whereas a storyboard
contains a project's entire UI, a nib may only contain part of it. Editing a nib in XCode
is much the same as editing a storyboard, however - the difference comes in how to get 
from one view to another, which is different programmatically.  

And speaking of that, programmatically is the last way to make a UI. It is possible,
and even recommended in some cases, to start and end with a blank view in the editor; all
UI elements are created programmatically by declaring them within the view controllers 
and manually setting sizes, bounds, relative positioning, et cetera. For the remainder of
this article, I'll be demonstrating a simple application built using all three of these
methods. This application is simple - it's just a tab-based application that uses the 
built-in ```UITabView``` object to manage several views where a set of icons at the bottom of
the screen allows the user to select which tab they want to view. My projects are named
"ThreeTabsStoryboard", "ThreeTabsNib", and "ThreeTabsProgram" - feel free to look at them
as a guide, although I encourage you to build these programs yourself - doing is more
effective than seeing.

## Storyboards

Most XCode projects start out as storyboards by default. In our case, we want to make a
new project of the type "Tabbed Application" (found under IOS > Application when creating
a new project with XCode), and XCode will automatically set us up with a storyboard and
a ```UITabView``` along with two subviews - each subview has the text "Nth View", with N 
corresponding to which view, and immediately below that in smaller text is written 
"Loaded by NthViewController".  

Before getting into anything else, I'll run through what's going on. If you inspect the
two views you're given, you'll find that they each belong to the ```UIView``` class. 
```UIView``` and all its descendants are classes primarily meant to enclose other objects.
Generally, a ```UIView``` is going to serve as the background of a particular scene on the
iPhone. Accordingly, you can't set the dimensions of a ```UIView```; it automatically
resizes itself according to the size of the screen. There are many descendants of 
```UIView```, including the ```UITabView``` we've already seen, but of them ```UILabel```
is the most useful and the one we're going to talk about next.  

If you've used another Object-Oriented language, you know what labels are - they're the 
most basic level of container, and usually contain text. ```UILabel```s are descendants of
```UIViews``` in UIKit (which is Apple's pre-made set of UI tools we're generally going
to be working with) and, unlike ```UIView```s, their dimensions can be set freely. The
two lines of text on each of our views are actually in Labels. As these labels demonstrate,
```UIView```s can be nested within each other - the two labels you see are "**Subviews**" 
of their enclosing containers.  

You may also notice, if you look to the left of your screen at the list of project files, 
that you have two files called "FirstViewController.swift" and "SecondViewController.swift".
These are View Controllers - special classes that manage the operations on a view. In
particular, ```FirstViewController``` and ```SecondViewController``` are subclasses of 
```UIViewController```, which is evident upon viewing their contents. For now, we don't
need to know any more than that, but keep in mind that in order to program things to 
happen on a view (not everything can be done by clicking and dragging, after all) we'll
need to connect our views to view controllers.  

So now let's create a third view to go with those first two. Creating a new view is simple - 
in the bottom-right corner of your XCode window, you'll see a list of various objects (if
you don't see this, try clicking on the tab that looks like a square inside a circle).
At the top of the list should be a "View Controller". Click and drag it onto your
storyboard, on some blank space. And there you go, you now have a new view. Go ahead and,
in the toolbar in the top right of the screen, find the tab that lets you change the name
of the object to something other than its default - I recommend "Third".  

We now have a View Controller object that we made. Currently, it's being controlled by its
default controller, the foundation UIKit class ```UIViewController```. Let's change that,
by making our own View Controller for it. In XCode, create a new file, of the type "Cocoa
Touch Class" (iOS > Source). After pressing the "Next" button, you'll be confronted with a
text box for you to select the name of the new class (I recommend "ThirdViewController", 
just for consistency's sake), and a dropdown dialog for you to choose our new class's 
superclass. Since we're making a custom view controller, we want to select
```UIViewController``` from that. Go ahead and save it in the default location.  

If you compare this new class we just created to the other two classes, you'll see that
they look the same. This is what we want, for now. At this point, we've created our new
view controller, but we haven't linked it with the view we created earlier - we want that
view controller to be our view controller, not just a regular ```UIViewController```. So,
again on the top-right toolbar, find the tab that has a subheading "custom class". The 
top text/dropdown box will be either blank, or have "```UIViewController```" written in 
light gray text. This is the area that indicates which class our View Controller is. 
Click inside the box, and change it so that it refers to the class we just created (our
new class should appear in the dropdown, but if it doesn't just type its name). And with
that, we've created a new class and connected it with the View Controller we made on the 
storyboard.  

Now to make our view controller look like the other two - this is where the Storyboard
approach shines, because it's easy and it's all clicking and dragging. In the objects
toolbar (bottom-right) click and drag a label onto our Third View Controller. In the 
properties toolbar (top-right, fourth tab) make the text say whatever you want (I went
with "Third View", to parallel the first two), and you can also set the font (on the other 
two views, this particular label is Helvetica 36pt). If you want, do the same for the
second label.  

Finally, now that we're done making it, we need to make the Tab Bar Controller recognize our view as one of its options,
and with storyboards this is easy. If you look to the left, between the list of files and
the area where we view the storyboard, there's a list of objects in the storyboard. Make
sure the Tab Bar Controller's tab is open in that list, and then right-click on the
Tab Bar Controller text with the yellow icon next to it. A black menu should pop up. 
Under the "Triggered Segues" tab, there should be a listing saying "View Controller",
which is highlighted in gray, and next to it are First View Controller and Second View
Controller, also highlighted. Click and drag the circle next to First View Controller - a
white line should form between the circle and your mouse. Drag that to the view controller
we made, and when our view controller is highlighted, release. Third View Controller should
be added to the list, and voila - our view is now its own tab.  

If you try running the program now, you'll see that you can shift to all three tabs, but
the labels we made on the third tab aren't nice and centered like the ones on the first
two tabs were. And here's another benefit of XCode's easy click-and-drag mechanics:
Constraints. If you select one of your labels (start with the top one with big text) and
then hit the tiny icon with two rectangles on the bottom of the window next to the object
toolbar (when you mouse over it, it says "align"), a menu will come up prompting you to
add new alignment constraints. The bottom two allow you to center the label horizontally
and vertically within its enclosing view, so check those and hit the "Add Constraints"
button. If you want to make our third view controller look exactly the same, you'll also
have to horizontally center the second label in the same way, and make an 8.5-pixel gap
between them, which I'll leave you to figure out how to do - it's very straightforward,
but rather than the button with the rectangles, you use the button next to that one, that
looks like a box chart.  

And with that, we have a basic three-tab application. It may not seem like it with all this
text, but that was actually really easy when you think about it. And that's the benefit of
storyboards - they make configuring UI really simple. But that comes at the expense of 
a little bit less control, which our other two approaches remedy.  

## Nibs

A nib (file extension: .xib) functions the same way as a storyboard does (at least, in how
UI elements are placed and arranged), but generally nibs cover smaller portions of a project
and are then meshed together with code. Nibs are useful for projects where many people are
working on different parts (for example, via git) - using separate files for separate
aspects of the User Interface minimizes the amount of changes that need to be merged over
each other after a pull request.  

Time to remake our app, only this time using nibs. First of all, we're going to make a 
Single View Application. This will start us off with three files: AppDelegate,
ViewController, and a storyboard. Since we don't want to work with a storyboard, we want
to work with nibs, delete those last two files (preferably delete them fully, not just
remove references). And, before we forget, if we try to build the app now it'll have a
fatal error because it still thinks there's supposed to be a storyboard - it's easier to
fix this now, before we forget. Inside the folder "Supporting Files" in your project, 
open the file called "info.plist" and look for the line that says "Main Storyboard File
Base Name". Delete that line.  

Now, we need to make our views and view controllers - the ones we're going to use for
our three tabs. To do this, simply create new classes descended from UIViewController, the
same way as we did with the Storyboard. Except, this time, when it's time to name your
view controller, look for the checkbox that says "Also create xib file". And voila - you
now have a view controller, and an associated view contained within a nib. You can edit
the latter the exact same way you edited your views on the storyboard. Do this two more
times, so that you have three view controllers and associated views, one for each of our
three tabs, and pretty them up to your fancy.  

The rest of this is code. In particular, we've created several views, but what we haven't
done is create a Tab Bar to manage them - and even more than that, we haven't told our
application how it's supposed to start. For this, we need that AppDelegate file - perhaps
the most important file of any project, AppDelegate handles our app's initialization and
interactions with the outside world - including the device itself. This is where we need
to initialize our views.  

The function ```application``` should be the first one you see - it's right at the top,
below the declaration of a ```UIWindow?``` called ```window``` (This window is required
by protocol to be here, and it must be an optional type - it's possible, after all, to
build an application that has no UI and therefore needs no window. This object *is* the
window the user sees when they boot up the app). We're going to be putting a bunch of
stuff in this ```application``` function, and rather than explain it here I'm just going
to dump it all directly below and go through piece by piece. Make it so that your function
looks exactly like this, save for your choices in variable names:
```Swift
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)

        let myTabBarController = UITabBarController()
        let myVC1 = FirstViewController(nibName: "FirstViewController", bundle: nil)
        let myVC2 = SecondViewController(nibName: "SecondViewController", bundle: nil)
        let myVC3 = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
        let controllers = [myVC1, myVC2, myVC3]
        myTabBarController.viewControllers = controllers
        let myImage = UIImage(named: "img.jpg")
        myVC1.tabBarItem = UITabBarItem(title: "View 1", image: myImage, tag: 0)
        myVC2.tabBarItem = UITabBarItem(title: "View 2", image: myImage, tag: 1)
        myVC3.tabBarItem = UITabBarItem(title: "View 3", image: myImage, tag: 2)
        
        self.window?.rootViewController = myTabBarController
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
```
This does look like a bit of a doozy, but let's walk through it. On the first line, we're
constructing and initializing our window - very straightforward. Next, we declare and
construct a ```UITabBarController```. We know from the storyboard what function this object
has; the difference is that there it was pre-made for us, while here we have to set it up
programmatically.  

After that, we declare our three view controllers, along with their associated views. We
need to give our tab bar controller the views it's going to be controlling, and this is
how. ```FirstViewController(...)``` is, obviously, a constructor - in this case, it's what
links our view controller to its view as we created it. After we've declared the view
controllers, we put them in an array and give that array to our Tab Bar Controller. Now the
Tab Bar Controller has control of the views it's supposed to display.  

But that's useless if we can't get to them. All that's left is to configure the tabs
themselves, which is what the last four lines of the first block of code are all about. 
First, we create an image (you'll have to bring this into the program yourself, as there aren't
any built in. This is the image that will show on the tab at the bottom of the screen.
The ```img.jpg``` I refer to in this block happens to be a 5px*5px image of perfectly black
pixels, for simplicity's sake. You can do something more complicated, but as a warning try
to stay with very small images; images any larger than around 30 pixels in height will
start poking off of the tab, and obscuring the rest of the screen and the text that says
which tab you're on). Then, we tell our view controllers that they're going to be part of
a table view, and we give them titles, images, and index numbers to present when necessary.  

The final lines are compensating for the lack of a storyboard. Because we're not using the
premade storyboard, everything isn't automatic, and there are two things we have left to
do. The first is to tell our window what view to present as the app starts up - in this
case, we're telling it to look to the Tab Bar Controller to tell it what to show. And
finally, we make the window visible to the user with the self-explanatory ```makeKeyAndVisibile()```
function.  

If you run the application on the iPhone simulator, you should see that it works about the
same as the Storyboard application did. The differences under the hood should be obvious
by now - clearly, this one took a bit more effort to create, as nothing except the very
easy step of linking together views and view controllers was done for us and so we had to
do it by code. But at the same time, now that it's all set up, we don't have to do any more
coding and from this point forward editing our UI is just as easy as it would be in the
storyboard version of the app. And the three different tabs are in three different files -
this is important because it allows several developers to work on the UIs of the different tabs at the same
time, and there won't be any conflicts when trying to merge them back together (again, see
the github tutorial). There's still one more method of building UI to cover, though.  

## Programmatically

Here, we're not going to have any nibs at all - all of our UI elements are going to be
created and managed solely via code.  

For starters, we're going to be creating our project exactly the same way we did when we
used nibs. And we're going to do the exact same things with it - go ahead and delete the
view controller and storyboard that are already part of the project, remove the reference
to ```storyboard.main``` in the ```info.plist``` file, and create three view controllers
to manage the three views in our tab view. Except this time, don't check the box that says
"Also create XIB file," because we don't want a nib - we want to do it all programmatically.  

Before we get to work editing those view controllers, let's edit the appDelegate file
again. We're doing exactly the same thing to it as we did when using nibs, with one
exception: instead of this:
```Swift
		let myVC1 = FirstViewController(nibName: "FirstViewController", bundle: nil)
```
for all of our view controllers, we're going to just use the default constructor:
```Swift
		let myVC1 = FirstViewController()
```
because our view controllers don't have any associated nibs.  

Now the app will technically work, but it's time to pretty up our views. I'll paste the
code I'm using below, and walk through it - for reference, I'm making this program look
exactly the same as the one using storyboards:
```Swift
class FirstViewController: UIViewController {
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white:1.0, alpha: 1.0)
        
        //for convenience in positioning
        let myWidth = self.view.frame.width
        let myHeight = self.view.frame.height
        
        nameLabel = UILabel()
        nameLabel.text = "First View"
        nameLabel.font = UIFont(name: "Helvetica", size: 36)
        nameLabel.textAlignment = .Center
        nameLabel.frame = CGRectMake(1,1, 210, 42)
        nameLabel.center = CGPointMake(myWidth / 2, myHeight / 2)
        self.view.addSubview(nameLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "Managed by FirstViewController"
        descriptionLabel.font = UIFont.systemFontOfSize(14.0)
        descriptionLabel.textAlignment = .Center
        descriptionLabel.frame = CGRectMake(1,1,236,17)
        descriptionLabel.center = CGPointMake(myWidth / 2, nameLabel.center.y + nameLabel.frame.height/2 + 8)
        self.view.addSubview(descriptionLabel)
    }
    ...
}
```
And now I'll walk through the process. First, we're creating a couple of class variables:
two labels, named ```nameLabel``` and ```descriptionLabel``` respectively. These are going to represent
the two labels we see that say "First View" and "Managed by FirstViewController", respectively.
Technically, these can be local variables that we create in our ```viewDidLoad``` function
and will still work, but the problem with that is that after the function finishes running
we will no longer have access to them and thus cannot control them. Making them class
variables ensures that we can access them from any time and anywhere inside the class.  

Next, after running the superclass's constructor (remember that this is almost always a
thing you should do with functions you override), we set our view's background color to
the color white - it's black by default. Then, we programmatically construct ```nameLabel```
and start fixing its properties so that it looks the way we want it to (I came up with my
numbers by looking at the corresponding numbers from the storyboard build of this project). The only property I'm
going to go into detail about is when we set the frame and when we set the center - I'm
going to explain why we need to do them separately. The reason is that there's no easy way
(by which I mean, there's no built-in function) to set the dimensions of a label without
also setting its position. And while we could figure out how to position the label and make
that part of the frame, it's easier to just set the top-left of the label to (1,1) and
set the center to align with the center of the screen afterwards.  

Then, as the last line of that block of code, we add our label as a subview to the view
our view controller controls. We have to do this at some point, or else our class will
create our label but then never display it to the viewer; we have to put our label on the
view that's being displayed to the viewer so that the viewer can see it.  

After this, we do roughly the same thing for our description label, and we repeat the
process for our other two view controllers. And then, if you run the program, 
you should see that it looks about the same as our other two programs.  

Building it just through using code gives us a lot of control over our objects, as you can
see, but it's a bit complicated and takes a lot of effort to achieve the same results as
clicking and dragging UI elements into place as can be done with our other two methods.  

## Conclusion

For the remaining tutorials, whenever I'm making XCode projects, I'll be using storyboards
linked to code. Storyboards are the most convenient and simple way to create a user
interface, and since I'm working alone on these projects, I don't need to go through the
added complications of using nibs to avoid merging difficulties. Objects on storyboards
and nibs can also be linked to objects declared in code, allowing a designer the flexibility
and simplicity of XCode's click-and-drag functionality as well as the control over their
elements that they get from programming them, and I'll probably be demonstrating this
function in a future tutorial (maybe the one about buttons).

Finally, I want to address Apple's Developer Library. In the above example, I accessed a
bunch of properties and functions of ```UILabel```s that you may not have known about. As
in many other languages, the Developer Library provides thorough and easy-to-understand
documentation of every class in the language, and if you ever get stuck - for example, knowing
which part you need to do something but not how to do that thing with that part - the
developer library will certainly be helpful. Google, too, and StackOverflow, are useful
resources when you get stuck looking for functions of various objects. 

Apple's Developer Library (which covers the functionality of Apple's built-in frameworks
in both Objective-C and Swift), in my opinion, is one of the best and most thorough and
comprehensive developer libraries out there, and it can be found at
https://developer.apple.com/library/ios/.

### Resources
-Tab Views in general: http://makeapppie.com/2014/09/09/swift-swift-using-tab-bar-controllers-in-swift/
-Using nibs in Objective-C: http://michiganlabs.com/xibs-nibs-ios7-and-xcode5/#.VaBywRNViko
-Removing storyboards from projects: http://codefromabove.com/2014/09/xcode-6-removing-storyboards-and-creating-useful-empty-projects/