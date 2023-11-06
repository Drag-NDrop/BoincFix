#!/bin/bash
# Intended to be a service

# Function: ReadConfig
# Polls the memory segment for the configuration, and fires the main script with populated parameters

ReadConfig
# Populate config variables

CheckInteractionMethods
# Based on numbers of users, it returns their interaction methods in a integer format.
# It could be:
# 1. SSH [ Headless / Remote]
# 2. XOrg [ Desktop ]
# 3. XWayland [ Desktop ]

# So, hypothetically, if there's 3 users logged on, each using one method each, it returns: 123
# If there's 2 ssh users and 1 XWayland user, it would return 113


CheckActivity
# Takes output from CheckInteractionMethods as input
# Splits the string of numbers, and for each of them, runs a check on the relevant source
# Each check results in a true or false, these are collected in an array
# This above-mentioned array, then gets parsed, and the shared memory segment gets updated with the conclusion.




while [[ true ]] do

$Methods = CheckInteractionMethods
CheckActivity

# The main action part of the solution
# Check the Activity memory segment for:
if($MemorySegment_Activity.Line1 -eq true){
    # System is active.
    if ($MemorySegment.Line2 -eq false){
        # A System-Active command has not yet been fired
        FireActiveCommand()
        $MemorySegment.Line2 = true
    }
}

else{
    # System is inactive
    if ($MemorySegment.Line2 -eq false){
        # An idle command has not yet been fired
        FireIdleCommand()
        $MemorySegment.Line2 = true
    }
}

sleep 10 #(Value should be loaded from the config)

done