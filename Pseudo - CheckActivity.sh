#!/bin/bash
# Related Script: CheckInteractionMethods
# NeedsConfig: Yes - Specifically, the attribute that indicates how much time users should be inactive, for the system to be considered idle.
# Mainly runs a list of "desired checks", based on the output from CheckInteractiveMethod
# If input is 1: 113, Sort unique, 
                      run CheckW and summarize the activity states
                      run CheckXWayland and summarize activity states



# Main logic:: 

$ActivityArray = $input.Unique

$ResultArray = arr[]
foreach(character in $input.Unique){

    switch($ActivityArray){
        case 1: $ResultArray += CheckW
        break;

        case 2: $ResultArray += CheckXOrg
        break;

        case 3: $ResultArray += CheckXWayland
        break;

        default: {echo "Something is wrong with the CheckInteractionMethods. CheckActivity recieved an invalid character: $character"
                  exit 1
        }

    }

}


If($ResultArray -contains TRUE){
    # At least one user is active on the system.
    # Return an TRUE, which indicates at least one user is active, globally on the system
    return true
}
else {
    # No users seems to be using the system.
    # Return a FALSE, which indicates that the system is now in idle state.
    return false
}



# Function CheckW: Runs `w`, and parses the output.
    # For each user, an array of states is collected.
    # Array is checked for Active users.
    # Activity is defined by an idle-time being lower than what is defined in the config file.
      - If any is found, TRUE is returned.
      - If none is found, FALSE is returned. 
    # Returns either TRUE or FALSE
    # TRUE for Active, FALSE for Idle

# Function CheckXOrg: Runs checks on the idle-mechanism in XOrg.
    # For each user, an array of states is collected.
    # Array is checked for Active users.
    # Activity is defined by an idle-time being lower than what is defined in the config file.
      - If any is found, TRUE is returned.
      - If none is found, FALSE is returned.     
    # Returns either Active or FALSE
    # TRUE for Active, FALSE for Idle

# Function CheckXWayland: Runs checks on the idle-mechanism in XWayland.
    # For each user, an array of states is collected.
    # Array is checked for Active users.
    # Activity is defined by an idle-time being lower than what is defined in the config file.
      - If any is found, TRUE is returned.
      - If none is found, FALSE is returned. 
    # Returns either TRUE or FALSE
    # TRUE for Active, FALSE for Idle