LevelUpState = Class{__includes = BaseState}


function LevelUpState:init(stats, onClose)
    self.name = "LevelUpState"
    self.onClose = onClose or function() end

    self.levelUpMenu = Menu {
      x = VIRTUAL_WIDTH - 164,
      y = VIRTUAL_HEIGHT - 128,

      width = 164,
      height = 128,
      Cursor = false,
      items = self:statsToItems(stats)
    }
end

function LevelUpState:statsToItems(stats)
    local items = {
      {
        text = 'HP: '
      },
      {
        text = "ATT: "
      },
      {
        text = "DEF: "
      },
      {
        text = "SPED: "
      }
    }

    for i, stat in ipairs(stats) do
      items[i].text = items[i].text .. tostring(stat.base) .. ' + ' .. tostring(stat.add) .. ' = ' .. tostring(stat.base + stat.add)
    end

    return items
end

function LevelUpState:update(dt)
  self.levelUpMenu:update(dt)

  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('space') or love.keyboard.wasPressed('return') then
    gStateStack:pop()
    self.onClose()
  end

end

function LevelUpState:render()
  self.levelUpMenu:render()
end
