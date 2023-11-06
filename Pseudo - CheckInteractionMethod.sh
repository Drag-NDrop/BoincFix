#!/bin/bash

# Intended to be a service

# Function: ReadConfig
# Polls the memory segment for the configuration, and fires the main script with populated parameters





# Script: CheckActivity
# Mainly runs a list of "desired checks", based on the output from CheckInteractiveMethod
# If input is 1: Run "w" checks and update the memory segment, if there is a change in the global activity status of the box

Parse W
We really only need to know the idle-times of the system.
Then we can pipe each idle timestamp through an activitychecking function


-- Core logic --
$ActiveStatusDetected = 0
Foreach($user in $users){
    if($user.active) { $ActiveStatusDetected = 1}
}

if ($ActiveStatusDetected == 0){
    System is idle. Update memory segment.
@"
true
false
"    
}

else {
    System is not idle. Update memory segment.
    $ActiveStatusDetected = 0
}

$User.Active function:
if ($this.IdleTime -ge $config.idlethreshold){
    return false
}
else { return true}


# If input is 2: Run XOrg checks and update the memory segment, if there is a change in the global activity status of the box
# If input is 3: Run XWayland checks and update the memory segment, if there is a change in the global activity status of the box 


#CheckActivity.sh: 
    #Function CheckW: Runs W, and parses the output. Then populates/updates the memory segment

#CheckActivity.sh: 
    #Function CheckXOrg: Runs checks on the idle-mechanism in XOrg. Then populates/updates the memory segment

#CheckActivity.sh: 
    #Function CheckXWayland: Runs checks on the idle-mechanism in XWayland. Then populates/updates the memory segment

# Function: CheckInteractiveMethod
# Mainly conditional logic, that returns a number, based on the method of interaction the logged-in user(s) is using on the box. It could be:
# 1. SSH [ Headless / Remote]
# 2. XOrg [ Desktop ]
# 3. XWayland [ Desktop ]