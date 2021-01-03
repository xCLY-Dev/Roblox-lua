--HTTP JSON GAMELİST [ ]
--Execute [ ]

local function httpGet(link)
    local studio = game:GetService("RunService"):IsStudio();
    if studio then
        return game.ReplicatedStorage.ReturnGames:InvokeServer(link)
    else
        return game:HttpGet(link)
    end
end

local loadstring = function(x)
    local studio = game:GetService("RunService"):IsStudio();
    if studio then
        return game.ReplicatedStorage.ReturnGames:InvokeServer(x)
    else
        return loadstring(x)
    end
end

local function search_for_Games()
    local games = httpGet("https://raw.githubusercontent.com/xCLY-Dev/videoders/main/games.json")
    local decoded = game:GetService("HttpService"):JSONDecode(games)
    for i,v in pairs(decoded) do
        if v.script and v.gameid == game.GameId then
            return i, true, v.script
        end
    end
    return "no game found", false, nil
end

local index, gstatus, scr = search_for_Games()
if gstatus then
    loadstring(httpGet(scr))()
else
    wait(1)
    print("bulundamadı")
end
