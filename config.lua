-- 🔫 Roblox 自動瞄準最近玩家頭部腳本
-- 作者：V概 & ChatGPT

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

-- 右鍵按下時觸發
mouse.Button2Down:Connect(function()
	local character = player.Character
	if not character or not character:FindFirstChild("Head") then return end

	local playerHead = character.Head
	local nearestPlayer = nil
	local shortestDistance = math.huge

	-- 尋找最近的其他玩家
	for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
		if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Head") then
			local otherHead = otherPlayer.Character.Head
			local distance = (otherHead.Position - playerHead.Position).Magnitude

			if distance < shortestDistance then
				shortestDistance = distance
				nearestPlayer = otherPlayer
			end
		end
	end

	-- 對準最近玩家的頭部
	if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChild("Head") then
		local targetHead = nearestPlayer.Character.Head
		camera.CFrame = CFrame.new(camera.CFrame.Position, targetHead.Position)
	end
end)

