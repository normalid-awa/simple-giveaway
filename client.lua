--倒卖死全家 
--resell die mom
RegisterCommand("code",function(args,rawCommand)
    TriggerServerEvent("checkcode",rawCommand[1])
end)
RegisterNetEvent("codechat")
-- -- The event handler function follows after registering the event first.
AddEventHandler("codechat", function(msg)
TriggerEvent('chat:addMessage', {
    color = { 255, 0, 0},
    multiline = true,
    args = {_U('system'), msg }
  })
end)