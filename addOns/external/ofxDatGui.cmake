
# -----------------------------------------------------------------
# ---------------------------- NAME -------------------------------
# -----------------------------------------------------------------
set( NAME_ADDON ofxDatGui )

# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------

set( PATH_SOURCE ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src )

# --- Setting abolute path to prevent errors
get_filename_component( PATH_SOURCE_ABSOLUTE ${PATH_SOURCE} ABSOLUTE )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP   "${PATH_SOURCE_ABSOLUTE}/*.cpp" )
file( GLOB_RECURSE OFX_MIDI_CPP
        "${PATH_SOURCE_ABSOLUTE}/*.cpp"
        "${PATH_SOURCE_ABSOLUTE}/libs/ofxSmartFont/src/*.cpp"
        )


add_library( ${NAME_ADDON} STATIC ${OFX_ADDON_CPP} )

OF_find_header_directories( HEADERS_SOURCE ${PATH_SOURCE_ABSOLUTE} )
include_directories( ${HEADERS_SOURCE} )
