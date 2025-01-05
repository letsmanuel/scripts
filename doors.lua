local INPUTOFKEYFIELD = ""
local DidLoadProData = false

local player = game.Players.LocalPlayer

-- Ensure that PlayerData exists in the Player
local playerData = player:FindFirstChild("PlayerData") or Instance.new("Folder", player)
playerData.Name = "PlayerData"

-- Function to save data
local function saveData(key, value)
    -- Store data as an attribute for this session
    playerData:SetAttribute(key, value)
end

-- Function to load data
local function loadData(key)
    -- Retrieve data from PlayerData
    local value = playerData:GetAttribute(key)
    
    -- Return nil if no data is found for the key
    if value == nil then
        return nil
    end
    
    return value
end

-- Example usage
saveData("PlayerScore", 100)  -- Save score
local LOADEDKEY = loadData("DOORSSCRIPTKEY")  -- Load score


if LOADEDKEY then
    DidLoadProData = true
end
-------------------------------------------------------------------------------
--! json library
--! cryptography library
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--! platoboost library

--! configuration
local service = 916;  -- your service id, this is used to identify your service.
local secret = "7a46bb35-a473-4765-98a3-495a4675442b";  -- make sure to obfuscate this if you want to ensure security.
local useNonce = true;  -- use a nonce to prevent replay attacks and request tampering.

--! callbacks
local onMessage = function(message) end;

--! wait for game to load
repeat task.wait(1) until game:IsLoaded();

--! functions
local requestSending = false;
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0;

--! pick host
local host = "https://api.platoboost.com";
local hostResponse = fRequest({
    Url = host .. "/public/connectivity",
    Method = "GET"
});
if hostResponse.StatusCode ~= 200 or hostResponse.StatusCode ~= 429 then
    host = "https://api.platoboost.net";
end

--!optimize 2
function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({
                service = service,
                identifier = lDigest(fGetHwid())
            }),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        });

        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body);

            if decoded.success == true then
                cachedLink = decoded.data.url;
                cachedTime = fOsTime();
                return true, cachedLink;
            else
                onMessage(decoded.message);
                return false, decoded.message;
            end
        elseif response.StatusCode == 429 then
            local msg = "you are being rate limited, please wait 20 seconds and try again.";
            onMessage(msg);
            return false, msg;
        end

        local msg = "Failed to cache link.";
        onMessage(msg);
        return false, msg;
    else
        return true, cachedLink;
    end
end

cacheLink();

--!optimize 2
local generateNonce = function()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97)
    end
    return str
end

--!optimize 1
for _ = 1, 5 do
    local oNonce = generateNonce();
    task.wait(0.2)
    if generateNonce() == oNonce then
        local msg = "platoboost nonce error.";
        onMessage(msg);
        error(msg);
    end
end

--!optimize 2
local copyLink = function()
    local success, link = cacheLink();
    
    if success then
        fSetClipboard(link);
    end
end

--!optimize 2
local redeemKey = function(key)
    local nonce = generateNonce();
    local endpoint = host .. "/public/redeem/" .. fToString(service);

    local body = {
        identifier = lDigest(fGetHwid()),
        key = key
    }

    if useNonce then
        body.nonce = nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "POST",
        Body = lEncode(body),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end    
                else
                    return true;
                end
            else
                onMessage("key is invalid.");
                return false;
            end
        else
            if fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
                onMessage("you already have an active key, please wait for it to expire before redeeming it.");
                return false;
            else
                onMessage(decoded.message);
                return false;
            end
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false; 
    end
end

--!optimize 2
local verifyKey = function(key)
    if requestSending == true then
        onMessage("a request is already being sent, please slow down.");
        return false;
    else
        requestSending = true;
    end

    local nonce = generateNonce();
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    requestSending = false;

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end
                else
                    return true;
                end
            else
                if fStringSub(key, 1, 4) == "KEY_" then
                    return redeemKey(key);
                else
                    onMessage("key is invalid.");
                    return false;
                end
            end
        else
            onMessage(decoded.message);
            return false;
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false;
    end
end

--!optimize 2
local getFlag = function(name)
    local nonce = generateNonce();
    local endpoint = host .. "/public/flag/" .. fToString(service) .. "?name=" .. name;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if useNonce then
                if decoded.data.hash == lDigest(fToString(decoded.data.value) .. "-" .. nonce .. "-" .. secret) then
                    return decoded.data.value;
                else
                    onMessage("failed to verify integrity.");
                    return nil;
                end
            else
                return decoded.data.value;
            end
        else
            onMessage(decoded.message);
            return nil;
        end
    else
        return nil;
    end
end
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--! platoboost usage documentation
-- copyLink() -> string
-- verifyKey(key: string) -> boolean
-- getFlag(name: string) -> boolean, string | boolean | number

