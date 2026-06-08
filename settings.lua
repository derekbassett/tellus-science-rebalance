-- settings.lua

data:extend({
  {
    type = "double-setting",
    name = "tellus-science-rebalance-ingredient-multiplier",
    setting_type = "startup",
    default_value = 2.0,
    minimum_value = 1.0,
    maximum_value = 10.0,
    order = "a",
  },
  {
    type = "double-setting",
    name = "tellus-science-rebalance-time-multiplier",
    setting_type = "startup",
    default_value = 2.0,
    minimum_value = 1.0,
    maximum_value = 10.0,
    order = "b",
  },
})
