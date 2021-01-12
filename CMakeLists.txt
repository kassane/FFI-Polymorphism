project(medium)

add_executable(cpp_example cpp/main.cpp cpp/CounterButton.hpp cpp/Engine.cpp cpp/bindings.cpp)
add_library(gui cpp/CounterButton.hpp cpp/Engine.cpp cpp/bindings.cpp)
