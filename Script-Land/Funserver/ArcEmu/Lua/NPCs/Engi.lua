{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\f0\fs20 function Engi_oncombat(pUnit, event)\par
 setvars(pUnit, \{summhap=0, oilhap=0\});\par
pUnit:RegisterEvent("Engi_fire", 9000, 0)\par
pUnit:RegisterEvent("Engi_summ", 1000, 0)\par
pUnit:RegisterEvent("Engi_oil", 1000, 0)\par
end\par
\par
function Engi_summ(pUnit, event)\par
local args = getvars(pUnit)\par
local targ = pUnit:GetMainTank()\par
local tx = targ:GetX()\par
local ty = targ:GetY()\par
local tz = targ:GetZ()\par
local randist = math.random(1, 2)\par
 if pUnit:GetHealthPct() <= 5 and (args.sumhap == 0) then\par
pUnit:SendChatMessage(16, 0, "Venture Co. Engineer summons a Remote-Controlled Golem!")\par
pUnit:SpawnCreature(20001, tx+randist, ty+randist, tz, 41, 32000)\par
pUnit:RegisterEvent("Engi_summmark", 500, 1)\par
else\par
end\par
end\par
\par
function Engi_summmark(pUnit, event)\par
\tab local args = getvars(pUnit);\par
\tab args.sumhap=1;\par
\tab setvars(pUnit, args);\par
end\par
\par
function Engi_fire(pUnit, event)\par
local rand = math.random(1, 10)\par
local firetarg = pUnit:GetMainTank()\par
 if rand <= 4 and (firetarg ~= nil) then \par
pUnit:FullCastSpellOnTarget(20823, firetarg)\par
        else\par
    end\par
end\par
\par
function Engi_oil(pUnit, event)\par
local args = getvars(pUnit);\par
local oiltarg = pUnit:GetMainTank() \par
 if (oiltarg ~= nil) and (args.oilhap == 0) and pUnit:GetHealthPct() <= 40 then\par
pUnit:FullCastSpellOnTarget(50269, oiltarg)\par
pUnit:RegisterEvent("Engi_oilmark", 500, 1)\par
        else\par
    end\par
end\par
\par
function Engi_oilmark(pUnit, event)\par
\tab local args = getvars(pUnit);\par
\tab args.oilhap=1;\par
\tab setvars(pUnit, args);\par
end\par
\par
function Engi_leavecombat(pUnit, event)\par
\tab pUnit:RemoveEvents()\par
end\par
\par
function Engi_died(pUnit, event)\par
\tab pUnit:RemoveEvents()\par
end\par
\par
RegisterUnitEvent(20000, 1, "Engi_oncombat")\par
RegisterUnitEvent(20000, 2, "Engi_leavecombat")\par
RegisterUnitEvent(20000, 4, "Engi_died")\par
}
 