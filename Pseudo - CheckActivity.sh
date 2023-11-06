#!/bin/bash

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