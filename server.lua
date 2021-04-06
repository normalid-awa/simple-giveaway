--倒卖死全家 
--resell die mom
ESX = nil 
Citizen.CreateThread(function() 
while ESX == nil do 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
Citizen.Wait(0) 
end 
end)
codeusetime = nil
RegisterNetEvent("checkcode")
-- The event handler function follows after registering the event first.
AddEventHandler("checkcode", function(code)
    if code == Config.code then
        xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.fetchAll('SELECT * FROM codeuse WHERE id = @id',{
            ['@id'] = xPlayer.getIdentifier()
        },
        function (result)
            if result[1] == nil then
            else
            codeusetime = (result[1].usetime)
            end

            if result[1] == nil then 
                MySQL.Async.execute('INSERT INTO codeuse (id, usetime) VALUES (@id, @usetime)',{ 
                    ['id'] = xPlayer.getIdentifier(),
                    ['usetime'] = 1
                })
            xPlayer.addMoney(Config.money)
            TriggerClientEvent('codechat', -1 ,_U("Successfully"))
            elseif codeusetime < Config.Maxuse then
                MySQL.Async.execute('UPDATE codeuse SET usetime = @usetime WHERE id = @id',{ 
                    ['@usetime'] = codeusetime + 1,
                    ['@id'] = xPlayer.getIdentifier()
                })
                xPlayer.addMoney(Config.money)
                TriggerClientEvent('codechat', -1 ,_U("Successfully"))
            elseif codeusetime == Config.Maxuse then
                TriggerClientEvent('codechat', -1 ,_U("max_use"))
            end
        end)
    else
        TriggerClientEvent('codechat', -1 ,_U("error"))
    end
end)


