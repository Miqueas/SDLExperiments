project('SDLExperiments', 'c')

deps = [
  dependency('SDL2'),
  dependency('SDL2_image')
]

executable('window', 'window.c',
  dependencies: deps,
  win_subsystem: 'windows'
)

executable('image', 'image.c',
  dependencies: deps,
  win_subsystem: 'windows'
)