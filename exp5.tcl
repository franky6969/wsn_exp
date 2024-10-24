# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     18                         ;# number of mobilenodes
set val(rp)     DSDV                       ;# routing protocol
set val(x)      2754                      ;# X dimension of topography
set val(y)      100                      ;# Y dimension of topography
set val(stop)   10.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open exp5.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open exp5.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 18 nodes
set n0 [$ns node]
$n0 set X_ 358
$n0 set Y_ 208
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 426
$n1 set Y_ 412
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 588
$n2 set Y_ 243
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 509
$n3 set Y_ 22
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 269
$n4 set Y_ 3
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 143
$n5 set Y_ 138
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 146
$n6 set Y_ 293
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 277
$n7 set Y_ 426
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 1492
$n8 set Y_ 257
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 1429
$n9 set Y_ 491
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 1676
$n10 set Y_ 402
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 1699
$n11 set Y_ 137
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20
set n12 [$ns node]
$n12 set X_ 1456
$n12 set Y_ 24
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20
set n13 [$ns node]
$n13 set X_ 1256
$n13 set Y_ 227
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20
set n14 [$ns node]
$n14 set X_ 585
$n14 set Y_ 591
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20
set n15 [$ns node]
$n15 set X_ 1224
$n15 set Y_ 613
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20
set n16 [$ns node]
$n16 set X_ 815
$n16 set Y_ 632
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20
set n17 [$ns node]
$n17 set X_ 985
$n17 set Y_ 623
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n6 $udp0
set null8 [new Agent/Null]
$ns attach-agent $n1 $null8
$ns connect $udp0 $null8
$udp0 set packetSize_ 1500

#Setup a UDP connection
set udp1 [new Agent/UDP]
$ns attach-agent $n5 $udp1
set null9 [new Agent/Null]
$ns attach-agent $n1 $null9
$ns connect $udp1 $null9
$udp1 set packetSize_ 1500

#Setup a UDP connection
set udp2 [new Agent/UDP]
$ns attach-agent $n4 $udp2
set null11 [new Agent/Null]
$ns attach-agent $n1 $null11
$ns connect $udp2 $null11
$udp2 set packetSize_ 1500

#Setup a UDP connection
set udp3 [new Agent/UDP]
$ns attach-agent $n0 $udp3
set null10 [new Agent/Null]
$ns attach-agent $n1 $null10
$ns connect $udp3 $null10
$udp3 set packetSize_ 1500

#Setup a UDP connection
set udp4 [new Agent/UDP]
$ns attach-agent $n7 $udp4
set null7 [new Agent/Null]
$ns attach-agent $n1 $null7
$ns connect $udp4 $null7
$udp4 set packetSize_ 1500

#Setup a UDP connection
set udp5 [new Agent/UDP]
$ns attach-agent $n1 $udp5
set null13 [new Agent/Null]
$ns attach-agent $n14 $null13
$ns connect $udp5 $null13
$udp5 set packetSize_ 1500

#Setup a UDP connection
set udp6 [new Agent/UDP]
$ns attach-agent $n14 $udp6
set null14 [new Agent/Null]
$ns attach-agent $n16 $null14
$ns connect $udp6 $null14
$udp6 set packetSize_ 1500

#Setup a UDP connection
set udp15 [new Agent/UDP]
$ns attach-agent $n2 $udp15
set null12 [new Agent/Null]
$ns attach-agent $n1 $null12
$ns connect $udp15 $null12
$udp15 set packetSize_ 1500

#Setup a UDP connection
set udp16 [new Agent/UDP]
$ns attach-agent $n17 $udp16
set null23 [new Agent/Null]
$ns attach-agent $n16 $null23
$ns connect $udp16 $null23
$udp16 set packetSize_ 1500

#Setup a UDP connection
set udp17 [new Agent/UDP]
$ns attach-agent $n15 $udp17
set null22 [new Agent/Null]
$ns attach-agent $n17 $null22
$ns connect $udp17 $null22
$udp17 set packetSize_ 1500

#Setup a UDP connection
set udp18 [new Agent/UDP]
$ns attach-agent $n9 $udp18
set null21 [new Agent/Null]
$ns attach-agent $n15 $null21
$ns connect $udp18 $null21
$udp18 set packetSize_ 1500

#Setup a UDP connection
set udp19 [new Agent/UDP]
$ns attach-agent $n10 $udp19
set null20 [new Agent/Null]
$ns attach-agent $n9 $null20
$ns connect $udp19 $null20
$udp19 set packetSize_ 1500


#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp2
$cbr0 set packetSize_ 1000
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ null
$ns at 1.0 "$cbr0 start"
$ns at 2.0 "$cbr0 stop"

#Setup a CBR Application over UDP connection
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 1000
$cbr1 set rate_ 1.0Mb
$cbr1 set random_ null
$ns at 1.0 "$cbr1 start"
$ns at 2.0 "$cbr1 stop"

#Setup a CBR Application over UDP connection
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp0
$cbr2 set packetSize_ 1000
$cbr2 set rate_ 1.0Mb
$cbr2 set random_ null
$ns at 1.0 "$cbr2 start"
$ns at 2.0 "$cbr2 stop"

#Setup a CBR Application over UDP connection
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp4
$cbr3 set packetSize_ 1000
$cbr3 set rate_ 1.0Mb
$cbr3 set random_ null
$ns at 1.0 "$cbr3 start"
$ns at 2.0 "$cbr3 stop"

#Setup a CBR Application over UDP connection
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp5
$cbr4 set packetSize_ 1000
$cbr4 set rate_ 1.0Mb
$cbr4 set random_ null
$ns at 1.0 "$cbr4 start"
$ns at 2.0 "$cbr4 stop"

#Setup a CBR Application over UDP connection
set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp15
$cbr5 set packetSize_ 1000
$cbr5 set rate_ 1.0Mb
$cbr5 set random_ null
$ns at 1.0 "$cbr5 start"
$ns at 2.0 "$cbr5 stop"

#Setup a CBR Application over UDP connection
set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$cbr6 set packetSize_ 1000
$cbr6 set rate_ 1.0Mb
$cbr6 set random_ null
$ns at 1.0 "$cbr6 start"
$ns at 2.0 "$cbr6 stop"

#Setup a CBR Application over UDP connection
set cbr7 [new Application/Traffic/CBR]
$cbr7 attach-agent $udp16
$cbr7 set packetSize_ 1000
$cbr7 set rate_ 1.0Mb
$cbr7 set random_ null
$ns at 1.0 "$cbr7 start"
$ns at 2.0 "$cbr7 stop"

#Setup a CBR Application over UDP connection
set cbr8 [new Application/Traffic/CBR]
$cbr8 attach-agent $udp17
$cbr8 set packetSize_ 1000
$cbr8 set rate_ 1.0Mb
$cbr8 set random_ null
$ns at 1.0 "$cbr8 start"
$ns at 2.0 "$cbr8 stop"

#Setup a CBR Application over UDP connection
set cbr9 [new Application/Traffic/CBR]
$cbr9 attach-agent $udp18
$cbr9 set packetSize_ 1000
$cbr9 set rate_ 1.0Mb
$cbr9 set random_ null
$ns at 1.0 "$cbr9 start"
$ns at 2.0 "$cbr9 stop"

#Setup a CBR Application over UDP connection
set cbr10 [new Application/Traffic/CBR]
$cbr10 attach-agent $udp19
$cbr10 set packetSize_ 1000
$cbr10 set rate_ 1.0Mb
$cbr10 set random_ null
$ns at 1.0 "$cbr10 start"
$ns at 2.0 "$cbr10 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam exp5.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run

