# =================================================================
#
# Template for addOns WITH pre compiled libraries
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set( NAME_ADDON     ofxPoco )       # <--- Set the name here

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_ADDON_ABSOLUTE ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON} )
set( PATH_SRC    ${PATH_ADDON_ABSOLUTE}/src )
# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB OFX_ADDON_CPP "${PATH_SRC}/*.cpp" )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

include_directories( ${PATH_SRC} )

include_directories( "${PATH_ADDON_ABSOLUTE}/libs/openssl/include" )

# include_directories( ${HEADERS_POCO} )
include_directories( "${PATH_ADDON_ABSOLUTE}/libs/poco/include" )

message(STATUS "[POCO] HEADERs =")
FOREACH(header_poco ${HEADERS_SSL})
    message(STATUS "head = ${header_poco}")
ENDFOREACH()

# -----------------------------------------------------------------
# ------------------------------ LIBS  	----------------------------
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# --- In case OS specific libs are needed
# --- Be sure to link them in target_link_libraries()
# -----------------------------------------------------------------

if( APPLE )
   # find_library( CORE_FOUNDATION_LIB_${NAME_ADDON} Security)
   set( COMPILED_LIBS_POCO    
   	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/osx/PocoNetSSL.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/osx/PocoNet.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/osx/PocoCrypto.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/osx/PocoUtil.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/osx/PocoJSON.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/osx/PocoXML.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/osx/PocoFoundation.a"
	"${PATH_ADDON_ABSOLUTE}/libs/openssl/lib/osx/crypto.a"
	"${PATH_ADDON_ABSOLUTE}/libs/openssl/lib/osx/ssl.a"
   )
   
message(STATUS "${PATH_ADDON_ABSOLUTE}/libs/openssl/lib/osx/crypto.a")

elseif( UNIX )

    set( COMPILED_LIBS_POCO 
    "${PATH_ADDON_ABSOLUTE}/libs/poco/lib/linux64/libPocoNetSSL.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/linux64/libPocoNet.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/linux64/libPocoCrypto.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/linux64/libPocoUtil.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/linux64/libPocoJSON.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/linux64/libPocoXML.a"
	"${PATH_ADDON_ABSOLUTE}/libs/poco/lib/linux64/libPocoFoundation.a"
	)
elseif( WIN32)

endif()

add_library( ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} )

target_link_libraries( ${NAME_ADDON} ${COMPILED_LIBS_POCO} )