-- use copyLink() to copy a link to the clipboard, in which the user will paste it into their browser and complete the keysystem.
-- use verifyKey(key) to verify a key, this will return a boolean value, true means the key was valid, false means it is invalid.
-- use getFlag(name) to get a flag from the server, this will return nil if an error occurs, if no error occurs, the value configured in the platoboost dashboard will be returned.

-- IMPORTANT: onMessage is a callback, it will be called upon status update, use it to provide information to user.
-- EXAMPLE: 
--[[
onMessage = function(message)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Platoboost status",
        Text = message
    })
end
]]--

-- NOTE: PLACE THIS ENTIRE SCRIPT AT THE TOP OF YOUR SCRIPT, ADD THE LOGIC, THEN OBFUSCATE YOUR SCRIPT.

--! example usage
--[[
copyButton.MouseButton1Click:Connect(function()
    copyLink();
end)

verifyButton.MouseButton1Click:Connect(function()
    local key = keyBox.Text;
    local success = verifyKey(key);

    if success then
        print("key is valid.");
    else
        print("key is invalid.");
    end
end)

local flag = getFlag("example_flag");
if flag ~= nil then
    print("flag value: " .. flag);
else
    print("failed to get flag.");
end
]]--
-------------------------------------------------------------------------------

local VIP

VIP = false

if DidLoadProData == true then
local USERHADOKKEY = verifyKey(LOADEDKEY);
if USERHADOKKEY then
    VIP = true
else
    VIP = false
end
end



local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local BypassEyesDamage = false





local function displayDoorsMessage(message, durationInMilliseconds)
  
    local durationInSeconds = durationInMilliseconds / 1000

    
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
  
    local mainUI = playerGui:WaitForChild("MainUI")
    local mainFrame = mainUI:WaitForChild("MainFrame")
    
   
    local caption = mainFrame:FindFirstChild("Caption")
    if caption then
       
        caption.Text = message
        caption.Visible = true
        
       
        local tweenService = game:GetService("TweenService")
        local tweenInfoIn = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local goalIn = {TextTransparency = 0}
        local tweenIn = tweenService:Create(caption, tweenInfoIn, goalIn)
        tweenIn:Play()
        
      
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://3848738542"
        sound.Parent = playerGui
        sound:Play()
        wait(durationInSeconds)
        local tweenInfoOut = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local goalOut = {TextTransparency = 1}
        local tweenOut = tweenService:Create(caption, tweenInfoOut, goalOut)
        tweenOut:Play()
        tweenOut.Completed:Wait()
        sound:Destroy()
        caption.Visible = false
    else
        warn("Caption not found!")
    end
end


local displayedPing = 0
local MissingOutOn = [[
* Spawn a Glitch Fragment
* Cruzify everything (Mobile Support)
* Bypass Screach / Snare / Giggle
* Bypass Eyes Damage
]]

local player = game.Players.LocalPlayer

