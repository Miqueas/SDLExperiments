import sdl2

discard sdl2.init(INIT_EVERYTHING)

type
  AppMain* = proc (app: var App, dt: float): bool
  EvHandler* = proc (app: var App; ev: Event): void
  EvHandlers* = seq[tuple[kind: EventType, handler: EvHandler]]
  App* = object
    id*: string
    main: AppMain
    handlers: EvHandlers

proc on*(app: var App, ev_type: EventType, cb: EvHandler) =
  app.handlers.add((kind: ev_type, handler: cb))

proc setMain*(app: var App, main: AppMain) =
  app.main = main

proc run*(app: var App) =
  var
    ev: Event
    now: uint64 = getPerformanceCounter()
    last: uint64
    delta: float
    running = true

  while running:
    last = now
    now = getPerformanceCounter()
    delta = ((now - last) * 1000).float / getPerformanceFrequency().float
    
    while ev.pollEvent():
      for tup in app.handlers:
        if ev.kind == tup.kind:
          tup.handler(app, ev)

    running = app.main(app, delta)

  sdl2.quit()