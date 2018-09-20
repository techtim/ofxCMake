
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
# set(CMAKE_C_COMPILER "/usr/bin/clang")
# set(CMAKE_C_FLAGS "") # -x objective-c

# set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
# set(CMAKE_CXX_FLAGS "-std=c++14 -stdlib=libc++ -D__MACOSX_CORE__" )
set_source_files_properties( ${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "-x objective-c++" )

#set(CMAKE_OSX_ARCHITECTURES i386)
set(CMAKE_OSX_ARCHITECTURES x86_64)
add_compile_options(-Wno-deprecated-declarations)


add_executable( ${APP_NAME} WIN32 ${${APP_NAME}_SOURCE_FILES} ledMapperIcon.rc )
