local tArgs = {...}
b = tArgs[1] % 2
 
function moveDown()
        while turtle.down() == false do
                turtle.attack()
        end
end
 
function moveForward()
        while turtle.forward() == false do
                turtle.attack()
                turtle.dig()
        end
        checkSpace()
end
 
function checkSpace()
        if turtle.getItemCount(15) > 0 then
                while turtle.detectUp() == true do
                        turtle.digUp()
                        turtle.detectUp()
                end
                while turtle.attackUp() == true do
                        turtle.attackUp()
                end
                turtle.select(16)
                turtle.placeUp()
                emptyInv()
                turtle.select(16)
                turtle.digUp()
                turtle.select(1)
        end
end
 
function emptyInv()
        for i = 1, 15 do
                turtle.select(i)
                turtle.dropUp()
        end
end
 
function digLayerOne()
        local stripNum = 2
        turtle.digDown()
        moveDown()
        turtle.digDown()
        moveDown()
        turtle.digDown()
        for i = 1, tArgs[1] do
                for i = 1, tArgs[1] - 1 do
                        turtle.dig()
                        moveForward()
                        turtle.digUp()
                        turtle.digDown()
                end
                if stripNum == tArgs[1] + 1 then
                        turtle.turnRight()
                        turtle.turnRight()
                        moveDown()
                        break
                elseif stripNum % 2 == 0 then
                        turtle.turnRight()
                        turtle.dig()
                        moveForward()
                        turtle.turnRight()
                        turtle.digUp()
                        turtle.digDown()
                        stripNum = stripNum + 1
                elseif stripNum % 2 == 1 then
                        turtle.turnLeft()
                        turtle.dig()
                        moveForward()
                        turtle.turnLeft()
                        turtle.digUp()
                        turtle.digDown()
                        stripNum = stripNum + 1
                end
        end
end
 
function digLayerTwo()
        local stripNum = 2
        turtle.digDown()
        moveDown()
        turtle.digDown()
        moveDown()
        turtle.digDown()
        for i = 1, tArgs[1] do
                for i = 1, tArgs[1] - 1 do
                        turtle.dig()
                        moveForward()
                        turtle.digUp()
                        turtle.digDown()
                end
                if stripNum == tArgs[1] + 1 then
                        turtle.turnRight()
                        turtle.turnRight()
                        moveDown()
                        break
                elseif stripNum % 2 == 1 then
                        turtle.turnRight()
                        turtle.dig()
                        moveForward()
                        turtle.turnRight()
                        turtle.digUp()
                        turtle.digDown()
                        stripNum = stripNum + 1
                elseif stripNum % 2 == 0 then
                        turtle.turnLeft()
                        turtle.dig()
                        moveForward()
                        turtle.turnLeft()
                        turtle.digUp()
                        turtle.digDown()
                        stripNum = stripNum + 1
                end
        end
end
 
 
while b == 1 do
        digLayerOne()
end
 
while b == 0 do
        digLayerOne()
        digLayerTwo()
end