include(FetchContent)
set(FETCHCONTENT_QUIET OFF CACHE BOOL "USE FETCHCONTENT_QUIET" FORCE)

FetchContent_Declare(
    liblua
    URL https://www.lua.org/ftp/lua-5.0.3.tar.gz
    URL_HASH MD5=feee27132056de2949ce499b0ef4c480
)

FetchContent_MakeAvailable(liblua)
FetchContent_GetProperties(liblua SOURCE_DIR LUA_SRC)
FetchContent_GetProperties(liblua BINARY_DIR LUA_BIN)

add_library(
    liblua
    STATIC
    "${LUA_SRC}/src/lapi.c"
    "${LUA_SRC}/src/lcode.c"
    "${LUA_SRC}/src/ldebug.c"
    "${LUA_SRC}/src/ldo.c"
    "${LUA_SRC}/src/ldump.c"
    "${LUA_SRC}/src/lfunc.c"
    "${LUA_SRC}/src/lgc.c"
    "${LUA_SRC}/src/llex.c"
    "${LUA_SRC}/src/lmem.c"
    "${LUA_SRC}/src/lobject.c"
    "${LUA_SRC}/src/lopcodes.c"
    "${LUA_SRC}/src/lparser.c"
    "${LUA_SRC}/src/lstate.c"
    "${LUA_SRC}/src/lstring.c"
    "${LUA_SRC}/src/ltable.c"
    "${LUA_SRC}/src/ltests.c"
    "${LUA_SRC}/src/ltm.c"
    "${LUA_SRC}/src/lundump.c"
    "${LUA_SRC}/src/lvm.c"
    "${LUA_SRC}/src/lzio.c"
)

add_library(
    liblualib
    STATIC
    "${LUA_SRC}/src/lib/lauxlib.c"
    "${LUA_SRC}/src/lib/lbaselib.c"
    "${LUA_SRC}/src/lib/ldblib.c"
    "${LUA_SRC}/src/lib/liolib.c"
    "${LUA_SRC}/src/lib/lmathlib.c"
    "${LUA_SRC}/src/lib/loadlib.c"
    "${LUA_SRC}/src/lib/lstrlib.c"
    "${LUA_SRC}/src/lib/ltablib.c"
)

target_include_directories(liblua PRIVATE "${LUA_SRC}/src" "${LUA_SRC}/include")
target_include_directories(liblualib PRIVATE "${LUA_SRC}/src" "${LUA_SRC}/include")
