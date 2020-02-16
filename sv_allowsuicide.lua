local allowsui = CreateConVar("sv_allowsuicide","2",{FCVAR_REPLICATED,FCVAR_NOTIFY})

hook.Add("CanPlayerSuicide","sv_allowsuicide command",function(ply)
   if allowsui:GetInt() == 0 then
       ply:SendLua("GAMEMODE:AddNotify(\"Üzgünüm, bunu yapmana izin veremem!\",1,3) surface.PlaySound('buttons/button10.wav')")
       return false
   elseif allowsui:GetInt() == 1 then
       --return true
   elseif allowsui:GetInt() == 2 then
       if not ply:IsAdmin() then
           ply:SendLua("GAMEMODE:AddNotify(\"Üzgünüm, bunu yapmana izin veremem!\",1,3) surface.PlaySound('buttons/button10.wav')")
           return false
       end
   end
end)