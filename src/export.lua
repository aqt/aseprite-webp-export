-- Create a new RGB sprite based on the indexed sprite
local function createRGBSpriteFromIndexed(indexedSprite)
  -- Create a new sprite with RGB mode instead of indexed
  local spec = indexedSprite.spec
  spec.colorMode = ColorMode.RGB
  local rgbSprite = Sprite(spec)

  -- Copy the indexed sprite to the RGB sprite, layer by layer
  for _, layer in ipairs(indexedSprite.layers) do
    local newLayer = rgbSprite:newLayer()
    newLayer.name = layer.name

    for _, cel in ipairs(layer.cels) do
      local frame = cel.frame
      local newCel = rgbSprite:newCel(newLayer, frame)
      newCel.image:drawSprite(indexedSprite, frame)
    end
  end

  -- Flatten all layers into one, to circumvent a warning about webp not
  -- supporting them
  rgbSprite:flatten()

  return rgbSprite
end

-- Prompt the user to choose a save location
local function promptSaveLocation(filename)
  -- Create a suggested file name based on the open file
  local suggestedFilename

  if not filename then
    -- I don't know if this is possible, a new project is named "Sprite-0001"
    suggestedFilename = "untitled.webp"
  else
    suggestedFilename = filename:gsub("%.[^.]*$", "") .. ".webp"
  end

  local dlg = Dialog {
    title = "Export WebP"
  }

  dlg:file {
    id = "saveFile",
    label = "Save as file:",
    save = true,
    filename = suggestedFilename,
    filetypes = { "WebP files", "*.webp" }
  }

  dlg:button {
    id = "confirm",
    text = "Confirm",
    focus = true
  }

  dlg:button {
    id = "cancel",
    text = "Cancel"
  }

  dlg:show()

  if dlg.data.confirm then
    return dlg.data.saveFile
  else
    return nil
  end
end

local function exportSprite()
  local sprite = app.activeSprite

  local filePath = promptSaveLocation(sprite.filename)

  if not filePath then
    return
  end

  -- Create an RGB copy of the active sprite
  local tempSprite = createRGBSpriteFromIndexed(sprite)
  -- Save can fail if user denies security prompt
  pcall(function() tempSprite:saveCopyAs(filePath) end)
  tempSprite:close()
end

function init(plugin)
  plugin:newCommand {
    id = "export",
    title = "Export indexed WebP",
    group = "file_export",
    onclick = exportSprite,
    onenabled = function()
      if not app.activeSprite then
        -- No project active
        return false
      end

      local sprite = app.activeSprite
      return sprite.colorMode == ColorMode.INDEXED
    end
  }
end
