New-Item -ItemType Directory -Force -Path  out
v -cc msvc -shared -o out/libv.c .
