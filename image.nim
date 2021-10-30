import sdl2
import sdl2/image as img
import std/with

discard sdl2.init(INIT_EVERYTHING)
discard img.init()

var
  ev: Event
  win: WindowPtr
  render: RendererPtr
  surface: SurfacePtr
  texture: TexturePtr
  running = true

win = createWindow(
  "Image example",
  SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
  400, 400,
  SDL_WINDOW_SHOWN
)

render  = win.createRenderer(-1, 0)
surface = img.load("rei_chikita.jpeg")
texture = render.createTextureFromSurface(surface)

surface.freeSurface()

while running:
  while ev.pollEvent():
    if ev.kind == QuitEvent: running = false

  with render:
    copy(texture, nil, nil)
    present()

texture.destroy()
render.destroy()
win.destroy()

img.quit()
sdl2.quit()