-- Функция для создания сегмента палки
local function createSegment(position, rotation)
    local segment = Instance.new("Part")
    segment.Size = Vector3.new(1, 1, 5) -- Размер сегмента
    segment.Position = position -- Позиция сегмента
    segment.Anchored = true -- Закрепляем сегмент
    segment.Material = Enum.Material.Neon -- Устанавливаем материал на Neon
    segment.BrickColor = BrickColor.Random() -- Устанавливаем случайный цвет
    segment.Parent = game.Workspace

    -- Поворачиваем сегмент
    segment.CFrame = CFrame.new(position) * CFrame.Angles(0, math.rad(rotation), 0)

    return segment
end

-- Создание согнутой палки
local segments = {}
local startPosition = Vector3.new(0, 5, 0)
local angleIncrement = 15 -- Угол поворота для каждого сегмента
local segmentCount = 12 -- Количество сегментов

for i = 0, segmentCount - 1 do
    local angle = angleIncrement * i
    local positionOffset = Vector3.new(0, 0, -i * 5) -- Смещение по оси Z
    local segmentPosition = startPosition + positionOffset
    table.insert(segments, createSegment(segmentPosition, angle))
end

-- Функция для изменения цвета
local function changeColor()
    while true do
        for _, segment in ipairs(segments) do
            segment.BrickColor = BrickColor.Random() -- Устанавливаем случайный цвет для каждого сегмента
        end
        wait(0.5) -- Задержка перед сменой цвета
    end
end

-- Запускаем функцию изменения цвета в отдельном потоке
coroutine.wrap(changeColor)()

-- Функция для перемещения палки
local function onPartClicked()
    for _, segment in ipairs(segments) do
        segment.Position = segment.Position + Vector3.new(0, 0, 5) -- Перемещение каждого сегмента на 5 единиц вперед
    end
end

-- Добавление ClickDetector к первому сегменту
local clickDetector = Instance.new("ClickDetector")
clickDetector.Parent = segments[1] -- Привязываем ClickDetector к первому сегменту
clickDetector.MouseClick:Connect(onPartClicked)

