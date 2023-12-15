-- perfect setting for me - 19/03/2022.
-- res: 1680x1050 (16:10).
-- dpi: 2400, poll rate: 1000.

-- toggle script key.
LockKey = "scrolllock"
-- left click - fire button.
LC = 1
-- right click - ads button.
RC = 3
-- no recoil amount. NOTE: higher the value the more screen shaking there is.
RecoilAmount = 10
-- pull down speed. NOTE: this value only works for circle motion aiming technique, higher the value the more quicker it pulls down.
PullRate = 7
-- sleep amount.
SleepAmount = 9

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
    if IsMouseButtonPressed(RC) then
      repeat
        if IsMouseButtonPressed(LC) then
          NoRecoil()
        else
          Sleep(2)
        end
      until not IsMouseButtonPressed(RC)
    end
  end
end