local Window = Rayfield:CreateWindow({
    Name = "P6auls Doors Hub",
    Icon = "skull", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Give Credit!",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "p6aulsdoorshub."
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "P6auls Doors Hub",
       Subtitle = "Key Verification",
       Note = "In Beta. If you want, here is a key: 67890", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"p6aulsadmin","345345","12345", "67890", "23456", "98765", "34567", "45678", "56789", "87654", "54321", "65432", "76543", "43210", "21098", "10987", "32109", "89012", "67812", "45123", "85236", "96325", "74152", "85214", "95173", "75314", "12435", "65789", "78963", "96314", "35714", "25814", "35914", "74163", "25893", "14725", "36982", "58462", "91435", "63582", "52684", "18395", "29486", "57813", "96732", "31685", "92463", "17538", "38652", "51924", "84639", "13574", "39285", "67421"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local function create_notification(title, content, duration, image)
    Rayfield:Notify({
        Title = title or "Success",
        Content = content or "Error",
        Duration = duration or 3,
        Image = image or "badge-plus",
    })
end

local Godmode = false
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local doPingDetectionSetting = true

local originalPosition = nil

local ping = player:GetNetworkPing()

local TELEPORTGODMODESTORAGE
local TELEPORTGODMODEENDPOINT

-- humanoidRootPart.CFrame = CFrame.new(savedPosition)

local function godmode_tick()
    local PLAYER = game.Players.LocalPlayer
    local TRESHHOLD = 50
    local MAXPING = 400
    local godmodeA60 = workspace:FindFirstChild("A60") ~= nil
    local godmodeA120 = workspace:FindFirstChild("A120") ~= nil
    local godmodeRUSH = workspace:FindFirstChild("RushMoving") ~= nil
    local godmodeAMBUSH = workspace:FindFirstChild("AmbushMoving") ~= nil
    local GODMODEDANGER = false
    local POSITION = PLAYER.Character.HumanoidRootPart.Position
    local INAIR = false
    local ONGROUNDSAFELY = true
    

    if godmodeA120 == true or godmodeA60 == true or godmodeAMBUSH == true or godmodeRUSH == true then
        GODMODEDANGER = true
    end

    if GODMODEDANGER == true then
        if INAIR == false then
            INAIR = true
            TELEPORTGODMODESTORAGE = POSITION
            TELEPORTGODMODEENDPOINT = TELEPORTGODMODESTORAGE + Vector3.new(0, 50, 0)
        end

        ONGROUNDSAFELY = false
    
        PLAYER.Character.HumanoidRootPart.CFrame = CFrame.new(TELEPORTGODMODEENDPOINT)

    else

        if ONGROUNDSAFELY == false then
            ONGROUNDSAFELY = true
            PLAYER.Character.HumanoidRootPart.CFrame = CFrame.new(TELEPORTGODMODESTORAGE)
        end

        INAIR = false
        TELEPORTGODMODESTORAGE = ""

    end

    print(ONGROUNDSAFELY)
    print(TELEPORTGODMODESTORAGE)
    print(INAIR)
    print(GODMODEDANGER)
    print(godmodeA120)
    print(godmodeA60)
    print(godmodeAMBUSH)
    print(godmodeRUSH)

end

local godmode_crash_reason = ""

local function godmode_crash()
    Rayfield:Notify({
        Title = "Error",
        Content = "Godmode has an Error. Turn it off!",
        Duration = 7,
        Image = "badge-plus",
    })
    Rayfield:Notify({
        Title = "Details:",
        Content = godmode_crash_reason,
        Duration = 20,
        Image = "badge-plus",
    })
end

local function godmode_tick_handle()
    local success, errorMsg = pcall(function()
        godmode_tick()
    end)

    if not success then
        godmode_crash()
        godmode_crash_reason = errorMsg
    end
end




 Rayfield:Notify({
    Title = "Welcome back.",
    Content = "This script is still in Beta!",
    Duration = 6.5,
    Image = "badge-alert",
 })

if VIP == true then
 Rayfield:Notify({
    Title = "Thank you!",
    Content = "Thanks for supporting our development!",
    Duration = 6.5,
    Image = "badge-plus",
 })
 displayDoorsMessage("Your Premium Status was loaded!", 2000)
else
    Rayfield:Notify({
        Title = "Info:",
        Content = "You can support us by buying PRO and unlocking many BEAUTIFUL FEATURES!",
        Duration = 6.5,
        Image = "badge-plus",
    })
    displayDoorsMessage("This is a free Preview!", 1000)
    wait(1)
    displayDoorsMessage("Unlock all features by buying getting a FREE key!", 3000)
end

 local MainTab = Window:CreateTab("Script Hub", "archive") -- Title, Image

 local ExploitsSection = MainTab:CreateSection("Exploits")

 local headlight = false
 local headlightBrightness = 2
 local headlightRange = 16
 local speedBoost = false
 local speedBoostValue = 16
 local speedBoostDuringSeek = false

 local BlackKingLaunchButton = MainTab:CreateButton({
    Name = "Bobhub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkDoorsKing/Doors/main/Main"))()
    end,
 })

 local msdoorsLaunchButton = MainTab:CreateButton({
    Name = "Ms Doors (Outdated)",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua"),true))()
    end,
 })

 local neverlooseLaunchButton = MainTab:CreateButton({
    Name = "NeverLoose.xyz (Outdated)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/neverlose.xyz/main/Doors.lua"))()
    end,
 })

 local VYNIXIUSLaunchButton = MainTab:CreateButton({
    Name = "VYNIXIUS Doors",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
    end,
 })

 local crucifixAssetId = "rbxassetid://12309588188" -- Asset ID of the crucifix

-- Function to give the player the crucifix as a tool
local function giveCrucifix(player)
    -- Load the asset
    local success, crucifixModel = pcall(function()
        return game:GetService("InsertService"):LoadAsset(12309588188)
    end)

    if success and crucifixModel then
        -- Ensure the model is a valid object
        local tool = Instance.new("Tool")
        tool.Name = "Crucifix"
        tool.RequiresHandle = true -- Crucifix tool requires a handle to work
        tool.CanBeDropped = true
        tool.Grip = CFrame.new()

        -- Find the handle (usually a part that should be used as the "handle" for the tool)
        local handle = crucifixModel:FindFirstChildWhichIsA("BasePart")
        if handle then
            handle.Name = "Handle"  -- The tool requires a part named "Handle"
            handle.Parent = tool
        else
            print("Crucifix does not have a valid handle part.")
            return
        end

        -- Parent the model as a child of the Tool
        crucifixModel.Parent = tool

        -- Set the tool's parent to the player's backpack
        tool.Parent = player:WaitForChild("Backpack")

        -- Activate the click-to-delete functionality
        tool.Activated:Connect(function()
            -- When the tool is activated (clicked), check for the target
            local mouse = player:GetMouse()
            local target = mouse.Target

            -- If the target is a model, delete it
            if target and target.Parent and target.Parent:IsA("Model") then
                target.Parent:Destroy()  -- Deletes the entire model
            end
        end)
    else
        warn("Failed to load crucifix asset.")
    end
