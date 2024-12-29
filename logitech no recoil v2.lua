-- perfect setting for me - 25/12/2024.
-- res: 1728x1080 (16:10).
-- dpi: 2400, poll rate: 1000.

-- NOTE!
-- GHub is unable to monitor status of usual keys on a keyboard.
-- It does not see whether Backspace is pressed or not.
-- It can see only mouse buttons, Shift/Ctrl/Alt, Locks(Scroll/Caps/Num).

-- IsModifierPressed -> if key held then do action.
-- IsKeyLockOn -> if toggle key pressed then do action.

-- script activation key - only certain key name works.
local LockKey = "capslock" -- "scrolllock" -> scroll lock | "capslock" -> caps lock key.
-- left click - fire button.
local LC = 1
-- right click - ads button.
local RC = 3
-- no recoil amount. NOTE: higher the value the more screen shaking there is.
local PreRecoilAmount = 4
local RecoilAmount = 8
-- pull down speed. NOTE: this value works on circle motion aiming technique aswell, higher the value the more quicker it pulls down.
local PullRate = 0
-- sleep amount.
local SleepAmount = 10 -- 3

-- main no recoil script function.
function NoRecoil()
  if IsMouseButtonPressed(LC) then
      MoveMouseRelative(PreRecoilAmount, -PreRecoilAmount)
  repeat
      MoveMouseRelative(-RecoilAmount, RecoilAmount)
      Sleep(SleepAmount)
      -- MoveMouseRelative(0, PullRate)
      -- Sleep(SleepAmount)
      MoveMouseRelative(RecoilAmount, -RecoilAmount)
      Sleep(SleepAmount)
    until not IsMouseButtonPressed(LC)
  end
end

-- handle mouse activities.
EnablePrimaryMouseButtonEvents(true);
function OnEvent(event, arg)
  if IsKeyLockOn(LockKey) then
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
    until not IsKeyLockOn(LockKey)
  end
end
