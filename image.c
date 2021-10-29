#include <SDL.h>
#include <SDL_image.h>
#include <stdbool.h>

#undef main

int main(void) {
  SDL_Init(SDL_INIT_EVERYTHING);
  IMG_Init(IMG_INIT_PNG | IMG_INIT_JPG);

  SDL_Window* win = SDL_CreateWindow(
    "Image example",
    SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
    400, 400,
    SDL_WINDOW_SHOWN
  );

  SDL_Renderer* render = SDL_CreateRenderer(win, -1, 0);
  SDL_Event ev;

  SDL_Surface* img = IMG_Load("rei_chikita.jpeg");
  SDL_Texture* texture = SDL_CreateTextureFromSurface(render, img);

  SDL_FreeSurface(img);

  if (win == NULL) {
    printf("Cannot create the window!\n");
    printf("Error: %s\n", SDL_GetError());
    return 1;
  }

  bool quit = false;

  while (!quit) {
    while (SDL_PollEvent(&ev) > 0) {
      if (ev.type == SDL_QUIT) quit = true;
    }

    SDL_RenderCopy(render, texture, NULL, NULL);
    SDL_RenderPresent(render);
  }

  SDL_DestroyTexture(texture);
  SDL_DestroyRenderer(render);
  SDL_DestroyWindow(win);

  IMG_Quit();
  SDL_Quit();

  return 0;
}