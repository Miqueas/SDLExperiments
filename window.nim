import sdl2

discard init(INIT_EVERYTHING)

let win = createWindow(
  "Window example",
  SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
  400, 400,
  SDL_WINDOW_SHOWN
)

var
  ev: Event
  running = true

while running:
  while ev.pollEvent():
    if ev.kind == QuitEvent: running = false

win.destroy()
sdl2.quit()