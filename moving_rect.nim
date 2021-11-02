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
  "Moving SDL_Rect",
  SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
  400, 400,
  SDL_WINDOW_SHOWN
)

rect = (x: 0.cint, y: 0.cint, w: 20.cint, h: 20.cint)
render = win.createRenderer(-1, 0)
texture = render.createTexture(
  SDL_PIXELFORMAT_RGB888,
  SDL_TEXTUREACCESS_TARGET,
  400, 400
)

while running:
  while ev.pollEvent():
    if ev.kind == QuitEvent: running = false

    if ev.kind == KeyDown:
      let key = ev.key().keysym

      case key.sym:
        of K_S: rect.y += 4
        of K_W: rect.y -= 4
        of K_D: rect.x += 4
        of K_A: rect.x -= 4
        else: continue

  with render:
    setRenderTarget(texture)
    setDrawColor(22, 22, 22, 255)
    clear()
    drawRect(rect)
    setDrawColor(250, 250, 250, 255)
    fillRect(rect)
    setRenderTarget(nil)
    copy(texture, nil, nil)
    present()
    

render.destroy()
win.destroy()
sdl2.quit()