end

 local espObjects = {}

 -- Define colors for each model type
 local modelColors = {
     KeyObtain = Color3.fromRGB(255, 0, 0), -- Red
     LiveHintBook = Color3.fromRGB(0, 255, 0), -- Green
     Wardrobe = Color3.fromRGB(0, 0, 255), -- Blue
     Door = Color3.fromRGB(255, 255, 0), -- Yellow
     Dresser = Color3.fromRGB(255, 165, 0), -- Orange
     LeverForGate = Color3.fromRGB(128, 0, 128), -- Purple
     FigureRig = Color3.fromRGB(0, 255, 255), -- Cyan
     RushMoving = Color3.fromRGB(255, 0, 255), -- Magenta
     SeekMovingNewClone = Color3.fromRGB(128, 128, 0), -- Olive
     AmbushMoving = Color3.fromRGB(128, 0, 0), -- Dark Red
 }
 
 -- Function to create an ESP highlight with label
 local function create_esp(object, modelName)
     if not object:IsA("BasePart") then return end
 
     -- Highlight box
     local adornment = Instance.new("BoxHandleAdornment")
     adornment.Name = "ESPAdornment"
     adornment.Adornee = object
     adornment.AlwaysOnTop = true
     adornment.ZIndex = 10
     adornment.Size = object.Size + Vector3.new(0.1, 0.1, 0.1) -- Slightly larger than the object
     adornment.Color3 = modelColors[modelName] or Color3.new(1, 1, 1) -- Default to white if no color is defined
     adornment.Transparency = 0.5
     adornment.Parent = object
 
     -- Label
     local billboard = Instance.new("BillboardGui")
     billboard.Name = "ESPLabel"
     billboard.Adornee = object
     billboard.Size = UDim2.new(0, 75, 0, 25) -- Smaller text
     billboard.StudsOffset = Vector3.new(0, 2, 0) -- Position above the object
     billboard.AlwaysOnTop = true
 
     local textLabel = Instance.new("TextLabel")
     textLabel.Text = modelName
     textLabel.Size = UDim2.new(1, 0, 1, 0)
     textLabel.BackgroundTransparency = 1
     textLabel.TextColor3 = modelColors[modelName] or Color3.new(1, 1, 1)
     textLabel.TextScaled = true
     textLabel.Font = Enum.Font.SourceSansBold
     textLabel.TextSize = 14 -- Reduced text size
     textLabel.Parent = billboard
 
     billboard.Parent = object
 
     -- Track the object
     espObjects[object] = {adornment, billboard}
 end
 
 -- Function to remove all ESP highlights and labels
 local function remove_esp()
     for object, components in pairs(espObjects) do
         for _, component in ipairs(components) do
             if component and component.Parent then
                 component:Destroy()
             end
         end
     end
     espObjects = {}
 end
 
 -- Function to check recursively and apply ESP
 local function check_and_highlight(object)
     if object:IsA("Model") then
         -- Handle KeyObtain
         if object.Name == "KeyObtain" then
             local hitbox = object:FindFirstChild("Hitbox")
             if hitbox and hitbox:IsA("BasePart") then
                 local key = hitbox:FindFirstChild("Key")
                 if key and key:IsA("BasePart") and not espObjects[key] then
                     create_esp(key, "KeyObtain")
                 end
             end
         -- Handle other models
         elseif modelColors[object.Name] then
             local part = object.PrimaryPart or object:FindFirstChildWhichIsA("BasePart")
             if part and not espObjects[part] then
                 create_esp(part, object.Name)
             end
         end
     end
 
     -- Recursively check children
     for _, child in ipairs(object:GetChildren()) do
         check_and_highlight(child)
     end
 end
 
 -- Function to toggle ESP on
 local function toggle_esp_on()
     check_and_highlight(workspace)
 end

 local originalLightingData = {}

-- Function to save the current lighting properties
local function saveLightingData()
    originalLightingData = {}
    for _, property in ipairs({
        "Ambient",
        "Brightness",
        "ColorShift_Bottom",
        "ColorShift_Top",
        "EnvironmentDiffuseScale",
        "EnvironmentSpecularScale",
        "ExposureCompensation",
        "FogColor",
        "FogEnd",
        "FogStart",
        "GlobalShadows",
        "OutdoorAmbient",
        "ShadowSoftness",
    }) do
        originalLightingData[property] = game.Lighting[property]
    end
