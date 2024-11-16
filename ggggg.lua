-- Создание объекта в форме стола
local tablePart = Instance.new("Part")
tablePart.Size = Vector3.new(10, 1, 6) -- Размер стола (ширина, высота, глубина)
tablePart.Position = Vector3.new(0, 5, 0) -- Позиция объекта
tablePart.Anchored = false -- Делаем объект перемещаемым
tablePart.CanCollide = true -- Объект может сталкиваться с другими объектами
tablePart.Material = Enum.Material.Neon -- Устанавливаем материал на Neon для эффектного вида
tablePart.BrickColor = BrickColor.Random() -- Устанавливаем начальный случайный цвет
tablePart.Parent = game.Workspace

-- Функция для изменения цвета
local function changeColor()
    while true do
        tablePart.BrickColor = BrickColor.Random() -- Устанавливаем случайный цвет
        wait(0.5) -- Задержка перед сменой цвета
    end
end

-- Запускаем функцию изменения цвета в отдельном потоке
coroutine.wrap(changeColor)()

-- Функция для перемещения объекта
local function onPartClicked()
    tablePart.Position = tablePart.Position + Vector3.new(0, 0, 5) -- Перемещение объекта на 5 единиц вперед
end

-- Добавление ClickDetector для перемещения объекта
local clickDetector = Instance.new("ClickDetector")
clickDetector.Parent = tablePart -- Привязываем ClickDetector к объекту
clickDetector.MouseClick:Connect(onPartClicked)


