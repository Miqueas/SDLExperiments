import sdl2

discard sdl2.init(INIT_EVERYTHING)

var
  ev: Event
  win: WindowPtr
  timer: TimerID
  running = true

win = createWindow(
  "Timer",
  SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
  400, 400,
  SDL_WINDOW_SHOWN
)

proc timer_cb(interval: uint32, param: pointer): uint32 {.cdecl.} =
  var t {.global.} = true

  if t: echo "Tick"
  else: echo "Tock"
  
  t = not t

  return interval

timer = addTimer(2000'u32, timer_cb, nil)

while running:
  while ev.pollEvent():
    if ev.kind == QuitEvent:
      running = false

if timer > 0:
  discard removeTimer(timer)

win.destroy()
sdl2.quit()