ToyRobotSimulator
===================

Implementation of the awesome toy robot simulator code challenge.

## Description
The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
There are no other obstructions on the table surface.
The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. 
Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

## Installation

### Manually

Clone this repository and run bundle.

    $ git clone git@github.com:fpgentil/toy_robot_simulator.git
    $ cd toy_robot_simulator
    $ bundle

## Running

    $ ruby bin/toy_robot_simulator

## Usage

The application reads the following commands:

    PLACE X, Y, FACING
    MOVE
    LEFT
    RIGHT
    REPORT

### PLACE

    It places the robot onto the tabletop at (X,Y) facing to FACING

### MOVE

    It moves forward the robot based on its facing

### LEFT

    It turns robot facing to left

### RIGHT

    It turns robot facing to right

### REPORT

    It outputs the current position and the facing of the robot


## Constraints

The toy robot does not fall off the table during movement. 
This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall is ignored.


## Examples

### Example 1

    PLACE 0, 0, NORTH
    MOVE
    REPORT

    0, 1, NORTH

### Example 2

    PLACE 0, 0, NORTH
    LEFT
    REPORT

    0, 0, WEST

### Example 3


    PLACE 1, 2, EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

    3, 3, NORTH


## Contributing

1. Fork it ( https://github.com/[my-github-username]/toy_robot_simulator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
