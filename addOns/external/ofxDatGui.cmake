
# -----------------------------------------------------------------
# ---------------------------- NAME -------------------------------
# -----------------------------------------------------------------
set( NAME_ADDON ofxDatGui )

# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------

set( PATH_SOURCE ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB OFX_ADDON_CPP  "${PATH_SOURCE}/*.cpp"
        "${PATH_SOURCE}/components/*.cpp"
        "${PATH_SOURCE}/core/*.cpp"
        "${PATH_SOURCE}/libs/*.cpp"
        "${PATH_SOURCE}/themes/*.cpp"
        "${PATH_SOURCE}/libs/ofxSmartFont/src/*.cpp"
 )

add_library( ${NAME_ADDON} STATIC ${OFX_ADDON_CPP})

OF_find_header_directories_exclude( HEADERS_SOURCE ${PATH_SOURCE} "example")
include_directories( ${HEADERS_SOURCE} )
