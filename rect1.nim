import sdl2
import std/with

discard sdl2.init(INIT_EVERYTHING)

var
  ev: Event
  win: WindowPtr
  rect: Rect
  render: RendererPtr
  texture: TexturePtr
  running = true

win = createWindow(
  "SDL_Rect example",
  SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
  400, 400,
  SDL_WINDOW_SHOWN
)

rect = (x: 20.cint, y: 20.cint, w: 100.cint, h: 100.cint)
render = win.createRenderer(-1, 0)
texture = render.createTexture(
  SDL_PIXELFORMAT_RGB888,
  SDL_TEXTUREACCESS_TARGET,
  400, 400
)

while running:
  while ev.pollEvent():
    if ev.kind == QuitEvent: running = false
  
  with render:
    setRenderTarget(texture)
    setDrawColor(22, 22, 22, 255)
    clear()
    drawRect(rect)
    setDrawColor(98, 57, 128, 255)
    fillRect(rect)
    setRenderTarget(nil)
    copy(texture, nil, nil)
    present()

render.destroy()
win.destroy()
sdl2.quit()