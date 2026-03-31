-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- ============================================
-- PERFORMANCE OPTIMIZATIONS
-- ============================================

-- Specify font explicitly to skip font discovery (saves ~300ms)
-- Using "Mono" variant for proper icon spacing in terminal
config.font = wezterm.font('MesloLGS Nerd Font Mono', { weight = 'Regular' })
-- Other good options:
-- config.font = wezterm.font('Hack Nerd Font Mono', { weight = 'Regular' })
-- config.font = wezterm.font('FiraCode Nerd Font Mono', { weight = 'Regular' })
-- config.font = wezterm.font('JetBrainsMono Nerd Font Mono', { weight = 'Regular' })

config.font_size = 13  -- Increased from 10 for better readability

-- Keep update checking enabled (so you know about updates)
-- config.check_for_updates = false  -- Uncomment to disable (~50ms faster)

-- Reduce scrollback buffer for faster rendering (saves ~50ms)
config.scrollback_lines = 10000  -- default is 3500, this is reasonable

-- Disable opacity for faster rendering (saves ~100-200ms)
-- Comment this line if you want transparency back
-- config.window_background_opacity = 0.95

-- Use software rendering only if GPU is slow (test both)
-- config.front_end = "Software"  -- Uncomment if GPU is bottleneck

-- Faster GL rendering
config.webgpu_power_preference = "HighPerformance"

-- Disable multiplexer if you don't use it (saves ~50ms)
config.enable_tab_bar = true
config.use_fancy_tab_bar = false  -- Simpler tab bar

-- ============================================
-- WINDOW CONFIGURATION
-- ============================================

config.initial_cols = 120
config.initial_rows = 28

-- Disable window decorations for faster rendering (optional)
-- config.window_decorations = "RESIZE"

-- ============================================
-- VISUAL TWEAKS (Optional)
-- ============================================

-- If you want opacity back, use a simpler value
config.window_background_opacity = 1.0  -- Solid (fastest)
-- config.window_background_opacity = 0.95  -- Transparent (slower)

-- Minimal animations
config.animation_fps = 1
config.max_fps = 60

-- Finally, return the configuration to wezterm:
return config
