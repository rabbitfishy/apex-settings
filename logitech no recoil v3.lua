-- updated: 05/05/2025.

-- NOTE!
-- GHub is unable to monitor status of usual keys on a keyboard.
-- It does not see whether Backspace is pressed or not.
-- It can see only mouse buttons, Shift/Ctrl/Alt, Locks(Scroll/Caps/Num).

-- this is a better method of doing jitter aim.
-- credit: https://www.unknowncheats.me/forum/apex-legends/606681-ghub-jitter-aim-mantle-jump-script.html

-- IsModifierPressed -> if key held then do action.
-- IsKeyLockOn -> if key toggled then do action.

-- script activation key - only certain key name works.
local lock_key = "capslock" -- "ralt" -> right alt.

-- left click - fire button.
local lc = 1

-- right click - ads button.
local rc = 3

-- recoil adjustment.
local recoil_amount = 10

-- sleep amount.
local sleep_amount = 10

-- main recoil function.
function no_recoil()
	local timer = GetRunningTime()
	
	if IsMouseButtonPressed(lc) then
		repeat
			-- move the mouse relative to its current position.
			MoveMouseRelative(recoil_amount, recoil_amount)
			-- wait for 10 milliseconds.
			Sleep(sleep_amount)
			
			-- handle mouse pull down movement.
			-- credit: https://stackoverflow.com/a/56984947
			local pull_time = GetRunningTime() - timer
			
			-- pull down speed. higher the value, the quicker it pulls down.
			local pull_rate = 0
			
			-- pull down adjustment.
			local pull_adjust = 0
			
			-- adjust our pull down rate since start firing weapon has more recoil.
			if pull_adjust < 20 then
				pull_rate = 21
			elseif pull_adjust < 40 then
				pull_rate = 2
			end
			
			-- handle mouse pull down movement.
			-- timer here is to limit how far we pull down the mouse.
			-- 1000 milliseconds = 1 second.
			if pull_time < 2350 then
				MoveMouseRelative(0, pull_rate)
				-- increment pull down adjusting.
				pull_adjust = pull_adjust + 1
				-- wait for 10 milliseconds.
				Sleep(sleep_amount)
			end
			
			-- move the mouse relative to its current position.
			MoveMouseRelative(-recoil_amount, -recoil_amount)
			-- wait for 10 milliseconds.
			Sleep(sleep_amount)
			
		until not IsMouseButtonPressed(lc) -- loop until left mouse is not pressed.
	end
end

-- handle mouse activities.
function OnEvent(event, arg)
	-- allow mouse button activities.
	EnablePrimaryMouseButtonEvents(true)
	
	-- activate script key and pressed right click.
	if IsKeyLockOn(lock_key) and IsMouseButtonPressed(rc) then
		repeat
			-- no recoil function here.
			no_recoil()
			
			-- wait for 60 milliseconds.
			Sleep(60)
			
		until not IsMouseButtonPressed(rc)
	end
end
