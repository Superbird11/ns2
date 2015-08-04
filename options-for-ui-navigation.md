# Options for UI Navigation

There are more or less three different options for UI navigation - that is, moving from view to view: Hierarchal, Flat, and Experience-Driven. Each provides a slightly different experience for the user, and implementation options can vary widely. Additionally, these methods can be nested within each other - for example, it is completely possible to have a flat UI with a selection of different hierarchies, or a hierarchy in which a child view contains a flat UI.

Throughout this tutorial, I will refer to the example project "pageTest". 

## Hierarchal

We all know what a hierarchy is - starting with a 'root' node, other nodes 'branch' out to form their own layer in the tree. These are known as Child nodes, and the nodes they descended from are called Parent nodes. 

This is by far the easiest way to lay out a UI, and the one that affords the developer the most different implementation options. Effectively, all that's needed is a set of menus to allow a user to choose which view to visit at each step. PageTest's opening screen is an example of this - I've set up two ```UIButton```s, which allows the user to choose two different views to go to. Hypothetically, more menus of the same type could be at the end of either of my options, and I could add even more options than those. 

I made my menu by placing two buttons and linking them to the views I wanted them to lead to. This is a basic method, but it's also possible to use a Table View to select which view to go to, or perhaps a picker wheel and a button that sends you based on the picker's current value - the sky is the limit on these. The only real important thing is the thing at the beginning - the ```UINavigationController```. The Navigation Controller is not technically necessary for an app, but it's very useful - mostly because it provides a header bar at the top of the screen that not only allows users to go back automatically (this is  difficult to pull off programmatically; the way that immediately jumps out at you is just to create a button linking back to the view you just came from, but that doesn't send you back - it pushes a new view on top of you, adding it to a potentially never-ending stack that could eventually cause a crash) but also provides a nice heading to tell the user which screen of the app they're on, and an extra space for a button of your choice. An example of the navigation controller in one of Apple's built-in apps is the Contacts app - look towards the top of the screen to see it in action as you navigate the app.

## Flat

The best example of a flat UI is a Tab View, as created in the last tutorial and as used as an example in this one. A Flat UI will allow the user to access any view they want at any time, navigating directly from one to another. Unlike a hierarchy, you don't have to go up a level in order to move to a sibling node - they are all listed somewhere on-screen and you can move to them directly. For a more detailed look at a Tab View, check out my last tutorial; and for an example of a Tab View / Flat UI in action, look at either apple's Music app, or the App Store - both are good examples. 

Hypothetically, a Split View could be used for this purpose as well. 

## Dynamic (Experience-Driven)

The easiest way to show this is with a Page View. Page views are difficult to work with due to the fact that they generally don't take views created on the storyboard - of course, there are ways around this, but in exploring this broadly I didn't delve into them. Instead, a ```UIPageView``` technically consists of only a single view, and when the user tells the view to change, the view is programmatically morphed into the next view the user is meant to see. As such, Page Views can vary easily by what the user does on one page of the view, and are generally sequential, although they are not usually used for this purpose.

Another example would be a string of UIButtons, each of which sends the user to a different destination depending on the settings that are present when the buttons are pressed, or even simply a set of views that the user has to progress through (think a long process of entering information when making a credit card purchase online). 

Apple, in their document on the subject ( https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/Navigation.html ), puts forth as an example of experience-driven UI a book, where the user progresses from page to page, or an adventure game where the user can go from area to area depending on which area they're currently in.