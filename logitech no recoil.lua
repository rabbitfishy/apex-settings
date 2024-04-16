-- perfect setting for me - 16/04/2024.
-- res: 1728x1050 (16:10).
-- dpi: 2400, poll rate: 1000.

-- toggle script key.
local LockKey = "pgdn" -- "scrolllock" -> scroll lock | "pgdn" -> page down key.
-- left click - fire button.
local LC = 1
-- right click - ads button.
local RC = 3
-- no recoil amount. NOTE: higher the value the more screen shaking there is.
local RecoilAmount = 10
-- pull down speed. NOTE: this value only works for circle motion aiming technique, higher the value the more quicker it pulls down.
local PullRate = 0
-- sleep amount.
local SleepAmount = 10

-- main no recoil script function.
function NoRecoil()
  if IsMouseButtonPressed(LC) then
    repeat
      -- uncomment/comment any of these no recoil functions to fit your playstyle.

      -- this is for other fps shooters. (for other games)
      -- MoveMouseRelative(1, RecoilAmount)
      -- Sleep(SleepAmount)
      -- MoveMouseRelative(0, PullRate)
      -- Sleep(SleepAmount)

      -- jitter aiming technique. (Apex only)
      -- MoveMouseRelative(-RecoilAmount, RecoilAmount)
      -- Sleep(SleepAmount)
      -- MoveMouseRelative(0, PullRate)
      -- Sleep(SleepAmount)
      -- MoveMouseRelative(RecoilAmount, -RecoilAmount)
      -- Sleep(SleepAmount)
      
      -- if you move your mouse in a circle motion, it acts like your compensating recoil. (Apex only)
      MoveMouseRelative(0, RecoilAmount)
      Sleep(SleepAmount)
      MoveMouseRelative(RecoilAmount, PullRate)
      Sleep(SleepAmount)
      MoveMouseRelative(0, -RecoilAmount)
      Sleep(SleepAmount)
      MoveMouseRelative(-RecoilAmount, PullRate)
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
