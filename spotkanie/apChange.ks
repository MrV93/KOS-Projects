




global function apChange{
    parameter doceloweAP.

    if(ship:apoapsis>doceloweAP){
        
        warpTo(time:seconds+eta:periapsis-20).
    set dAp to ship:apoapsis-doceloweAP.
    lock steering to retrograde.

    wait until eta:periapsis<0.3.
    until dAp<0{
    set dAp to ship:apoapsis-doceloweAP.
    lock throttle to max(0,min(1,dAp/5000)).
    wait 0.

    }
    lock throttle to 0.
    unlock steering. 
    }else{
        warpTo(time:seconds+eta:periapsis-20).
    set dAp to doceloweAP-ship:apoapsis.
    lock steering to prograde.

    wait until eta:periapsis<0.3.
    until dAp<0{
    set dAp to doceloweAP-ship:apoapsis.
    lock throttle to max(0,min(1,dAp/5000)).
    wait 0.

    }
    lock throttle to 0.
    unlock steering.
    }


    

}
