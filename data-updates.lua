-- data-updates.lua

-- Tellus science packs to rebalance.
local science_packs = {
  "planetaris-bioengineering-science-pack",
  "planetaris-pathological-science-pack",
}

local ingredient_multiplier = settings.startup["tellus-science-rebalance-ingredient-multiplier"].value
local time_multiplier = settings.startup["tellus-science-rebalance-time-multiplier"].value

-- Factorio 2.1 (2.1.7+) changed science packs from "tool" to plain "item"
-- prototypes, and data.raw.tool may not exist at all. Check both so the
-- lookup works whichever type Tellus uses.
local function find_pack(name)
  return (data.raw["item"] and data.raw["item"][name])
      or (data.raw["tool"] and data.raw["tool"][name])
end

for _, name in ipairs(science_packs) do
  local pack = find_pack(name)
  if not pack then
    error("tellus-science-rebalance: science pack '" .. name .. "' not found. Is Planetaris: Tellus up to date?")
  end

  -- Disable spoilage so the pack keeps indefinitely. The pathological pack
  -- spoils via spoil_to_trigger_result (it spawns wasps), so clear that too.
  pack.spoil_ticks = nil
  pack.spoil_result = nil
  pack.spoil_to_trigger_result = nil

  -- Nerf the recipe: longer craft time and more ingredients.
  local recipe = data.raw["recipe"][name]
  if not recipe then
    error("tellus-science-rebalance: recipe '" .. name .. "' not found. Is Planetaris: Tellus up to date?")
  end

  recipe.energy_required = (recipe.energy_required or 0.5) * time_multiplier
  for _, ingredient in pairs(recipe.ingredients or {}) do
    -- Item amounts must stay whole numbers; fluids may be fractional.
    if ingredient.type == "fluid" then
      ingredient.amount = ingredient.amount * ingredient_multiplier
    else
      ingredient.amount = math.ceil(ingredient.amount * ingredient_multiplier)
    end
  end
end
