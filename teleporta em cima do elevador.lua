-- Coordenadas para teleporte
local targetPosition = Vector3.new(4.62, 35.44, -7.62)

-- Função para teleporte e criação da part
local function teleportAndCreatePart()
    -- Aguarde o personagem do jogador carregar
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    -- Aguarde o HumanoidRootPart carregar
    local rootPart = character:WaitForChild("HumanoidRootPart")

    -- Teleporte o jogador
    rootPart.CFrame = CFrame.new(targetPosition)

    -- Crie uma part embaixo dos pés do jogador
    local part = Instance.new("Part")
    part.Size = Vector3.new(5, 1, 5) -- Tamanho do bloco
    part.Position = Vector3.new(targetPosition.X, targetPosition.Y - 2.5, targetPosition.Z) -- Posição abaixo dos pés
    part.Anchored = true -- Fixa a parte no lugar
    part.BrickColor = BrickColor.new("Bright blue") -- Cor opcional
    part.Parent = workspace -- Adicione ao workspace

    print("Teleportado e bloco criado embaixo dos pés.")
end

-- Execute a função toda vez que o personagem renascer
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    teleportAndCreatePart()
end)

-- Execute a função pela primeira vez
teleportAndCreatePart()
