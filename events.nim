import sdl2

discard sdl2.init(INIT_EVERYTHING)

var
  ev: Event
  win: WindowPtr
  running = true

win = createWindow(
  "SDL_Event",
  SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
  400, 400,
  SDL_WINDOW_SHOWN
)

while running:
  while ev.pollEvent():
    if ev.kind == QuitEvent:
      running = false

    if ev.kind == KeyDown:
      let key = ev.key().keysym

      if key.sym == K_ESCAPE:
        running = false
      else:
        echo "'", key.scancode, "' pressed"

win.destroy()
sdl2.quit()