#include <SDL.h>
#include <stdbool.h>

#undef main

int main(void) {
  SDL_Init(SDL_INIT_EVERYTHING);

  SDL_Window* win;
  SDL_Event ev;
  bool running = true;

  win = SDL_CreateWindow(
    "Window example",
    SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
    400, 400,
    SDL_WINDOW_SHOWN
  );

  while (running) {
    while (SDL_PollEvent(&ev) > 0) {
      if (ev.type == SDL_QUIT) running = false;
    }
  }

  SDL_DestroyWindow(win);
  SDL_Quit();

  return 0;
}