end

-- Function to restore the original lighting properties
local function restoreLightingData()
    for property, value in pairs(originalLightingData) do
        game.Lighting[property] = value
    end
end

-- Function to enable fullbright
local function enableFullbright()
    game.Lighting.Ambient = Color3.new(1, 1, 1) -- Pure white ambient light
    game.Lighting.Brightness = 10
    game.Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
    game.Lighting.ColorShift_Top = Color3.new(0, 0, 0)
    game.Lighting.EnvironmentDiffuseScale = 1
    game.Lighting.EnvironmentSpecularScale = 1
    game.Lighting.ExposureCompensation = 0
    game.Lighting.FogColor = Color3.new(1, 1, 1)
    game.Lighting.FogEnd = 100000 -- Effectively disables fog
    game.Lighting.FogStart = 0
    game.Lighting.GlobalShadows = false
    game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    game.Lighting.ShadowSoftness = 0
end

-- Variables to track the fullbright state
local isFullbrightEnabled = false

-- Function to toggle fullbright on and off
local function toggleFullbright()
    if isFullbrightEnabled then
        restoreLightingData()
    else
        enableFullbright()
    end
    isFullbrightEnabled = not isFullbrightEnabled
end

local function setupFullbright()
    saveLightingData() -- Start with fullbright enabled
end

setupFullbright()

local function setSpeed(player, speed)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        local humanoid = character:FindFirstChild("Humanoid")
        humanoid.WalkSpeed = speed
    end
end


 local function create_head_light(player)
    if player and player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head

        if head:FindFirstChild("HeadLight") then
            warn("Head light already exists!")
            return
        end

        local light = Instance.new("PointLight")
        light.Name = "HeadLight"
        light.Parent = head
        light.Range = headlightRange -- Adjust the range of the light
        light.Brightness = headlightBrightness -- Adjust the brightness of the light
        light.Color = Color3.new(1, 1, 1) -- White light
        print("Head light created!")
    else
    end
end

local function delete_head_light(player)
    if player and player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head

        local light = head:FindFirstChild("HeadLight")
        if light then
            light:Destroy()
        else
        end
    else
        warn("Player does not have a valid character or head.")
    end
