-- updated: 16/03/2025.
-- res: 1728x1080 (16:10).
-- dpi: 2400, poll rate: 1000.
-- 9:14 - best setting for me

-- NOTE!
-- GHub is unable to monitor status of usual keys on a keyboard.
-- It does not see whether Backspace is pressed or not.
-- It can see only mouse buttons, Shift/Ctrl/Alt, Locks(Scroll/Caps/Num).

-- this is a better method of doing jitter aim.
-- credit: https://www.unknowncheats.me/forum/apex-legends/606681-ghub-jitter-aim-mantle-jump-script.html

-- IsModifierPressed -> if key held then do action.
-- IsKeyLockOn -> if key toggled then do action.

-- script activation key - only certain key name works.
local LockKey = "ralt" -- "ralt" -> right alt.
-- left click - fire button.
local LC = 1
-- right click - ads button.
local RC = 3
-- no recoil amount. NOTE: higher the value the more screen shaking there is.
local RecoilAmount = 9
-- sleep amount.
local SleepAmount = 14

-- handle recoil function.
function NoRecoil()
  local Timer = GetRunningTime()

  if IsMouseButtonPressed(LC) then
  repeat
      MoveMouseRelative(RecoilAmount, RecoilAmount)
      Sleep(SleepAmount)

      -- handle mouse pull down movement.
      -- credit: https://stackoverflow.com/a/56984947
      local PullTime = GetRunningTime() - Timer
      -- pull down speed. higher the value, the quicker it pulls down.
      -- NOTE: this value works on circle motion aiming technique aswell.
      local PullRate

      -- timer here is to limit how far we pull down the mouse.
      -- 1000 = 1 second.
      if PullTime < 2300 then
        PullRate = 13 -- this is how much we have to pull down.
      end
      MoveMouseRelative(0, PullRate)
      Sleep(SleepAmount)

      MoveMouseRelative(-RecoilAmount, -RecoilAmount)
      Sleep(SleepAmount)
    until not IsMouseButtonPressed(LC)
  end
end

-- handle mouse activities.
EnablePrimaryMouseButtonEvents(true);
function OnEvent(event, arg)
  if IsModifierPressed(LockKey) then
    repeat
      if IsMouseButtonPressed(RC) then
        repeat
          if IsMouseButtonPressed(LC) then
            NoRecoil()
          else
            Sleep(2)
          end
        until not IsMouseButtonPressed(RC)
      end
    until not IsModifierPressed(LockKey)
  end
end
