# Git and Github
I've never known exactly how Github works. Whenever I've tried to figure out, I'm always 
told “It's a git repository.” Well, a git is basically a snippet of code. So Github is a 
place to put your code so that others can see and access it, and it comes with a changelog 
that allows it to catalog every change that's made to that code. So it's useful when 
working on large projects involving more than one programmer – that way, everybody will 
be able to work on the project at once and keep track of who's doing what to it.  

## Github's Flow
Github's “flow” works a lot like a flowchart or tree diagram – starting from the root of 
the project, different “branches” are created for different parts of the project. On each 
branch there will be a series of nodes, each one designating a change made to the project 
(via committing), and eventually each branch will be linked back to the master branch. 
Until then, the two branches are considered to develop separately, and changes in one will 
not affect the other until they come back together again. Every node in the project is 
saved and can be moved back to in case bugs are found, and it's a good idea to make them 
early and often.  

After creating a repository on github, you can bring it to your computer with the command 
```git clone {url}```
. Which isn't actually bringing the repository to your computer, but is rather cloning it to 
your computer. Eventually, this local repository can be synced back up with the remote 
repository it came from. All of the commands from now on will be proceeded by 
```git```
, just 
to tell the command line what type of command it's executing.  

## Workspace / Workflow Management
```commit```
, ```push```
, and ```pull``` are command-line commands that are responsible for saving and 
loading your code from the repository, and to explain them thoroughly I'll outline the 
structure of a project. There is the workspace, where you do the programming or whatever 
else you're actually doing, and just above that is the index, which catalogues all the 
resources used in your workspace. Above that is your local repository, which tracks and 
stores your code changes the same way Github does, but only for your computer. Finally, 
at the top, is the 'remote', or 'upstream' repository, which is Github.   

Now, the commands: The ```commit``` command essentially saves your work to the local repository, by which I mean it uploads 
all the changes you've made. Generally it's followed by the flag ```-a```
 to designate 'all', and that is followed by the bracketed ```[-m, <message>]```
, which designates the message to put with the commit statement (generally what you're 
updating). The full command looks like ```commit -a [-m, “This Is A Message”]```.   

The ```push```
 command is the same thing on a larger scale – that is, after you've finished committing 
everything to your local repository, the ```push```
 command will “sync” the remote repository with your local repository. Usually the command 
is only the single word ```push```, but if you create a new branch for your project, it won't automatically be pushed, so 
you have to instead use a slightly longer command with two code words: first, the name of 
the remote repository you're pushing the new branch to, and second, the name of the new 
branch. The format for this is ```push {remote} {branch}```.  

Finally, the ```pull```
 command is the reverse: it incorporates changes from the remote repository into the files 
in your workspace. It's followed by two codewords: first, the name of the remote 
repository to draw from, and second the name of the reference you're pulling; the format is ```pull {remote} {reference specification}```
.  

## Workflow Structure
The Index is also called the Staging area – it keeps track of the data to be committed. 
Files can be committed from the staging area with the command ```commit -m, {message}```
, just like committing from the workspace only without the ```-a```
 flag. Files can be staged using the ```add {filename}``` command, and can then be committed. Stashing is somewhat different – it's an alternative 
to committing code before switching which branch you're working on (which would otherwise 
forget all the changes you've made), by simply 'stashing' the code away to work on it 
later. This is done with the command ```stash```
 and can be reversed (the stash can be re-applied) with the command ```stash apply```.  

Merging is the process of combining to different sets of changes to the same document – 
for example, if two people were editing the same file independently, then when they both 
pushed their code, their changes would need to be merged. Generally the repository handles 
this automatically, but in certain cases both users may have made changes to the same 
lines of code, resulting in the need for an external user to decide which change to keep 
and which to discard. The command for merge is simply ```merge {branch to merge to}```
, which merges the branch you're currently working on with the branch you specify 
(usually Master).  

An alternative to merging is called Rebasing, which, rather than merging the branch you're 
working on with the master branch, instead pulls the current master branch and reapplies 
all the changes you've made to it after doing so. If the branch was modified by someone 
else after you began working on it, and they already committed changes to it, then merging 
the project might lead to the project history looking a bit messy – so, instead of simply 
merging, you would rebase the project, which would lead to less branching in the project 
history. However, Rebasing should never be used if there is another user working on the 
same branch, as doing so will require the branches to be merged again at the end of the 
process, with many of the same changes being made in both branches, which would make 
merging rather confusing. The command for rebasing is simply ```rebase {branch to rebase from}```.  

### Good git practices:
<ul>
<li>http://chriskottom.com/blog/2014/02/a-few-modest-best-practices-for-git/</li>
<li>https://sethrobertson.github.io/GitBestPractices/</li>
</ul>

### Resources: 
<ul><li>Installing git through the command line: http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/</li><li>commit and push: http://stackoverflow.com/questions/2745076/what-are-the-differences-between-git-commit-and-git-push</li><li>Helpful git cheatsheet: http://ndpsoftware.com/git-cheatsheet.html#loc=remote_repo</li><li>Stashing: https://git-scm.com/book/tr/v1/Git-Tools-Stashing</li><li>Merging: http://en.wikipedia.org/wiki/Merge_%28revision_control%29</li><li>Rebasing, Merging, and other Workflow tutorial: https://www.atlassian.com/git/tutorials/merging-vs-rebasing/workflow-walkthrough</li>


My github is here, and this first post has already been uploaded there.
-https://github.com/Superbird11/new-swifting


