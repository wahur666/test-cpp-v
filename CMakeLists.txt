cmake_minimum_required(VERSION 3.30)
project(my_project)

# Add the library subdirectory first
add_subdirectory(libv)

# Then add the application
add_subdirectory(app)