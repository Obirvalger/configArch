#! /bin/bash
synclient TouchpadOff=$[ $[1 +  `synclient -l | grep TouchpadOff | awk '{print $3}'`] % 2 ]
#echo $[ $[1 +  `synclient -l | grep TouchpadOff | awk '{print $3}'`] % 2 ]
