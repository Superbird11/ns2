# Cocoapods vs Carthage

## Dependencies

Put simply, a dependency is a link between elements of a project. If one file requires
another file, such as a header file, to run, then a dependency exists between them. 
Dependencies are easiest to demonstrate in large flowcharts with each file connected by an
arrow to the one dependent on it. Dependency Management is a blanket term for the methods
used to keep dependencies in order.  

Wikipedia gives us four types of dependencies, in this case referring to a dependency as
an operation another part of the program has to perform, rather than simply a resource 
necessary to run. Firstly, there are *Finish to Start* dependencies, which require task 1 to
finish before task 2 can begin. *Finish to Finish* dependencies allow task 2 to begin during 
or even before task 1, but task 2 cannot finish before task 1 finishes, for whatever
reason. *Start to Start* dependencies have no limits on when tasks can finish, but require
that task 1 must have started before task 2 can start. Finally, *Start to Finish*
dependencies require task 1 to have started before task 2 can finish - usually, this means
task 2 began before task 1. Generally, Finish to Start dependencies are the accepted 
"normal" way for dependencies to work - for example, one file importing another file is
a FS dependency, because the second file cannot execute until the first file has been 
imported.  

Another example that may or may not be helpful about other types of dependencies and their
usages would be controlling Events in video games - in certain situations, like cutscenes
where the player is still in control of the dialog box, various actions on the screen 
cannot take place until the player presses the button. Or, perhaps, an escape scene, which 
would use a SF dependency - the cavern begins to collapse, but it cannot finish until the 
player's party has begun their escape.  

## CocoaPods and Carthage

These are two dependency managers that can be used for iOS. Though I haven't used either, and
I doubt I'll understand exactly how either one works until I end up using them for a 
larger project, I do understand the difference between the two - CocoaPods is easy, and
Carthage is simple - two terms that, when placed side-by-side, should be relatively obvious
to tell apart. CocoaPods is easy to use and does a lot of work under the hood that you don't
have to do. Carthage does less work, even if it isn't as easy to use, but its operations
are much more straightforward and simple, allowing the user to understand what's going on
rather than simply trusting the program to do everything – by extension, it lends itself
better to situations in which the software must be used in an unconventional way.