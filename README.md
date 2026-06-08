[![Release](https://github.com/derekbassett/tellus-science-rebalance/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/derekbassett/tellus-science-rebalance/actions/workflows/release.yml)

# Tellus Science Rebalance

A small companion mod for [Planetaris: Tellus](https://mods.factorio.com/mod/planetaris-tellus)
that makes its science packs **stop spoiling**, in exchange for a higher crafting
cost. It follows the same pattern as
[Gleba Science Rebalance](https://mods.factorio.com/mod/gleba-science-rebalance).

## Why this mod exists

Tellus uses **spoilage** as a core mechanic, and its science packs spoil too. The
base mod ships an easy mode that reduces spoilage time, but after several days
playing with it I still found keeping science fresh and flowing to be more of a
logistics headache than a fun challenge.

This mod is meant to be run **alongside** Planetaris: Tellus. It removes the
spoilage timer from Tellus's science packs so you can buffer, ship, and store
them like any other science pack — without the constant race against the clock.

## What it changes

It affects the two Tellus science packs:

- **Bioengineering Science Pack**
- **Pathological Science Pack**

For each one:

- **No more spoilage** — the spoil timer is removed, so the packs keep
  indefinitely.
- **Longer crafting time** — the recipe takes longer to craft (2× by default).
- **Higher ingredient cost** — recipes require more inputs (2× by default).

The idea is to trade the spoilage pressure for a straightforward resource and
throughput cost, so Tellus stays meaningfully expensive without the timer
micromanagement.

## Settings

Both multipliers are configurable under **Settings → Mod settings → Startup**:

- **Ingredient cost multiplier** (default `2`, range `1`–`10`) — scales each
  recipe's ingredient amounts. Item amounts are rounded up to whole numbers;
  fluids may be fractional.
- **Crafting time multiplier** (default `2`, range `1`–`10`) — scales each
  recipe's crafting time.

Set both to `1` if you only want to remove spoilage with no extra cost. Because
these are startup settings, changing them requires a game restart.

## Installation

1. Install [Planetaris: Tellus](https://mods.factorio.com/mod/planetaris-tellus)
   (this mod depends on it).
2. Install this mod.
3. Enable both and start or load a save.

**Requirements**

- Factorio 2.0 with the Space Age expansion
- `planetaris-tellus >= 1.1.6`

## Compatibility

This mod only edits the two Tellus science pack recipes and their spoilage
settings, so it should play nicely with most other mods. The easy mode included
in Planetaris: Tellus is still optional — this mod replaces the need for it as
far as science packs are concerned.

## Credits & thanks

Huge thanks to [Syen_ce](https://mods.factorio.com/user/Syen_ce) for the
excellent Planetaris: Tellus and their other amazing mods. All the hard creative
work of Tellus is theirs; this is just a small rebalance tweak on top of it.

## Note

This is my first published Factorio mod, used as a test bed for learning the
publishing workflow. Feedback and suggestions are welcome. If there's interest, I
may bundle a few of these rebalance tweaks into a mod pack.

## License

See [LICENSE](LICENSE).
