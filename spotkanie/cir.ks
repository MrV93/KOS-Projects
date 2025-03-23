global function cir{
    warpTo(time:seconds+eta:apoapsis-20).

    set dV to ship:facing:vector:normalized.
    lock steering to lookdirup(dV, ship:facing:topvector).

    wait until eta:apoapsis<3.

    set th to 0.
    lock throttle to th.

    until dV:mag < 0.02{
    set posVec to ship:position - body:position.
    set vecNormal to vcrs(posVec,velocity:orbit).
    set vecPoziomy to -1 * vcrs(ship:position-body:position, vecNormal).
    //ustawianie predkosci orbitalnej na danej wysokosci do utrzymania okraglej orbity
    set vecPoziomy:mag to sqrt(body:MU/(body:Radius + altitude)).
    set dV to vecPoziomy - velocity:orbit.

    if vang(ship:facing:vector,dV) > 1 { set th to 0. }
    else { set th to max(0,min(1,dV:mag/10)). }
    wait 0.
    }
    unlock steering.
}