end

 local ExploitTab = Window:CreateTab("Instant Exploit", "badge-plus") -- Title, Image

 local PremiumTab = Window:CreateTab("Premium Features", "coins") -- Title, Image

 local SettingsTab = Window:CreateTab("Settings", "lock-open") -- Title, Image

 local shownotificationsforsuccess = true
 local entitynotify = false
 local thirdPerson = false
 local thirdPersonEverTriggerd = false
 local notifiedthirdPerson = 0
 local Esp = false
 local seekExists = false

 local shownotificationsforsuccessToggle = SettingsTab:CreateToggle({
    Name = "Show success messages",
    CurrentValue = true,
    Flag = "shownotificationsforsuccessToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   shownotificationsforsuccess = Value
   if Value == true then
    displayDoorsMessage("Show success messages: ON", 1500)
   else
    displayDoorsMessage("Show success messages: OFF", 1500)
   end
    end,
 })

 local doPingSafetyToggle = SettingsTab:CreateToggle({
    Name = "Detect Bad Wifi",
    CurrentValue = true,
    Flag = "doPingSafetyToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   doPingDetectionSetting = Value
   if Value == true then
    displayDoorsMessage("Detect Bad Wifi: ON", 1500)
   else
    displayDoorsMessage("Detect Bad Wifi: OFF", 1500)
   end
    end,
 })





 if VIP == true then
 local getFragmentButton = PremiumTab:CreateButton({
    Name = "Summon Glitch Fragment (Run before opening a door!)",
    Callback = function()
        Rayfield:Notify({
            Title = "INFOS SOON",
            Content = "Starting in 3 seconds.",
            Duration = 3,
            Image = "coins",
         })
         wait(2)
         Rayfield:Notify({
            Title = "WARNING:",
            Content = "We will teleport you ontop of the roof. JUMP DOWN AS FAST AS YOU CAN!!!",
            Duration = 5,
            Image = "coins",
         })
         wait(5)
         Rayfield:Notify({
            Title = "Good luck!",
            Content = "Starting in 1 second!!",
            Duration = 5,
            Image = "coins",
         })
         wait(1)
         Rayfield:Notify({
            Title = "One Moment...",
            Content = "Summoning the Glitch Fragment... Please wait!",
            Duration = 25,
            Image = "coins",
         })
         for i = 1, 8 do
         for i = 1, 100 do
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, -5000, 0))  -- You can adjust the Y value for deeper teleportation
            wait(0)  -- Wait for the specified delay before the next teleport
        end
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 0, 100))  -- You can adjust the Y value for deeper teleportation
            wait(5)
    end

        Rayfield:Notify({
            Title = "Finished.",
            Content = "The Fragment should now be spawned.",
            Duration = 5,
            Image = "coins",
         })
    end,
 })

 local CruzifixGiverButton = PremiumTab:CreateButton({
    Name = "Give yourself a cruzifix",
    Callback = function()
        local shadow = game:GetObjects("rbxassetid://11498423088")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")
        local Debris = game:GetService("Debris")
        local UserInputService = game:GetService("UserInputService")
        local Plr = Players.LocalPlayer
        local Char = Plr.Character or Plr.CharacterAdded:Wait()
        local Hum = Char:WaitForChild("Humanoid")
        local RightArm = Char:WaitForChild("RightUpperArm")
        local LeftArm = Char:WaitForChild("LeftUpperArm")
        local RightC1 = RightArm.RightShoulder.C1
        local LeftC1 = LeftArm.LeftShoulder.C1
        
        local toolActive = false
        
        local function setupCrucifix(tool)
            print("Setting up crucifix tool")
            RightArm.Name = "R_Arm"
            LeftArm.Name = "L_Arm"
        
            RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
            LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))
        
            print("Stopped current animations")
            for _, v in next, Hum:GetPlayingAnimationTracks() do
                v:Stop()
            end
        end
        
        local function crucifyObject(target)
            if not target:IsA("BasePart") and not target:IsA("Model") then 
                print("Invalid target clicked: ", target.Name)
                return 
            end
        
            print("Crucifying object: ", target.Name)
        
            -- Add visual effects
            local glow = Instance.new("SelectionBox")
            glow.Adornee = target
            glow.LineThickness = 0.05
            glow.Color3 = Color3.fromRGB(0, 255, 255)
            glow.Parent = target
            print("Added glow effect to: ", target.Name)
        
            local particleEmitter = Instance.new("ParticleEmitter")
            particleEmitter.Texture = "rbxassetid://258128463" -- Example texture for a holy effect
            particleEmitter.Rate = 20
            particleEmitter.Lifetime = NumberRange.new(1)
            particleEmitter.Speed = NumberRange.new(0.5, 1)
            particleEmitter.Parent = target
            print("Added particle effect to: ", target.Name)
        
            -- Animate object flying into the void
            local targetPosition = target.Position - Vector3.new(0, 100, 0)
            local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear)
            local tween = TweenService:Create(target, tweenInfo, {Position = targetPosition})
        
            print("Started tween animation for: ", target.Name)
            tween:Play()
            
            -- Cleanup after effect
            tween.Completed:Connect(function()
                print("Object reached void and is being destroyed: ", target.Name)
                target:Destroy()
            end)
        
            Debris:AddItem(glow, 3) -- Automatically remove the glow after 3 seconds
            Debris:AddItem(particleEmitter, 3) -- Automatically remove particles after 3 seconds
        end
        
        shadow.Equipped:Connect(function()
            print("Equipped the shadow tool")
            setupCrucifix(shadow)
            game.Players.LocalPlayer:SetAttribute("Hidden", true)
            toolActive = true
        
            -- Create a listener for tapping/clicking objects
            local function onInputBegan(input, gameProcessed)
                if gameProcessed then return end
        
                if toolActive and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    local mouse = Plr:GetMouse()
                    if mouse.Target then -- Check if the mouse or touch is pointing at something
                        print("Tapped/Clicked on: ", mouse.Target.Name)
                        crucifyObject(mouse.Target) -- Apply crucifix effect
                    else
                        print("No valid target tapped/clicked")
                    end
                end
            end
        
            UserInputService.InputBegan:Connect(onInputBegan)
        end)
        
        shadow.Unequipped:Connect(function()
            print("Unequipped the shadow tool")
            game.Players.LocalPlayer:SetAttribute("Hidden", false)
            RightArm.Name = "RightUpperArm"
            LeftArm.Name = "LeftUpperArm"
        
            RightArm.RightShoulder.C1 = RightC1
            LeftArm.LeftShoulder.C1 = LeftC1
            print("Reset arm names and positions")
            toolActive = false
        end)
        
    end,
 })

local DividerPro1 = PremiumTab:CreateDivider()

--local GodModeToggle = PremiumTab:CreateToggle({
--    Name = "Godmode",
--    CurrentValue = false,
--    Flag = "GodModeToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
--    Callback = function(Value)
--    Godmode = Value
--    if shownotificationsforsuccess == true then
--   if Value == true then
--      Rayfield:Notify({
--            Title = "Success",
--            Content = "Godmode for Rush/Ambush is now on!",
--            Duration = 3,
--           Image = 4483362458,
--         })
--    else
--        Rayfield:Notify({
--            Title = "Success",
--            Content = "Godmode for Rush/Ambush is now off!",
--            Duration = 3,
--           Image = 4483362458,
 --        })
  --  end
--end
--    end,
-- })

