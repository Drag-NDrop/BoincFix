#!/bin/bash
# Related script: CheckActivity.sh
# Output is formed to fit the desired input of CheckActivity



# Function: CheckInteractiveMethod
# Mainly conditional logic, that returns a string of numbers, based on the method of interaction the logged-in user(s) is using on the box. It could be:
# 1. SSH [ Headless / Remote SSH ]
# 2. XOrg [ Desktop ]
# 3. XWayland [ Desktop ]

# Returns: 113 
    # for 2 SSH users and 1 XWayland user


# Search Logged-in users
# Probe for interactive shell
# Probe for open TTY
# Probe for XOrg usage
# Probe for XWayland usage


SearchLoggedInInteractiveUsers
DetermineInteractionMethod
SummarizeInteractiveMethodsInUse