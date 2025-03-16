cmake_minimum_required(VERSION 3.24)
project(CG)

set(CMAKE_CXX_STANDARD 20)

# 查找 glfw 和 OpenGL
find_package(glfw3 REQUIRED)
find_package(OpenGL REQUIRED)
find_package(assimp REQUIRED) # 添加assimp



# 包含 GLAD 的头文件
include_directories(${CMAKE_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR}/include/imgui)

aux_source_directory(${CMAKE_SOURCE_DIR}/include/imgui ImgUI)


# 将 glad.c 添加到可执行文件的编译
add_executable(gl-app src/main.cpp src/glad.c src/Shader.cpp src/Shader.h src/stb_helper.cpp src/stb_image.h
        src/camera.h
        src/model.h
        src/mesh.h
        src/drawcalls.h
        ${ImgUI})

# 链接 OpenGL 和 glfw 库
target_link_libraries(gl-app "-framework Cocoa")
target_link_libraries(gl-app "-framework IOKit")
target_link_libraries(gl-app "-framework OpenGL")
target_link_libraries(gl-app glfw ${OPENGL_gl_LIBRARY})
target_link_libraries(gl-app assimp::assimp)