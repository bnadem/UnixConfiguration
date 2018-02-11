One of the first steps in the pipeline is to create binaries and installers
the process of building, deploying, testing, and releasing software visible to
everybody involved, aiding collaboration

1-
Keep Absolutely Everything in Version Control
i==================================================
keep configuration information
. Developers should 
use it for source code, of course, but also for tests, database scripts, build and
deployment scripts, documentation, libraries and configuration files for your
application, your compiler and collection of tools, and so on—so that a new
member of your team can start working from scratch.

for recreate and testing software  and production environnement
target:everybody use the same setting

recover exact snapshot of the state entire system from develepement zum production
software stack, 
operating system for application software
DNS zones files
firewall configuration
for everyone to use same setting, 
Project Manager should save plans, progress charts, ris logs


Related to your project in a version control repository.
In addition to storing source code and configuration information, many projects
also store binary images of their application servers, compilers, virtual machines,
and other parts of their toolchain in version control.
 
speed up new environnement creation
base confiugraiot are complet defined

whole environnement like virtual machine

keeping binary output from application
first
 they are big
second
automated build script
commit for source code, other commit for binary mor important for deployment pip

CHeck in regularly to Trunk
first after step back and change, echo 
change is not only for developer, given birth to a build
develeper want to be confident , ther code is in a good state


commit frequently=>change are availabel every body 