--local EyesDamageBypassToggle = PremiumTab:CreateToggle({
--    Name = "Bypass Eyes Damage",
--    CurrentValue = false,
--    Flag = "EyesDamageBypassToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
--    Callback = function(Value)
--        BypassEyesDamage = Value
--        if Value == true then
--        
--            Rayfield:Notify({
--                Title = "Bypassing Eyes",
--                Content = "Ok, we are now bypassing Eyes.",
--                Duration = 4,
--                Image = "rewind",
--             })
--        
--        else
--
--            Rayfield:Notify({
--                Title = "Bypassing Eyes",
--                Content = "Ok, we are no longer bypassing Eyes.",
--               Duration = 4,
 --               Image = "rewind",
--             })
--
--        end
--    end,
-- })
else
    

    local titelPROnotbought = PremiumTab:CreateLabel("You have not bought Premium.", "rewind")
    local Paragraph = PremiumTab:CreateParagraph({Title = "What you are missing out for:", Content = MissingOutOn})
    local DividerPro11 = PremiumTab:CreateDivider()
    local GetAProKeyButton = PremiumTab:CreateButton({
        Name = "Get a PRO Key",
        Callback = function()
            copyLink()
        end,
    })
    local DividerPro12 = PremiumTab:CreateDivider()
    local LabelRedeemProKey = PremiumTab:CreateLabel("Redeem a PRO Key", 4483362458, Color3.fromRGB(255, 255, 255), false)
    local InputRedeemProKey = PremiumTab:CreateInput({
        Name = "Key Here",
        CurrentValue = "",
        PlaceholderText = "examplekey123",
        RemoveTextAfterFocusLost = false,
        Flag = "InputRedeemProKey",
        Callback = function(Text)
            INPUTOFKEYFIELD = Text
        end,
     })
     local ButtonRedeemProKey = PremiumTab:CreateButton({
        Name = "Redeem Key",
        Callback = function()
            local successManuelRedeemKey = verifyKey(INPUTOFKEYFIELD);
            if successManuelRedeemKey then
                saveData("DOORSSCRIPTKEY", INPUTOFKEYFIELD)
                displayDoorsMessage("Key redeemed. Restarting...", 1500)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/MicrobitApps/scripts/refs/heads/main/doors.lua",true))()
            else
                Rayfield:Notify({
                    Title = "Sorry",
                    Content = "This key seems to be invalid. Please try again.",
                    Duration = 6.5,
                    Image = "rewind",
                 })
            end
        end,
     })

end




 local knobstogive = 0

 local Slider = ExploitTab:CreateSlider({
    Name = "Amount of Gold",
    Range = {0, 10000},
    Increment = 100,
    Suffix = "Gold",
    CurrentValue = 100,
    Flag = "knobsajustwithbutton", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   knobstogive = Value
    end,
 })

 local GiveKnobsButton = ExploitTab:CreateButton({
    Name = "Give Gold!",
    Callback = function()
   game.Players.LocalPlayer.Gold.Value += knobstogive
   if shownotificationsforsuccess == true then

   create_notification("Success", "We gave you your gold!", 3, "badge-alert")

   end
    end,
 })

 local Divider = ExploitTab:CreateDivider()

 local rushNotifyToggle = ExploitTab:CreateToggle({
    Name = "Entity Notifier",
    CurrentValue = false,
    Flag = "shownotificationsforsuccessToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   entitynotify = Value
    end,
 })

 local thirdPersonToggle = ExploitTab:CreateToggle({
    Name = "Third Person Mode",
    CurrentValue = false,
    Flag = "thirdPersonToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        thirdPersonEverTriggerd = true
        thirdPerson = Value
    end,
 })

 local EspToggle = ExploitTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "EspToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Esp = Value
    end,
 })

 local FullbrightToggle = ExploitTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    	toggleFullbright()
    end,
 })

 local Divider1 = ExploitTab:CreateDivider()

 local MoveSpeedSlider = ExploitTab:CreateSlider({
    Name = "Player Speed",
    Range = {1, 60},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "MoveSpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        speedBoostValue = Value
    end,
 })

 local MoveSpeedToggle = ExploitTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = false,
    Flag = "MoveSpeedToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        speedBoost = Value
    end,
 })

 local MoveSpeedDuringSeekToggle = ExploitTab:CreateToggle({
    Name = "Apply during Seek Chase",
    CurrentValue = false,
    Flag = "MoveSpeedDuringSeekToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        speedBoostDuringSeek = Value
    end,
 })

 local Divider3 = ExploitTab:CreateDivider()

 local headLightPowerSlider = ExploitTab:CreateSlider({
    Name = "HeadLight Power",
    Range = {10, 100},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 16,
    Flag = "headLightPowerSlider", 
    Callback = function(Value)
    headLightPowerSlider = Value
    if headlight == true then
    delete_head_light(game.Players.LocalPlayer)
    create_head_light(game.Players.LocalPlayer)
    end
    end,
 })

 local headLightRangeSlider = ExploitTab:CreateSlider({
    Name = "HeadLight Range",
    Range = {10, 100},
    Increment = 1,
    Suffix = "Range",
    CurrentValue = 16,
    Flag = "headLightRangeSlider", 
    Callback = function(Value)
    headlightRange = Value
    if headlight == true then
    delete_head_light(game.Players.LocalPlayer)
    create_head_light(game.Players.LocalPlayer)
    end
    end,
 })

 local headLightToggle = ExploitTab:CreateToggle({
    Name = "Headlight",
    CurrentValue = false,
    Flag = "headLightToggle", 
    Callback = function(Value)
    if Value == false then
        headlight = false
        delete_head_light(game.Players.LocalPlayer)
    else
        headlight = true
        create_head_light(game.Players.LocalPlayer)
    end
    end,
 })

 local Divider2 = ExploitTab:CreateDivider()








 local notifiedModels = {}

 function check_for_rush_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "RushMoving" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Rush has spawned! Hide quickly!", 5, "alert-circle")
            print("rush")
            -- Mark this model as notified
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

