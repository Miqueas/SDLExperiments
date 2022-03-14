import sdl2
import app

var game = App(id: "example.game")

game.on(KeyDown, proc (self: var App, ev: Event) =
  let key = ev.key().keysym
  echo $key.scancode & " preseed!"
)

game.setMain(proc (self: var App, dt: float): bool =
  echo "Hello, world!"
  echo "Delta time: ", dt

  if dt > 1'f:
    return false
  
  return true
)


game.run()