
local M = {}
M.states = {}

function M:add( id, callbackEnter, callbackRun, callbackExit, scope )

	local state = {}
	state.id = id
	state.callbackEnter = callbackEnter
	state.callbackRun = callbackRun
	state.callbackExit = callbackExit
	state.scope = scope

	M.states[id] = state

end

function M:getStateId()

	local id
	local active_state = M.active_state
	if active_state then
		id = active_state.id
	end

	return id
	
end

function M:set( id )

	local active_state = M.active_state
	local previous_state_id
	
	if active_state then

		local scope = active_state.scope
		local callbackExit = active_state.callbackExit
		callbackExit( scope, id )
		previous_state_id = active_state.id
	
	end

	active_state = M.states[id]

	M.active_state = active_state

	local scope = active_state.scope
	local callbackEnter = active_state.callbackEnter
	callbackEnter( scope, previous_state_id )
	
end

function M:update()

	local active_state = M.active_state
	
	if active_state then

		local scope = active_state.scope
		local callbackRun = active_state.callbackRun
		callbackRun( scope )
	
	end

end

return M