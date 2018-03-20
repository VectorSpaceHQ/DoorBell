# DoorBell
[Internet of Things (IOT)](https://en.wikipedia.org/wiki/Internet_of_things) Doorbell for Vector Space

## Overview

We need a doorbell at Vector Space. Instead of buying an off-the-shelf solution (which is boring, right?), we have decided to build our own network connected doorbell.

## TODO

* Install the push button outside of the door.
* Install an MQTT message broker on a server running on the network.
* Write an MQTT client to publish the pushbutton status to the doorbell topic.
* Write an MQTT client to subscribe to the doorbell topic and play audio out of a speaker when the button is pressed.
* Wire the ciruit for the MQTT client with the pushbutton.
* Wire the circuit for the MQTT client with the speaker.
