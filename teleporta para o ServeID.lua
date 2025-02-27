-- Serviços necessários
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Criação da Interface
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

-- Propriedades da ScreenGui
ScreenGui.Name = "ServerTeleportUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Propriedades do Frame
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Frame.Position = UDim2.new(0.5, -130, 0.5, -75)
Frame.Size = UDim2.new(0, 260, 0, 150)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Propriedades do Título
Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Teleportar Servidor"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18

-- Propriedades do TextBox
TextBox.Name = "ServerIdBox"
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.25, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Digite o ID do servidor"
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.TextSize = 16

-- Propriedades do Botão
Button.Name = "ConfirmButton"
Button.Parent = Frame
Button.BackgroundColor3 = Color3.new(0.1, 0.6, 0.1)
Button.Position = UDim2.new(0.275, 0, 0.7, 0)
Button.Size = UDim2.new(0.45, 0, 0.25, 0)
Button.Font = Enum.Font.SourceSansBold
Button.Text = "Confirmar"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 16

-- Função para teleportar para o servidor especificado
local function teleportToServer(serverId)
    if serverId and serverId ~= "" then
        local placeId = game.PlaceId -- ID do lugar atual

        -- Verifica se o servidor é público e tenta teleportar
        local success, errorMessage = pcall(function()
            TeleportService:TeleportToPlaceInstance(placeId, serverId, Players.LocalPlayer)
        end)

        if success then
            print("Teleportando para o servidor:", serverId)
        else
            warn("Erro ao tentar teleportar: " .. tostring(errorMessage))
        end
    else
        warn("ID do servidor inválido.")
    end
end

-- Ação do botão
Button.MouseButton1Click:Connect(function()
    local serverId = TextBox.Text -- Obtém o ID do servidor digitado
    teleportToServer(serverId) -- Chama a função de teleporte

    -- Deletar a interface após o clique
    ScreenGui:Destroy()
end)
