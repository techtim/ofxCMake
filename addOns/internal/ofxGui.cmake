# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB
        OFX_GUI_CPP
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxGui/src*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(    "${OF_DIRECTORY_ABSOLUTE}/addons/ofxGui/src" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxGui
                STATIC
                ${OFX_GUI_CPP} )
