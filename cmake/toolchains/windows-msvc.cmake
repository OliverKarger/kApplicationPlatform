set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_CXX_STANDARD 23)

# Optional: explicitly set compiler (if you use Clang on Windows with MSVC STL)
set(CMAKE_C_COMPILER clang-cl)
set(CMAKE_CXX_COMPILER clang-cl)
set(CMAKE_GENERATOR_TOOLSET "host=x64")