function check_for_ambush_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "AmbushMoving" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Ambush has spawned! Hide quickly!", 5, "alert-circle")
            print("ambush")
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

function check_for_a60_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "A60" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "A60 has spawned! Hide quickly!", 5, "alert-circle")
            print("a60")
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

function check_for_a120_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "A120" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "A120 has spawned! Hide quickly!", 5, "alert-circle")
            print("a120")
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

function check_for_seek_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "SeekMovingNewClone" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Seek has spawned! Run quickly!", 5, "alert-circle")
            if speedBoostDuringSeek == false and speedBoost == true then
                setSpeed(game.Players.LocalPlayer, 15)
                create_notification("Warning!", "Due to your settings, SpeedBoost is temporarily disabled.", 6, "alert-circle")
            end
            print("seek")
            seekExists = true
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       seekExists = false
    end
end

function check_for_eyes()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "Eyes" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Eyes has spawned! Look away!", 5, "alert-circle")
            print("eyes")
            -- Mark this model as notified
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

local function calculatePingNotifier()
    local ping = player:GetNetworkPing()
    if ping >= 500 and not displayedPing == 1 then
        displayedPing = 1
        displayDoorsMessage("Extreme Ping! 500+", 2000)
    elseif ping >= 200 and not displayedPing == 2 then
        displayedPing = 2
        displayDoorsMessage("High ping! 200+ Play Careful!", 2000)
    elseif ping <= 199 and displayedPing == 1 or ping <= 199 and displayedPing == 2 then
        displayedPing = 2
        displayDoorsMessage("Ping is now back to normal.", 2000)
    end
end



while true do
    if entitynotify == true then
    check_for_rush_moving()
    check_for_seek_moving()
    check_for_ambush_moving()
    check_for_a60_moving()
    check_for_a120_moving()
    check_for_eyes()
    end
    if thirdPerson == true and thirdPersonEverTriggerd == true then
        if shownotificationsforsuccess == true and notifiedthirdPerson == 0 then
            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
            notifiedthirdPerson = 1
            create_notification("Success", "You are now in Third Person. If not, try to toggle again!", 3, "badge-alert")
        end
    elseif thirdPersonEverTriggerd == true then
        if shownotificationsforsuccess == true and notifiedthirdPerson ==  1 then
            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
            notifiedthirdPerson = 0
            create_notification("Success", "You are now in First Person. If not, try to toggle again!", 3, "badge-alert")
        end
    end
    if Esp == true then
        toggle_esp_on()
    else
        remove_esp()
    end
    if speedBoost == true then

        if seekExists == false or speedBoostDuringSeek == true then
            setSpeed(game.Players.LocalPlayer, speedBoostValue)
        end

    elseif seekExists == false then
        setSpeed(game.Players.LocalPlayer, 15)
    end

    if Godmode == true then
        godmode_tick_handle()
    end

    local ping = player:GetNetworkPing()
    if doPingDetectionSetting == true then
        calculatePingNotifier()
    end

    if BypassEyesDamage == true and (workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman")) then
        game.ReplicatedStorage.RemotesFolder.MotorReplication:FireServer(-649)
        print('Looser eyes!!')
    end

    task.wait(0.1)
end


onMessage = function(message)
    Rayfield:Notify({
        Title = "Server Message",
        Content = message,
        Duration = 5,
        Image = "rewind",
     })
end
