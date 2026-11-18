# Picom Monochrome Shaders

Two foreground shaders for Picom on X11:

- `grayscale.glsl` converts the image to shades of gray and slightly lifts dark and mid-tone areas with a `0.90` gamma curve.
- `monochrome.glsl` converts the image to pure black and white (no gray shades). Its luminance threshold is `0.50`.

## Requirements

- X11
- Picom built with the GLX backend and custom window-shader support

## Install

```sh
git clone https://github.com/KrzysztofMarciniak/picom-monochrome-shader && cd picom-monochrome-shader
```

Run this one-line command from the repository directory to copy both shader choices into Picom's config directory:

```sh
mkdir -p "$HOME/.config/picom" && cp grayscale.glsl monochrome.glsl "$HOME/.config/picom/"
```

## Usage

### grayscale

```sh
picom --backend glx --window-shader-fg "$HOME/.config/picom/grayscale.glsl"
```

### Strict black and white

```sh
picom --backend glx --window-shader-fg "$HOME/.config/picom/monochrome.glsl"
```

## Notes

- To adjust the black/white balance, change `0.50` in `monochrome.glsl`: a lower threshold makes more pixels white; a higher threshold makes more pixels black.
- Picom's window shader applies to composited windows. The wallpaper, hardware cursor, and content bypassing Picom may remain in color.
- The custom shader option requires Picom's GLX backend; the XRender backend does not support custom shaders.
