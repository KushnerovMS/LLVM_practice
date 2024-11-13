cmake_minimum_required(VERSION 3.15...3.30) 

project(GraphicApp
		VERSION 0.1
		DESCRIPTION "Graphic app based on SDL2"
		LANGUAGES C)

set(CMAKE_C_COMPILER clang)

find_package(SDL2 REQUIRED)

add_executable(GraphicApp src/app.c src/sim.c src/start.c)
target_include_directories(GraphicApp PRIVATE include/GraphicApp)
target_link_libraries(GraphicApp PRIVATE SDL2::SDL2)

add_custom_target(Gen_LLVM_IR
	COMMAND clang -S -Os -emit-llvm ${CMAKE_CURRENT_SOURCE_DIR}/src/app.c
				-I ${CMAKE_CURRENT_SOURCE_DIR}/include/GraphicApp -o app.ll
	DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/src/app.c)
