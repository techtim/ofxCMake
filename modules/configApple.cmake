
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_C_FLAGS "") # -x objective-c

set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
set(CMAKE_CXX_FLAGS "-std=c++14 -stdlib=libc++ -D__MACOSX_CORE__" )
set_source_files_properties( ${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "-x objective-c++" )

#set(CMAKE_OSX_ARCHITECTURES i386)
set(CMAKE_OSX_ARCHITECTURES x86_64)
add_compile_options(-Wno-deprecated-declarations)

# To use the bundled libc++ please add the following LDFLAGS:
#   LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
# For compilers to find llvm you may need to set:
#   export LDFLAGS="-L/usr/local/opt/llvm/lib"
#   export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Uncoment when clang support filesystem
#set( DEFINITIONS "-DOF_USING_STD_FS" )

string( JOIN " " DEFINES ${DEFINITIONS})
if (NOT ${DEFINES} EQUAL "")
    message ("Adding defines: ${DEFINES}")
    add_definitions(${DEFINES})
endif()

# ============================================================================
# ------------------------------ Compile and Link ----------------------------
add_executable( ${APP_NAME} MACOSX_BUNDLE ${${APP_NAME}_SOURCE_FILES} )

target_link_libraries(  ${APP_NAME}
                        $<TARGET_FILE:of_shared>
                        ${opengl_lib}               # TODO Why is this needed here?
                        ${OFX_ADDONS_ACTIVE}
                        )

# ============================================================================
ADD_CUSTOM_COMMAND( TARGET ${APP_NAME}
        POST_BUILD
        COMMAND ${CMAKE_INSTALL_NAME_TOOL}
        ARGS -change "@rpath/openFrameworksShared.dylib" "@loader_path/../Frameworks/openFrameworksShared.dylib" $<TARGET_FILE:${APP_NAME}>
        )

# TODO Explain the excecutable bindings
ADD_CUSTOM_COMMAND( TARGET of_shared
        POST_BUILD
        COMMAND ${CMAKE_INSTALL_NAME_TOOL}
        ARGS -change ./libfmodex.dylib "@loader_path/libfmodex.dylib" $<TARGET_FILE:of_shared>
        )

ADD_CUSTOM_COMMAND( TARGET of_shared
        POST_BUILD
        COMMAND /bin/cp
        ARGS ${LIB_FMODEX} ${PROJECT_SOURCE_DIR}/bin/${APP_NAME}.app/Contents/MacOS
        )
