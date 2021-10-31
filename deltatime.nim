import sdl2

discard sdl2.init(INIT_EVERYTHING)

var
  ev: Event
  win: WindowPtr
  now: uint64 = getPerformanceCounter()
  last: uint64
  delta: float
  running = true

win = createWindow(
  "Delta time example",
  SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
  200, 200,
  SDL_WINDOW_SHOWN
)

while running:
  last = now
  now = getPerformanceCounter()
  delta = ((now - last) * 1000).float / getPerformanceFrequency().float

  while ev.pollEvent():
    if ev.kind == QuitEvent: running = false

  echo delta


win.destroy()
sdl2.quit()