-- data-updates.lua

-- Tellus science packs to rebalance.
local science_packs = {
  "planetaris-bioengineering-science-pack",
  "planetaris-pathological-science-pack",
}

local ingredient_multiplier = settings.startup["tellus-science-rebalance-ingredient-multiplier"].value
local time_multiplier = settings.startup["tellus-science-rebalance-time-multiplier"].value

for _, name in ipairs(science_packs) do
  -- Disable spoilage so the pack keeps indefinitely.
  local tool = data.raw["tool"][name]
  tool.spoil_ticks = nil
  tool.spoil_result = nil

  -- Nerf the recipe: longer craft time and more ingredients.
  local recipe = data.raw.recipe[name]
  recipe.energy_required = (recipe.energy_required or 0.5) * time_multiplier
  for _, ingredient in pairs(recipe.ingredients) do
    -- Item amounts must stay whole numbers; fluids may be fractional.
    if ingredient.type == "fluid" then
      ingredient.amount = ingredient.amount * ingredient_multiplier
    else
      ingredient.amount = math.ceil(ingredient.amount * ingredient_multiplier)
    end
  end
end
