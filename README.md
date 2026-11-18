# Picom Monochrome Shaders

Two foreground shaders for Picom on X11:

- `grayscale.glsl` converts the image to shades of gray and slightly lifts dark and mid-tone areas with a `0.90` gamma curve.
- `monochrome.glsl` converts the image to pure black and white (no gray shades). Its luminance threshold is `0.50`.

## Requirements

- X11
- Picom built with the GLX backend and custom window-shader support

On Alpine Linux, install Picom with `apk add picom`.

## Install

```sh
git clone https://github.com/KrzysztofMarciniak/picom-monochrome-shader && cd picom-monochrome-shader
```

Run this one-line command from the repository directory to copy both shader choices into Picom's config directory:

```sh
mkdir -p "$HOME/.config/picom" && cp grayscale.glsl monochrome.glsl "$HOME/.config/picom/"
```

## Enable from `.xinitrc`

Choose **one** of the following one-line commands to append the matching Picom startup command to `~/.xinitrc`. Each command avoids adding the same line twice.

### Lightened grayscale

```sh
grep -qxF 'picom --backend glx --window-shader-fg "$HOME/.config/picom/grayscale.glsl" &' "$HOME/.xinitrc" 2>/dev/null || printf '%s\n' 'picom --backend glx --window-shader-fg "$HOME/.config/picom/grayscale.glsl" &' >> "$HOME/.xinitrc"
```

### Strict black and white

```sh
grep -qxF 'picom --backend glx --window-shader-fg "$HOME/.config/picom/monochrome.glsl" &' "$HOME/.xinitrc" 2>/dev/null || printf '%s\n' 'picom --backend glx --window-shader-fg "$HOME/.config/picom/monochrome.glsl" &' >> "$HOME/.xinitrc"
```

Log out and start X again, or run the corresponding Picom startup line in an existing X session after stopping any other compositor. If you switch modes, remove the old Picom startup line from `.xinitrc` so that only one compositor is started.

## Notes

- To adjust the black/white balance, change `0.50` in `monochrome.glsl`: a lower threshold makes more pixels white; a higher threshold makes more pixels black.
- Picom's window shader applies to composited windows. The wallpaper, hardware cursor, and content bypassing Picom may remain in color.
- The custom shader option requires Picom's GLX backend; the XRender backend does not support custom shaders.
