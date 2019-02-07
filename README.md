# Defold States
A minimal state machine, running one state at a time with code of your choice triggering on enter, run and exit.


# Installation
You can use Defold States in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

    https://github.com/totebo/defold-states/archive/master.zip

Or point to the ZIP file of a [specific release](https://github.com/totebo/defold-states/releases).


## Example

      -- Init
      states = require "states.states"
      states:add( state_id, onStateEnter, onStateRun, onStateExit, self )
      states:set( state_id )

      -- On update
      states:update()

### stats.update()
Call this once per frame.


### states.add( id, callbackEnter, callbackRun, callbackExit, scope )
Adds a state.

**PARAMETERS**

* `id` Id which is used to activate the state.
* `callbackEnter` Function triggered when the state is activated.
* `callbackRun` Function triggered when the state is updated.
* `callbackExit` Function triggered when the state is deactivated.
* `scope` Scope of the script that created this States instance.
