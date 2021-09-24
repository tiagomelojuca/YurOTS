cmake_minimum_required(VERSION 3.12)

project(yurots76)
set(SRC_DIR "source")

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(GCC_COVERAGE_COMPILE_FLAGS "-fpermissive")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")
endif()

add_definitions(
    -DWIN32
    -DNDEBUG
    -D_CONSOLE
    -DTLM_BUY_SELL
    -DTLM_SERVER_SAVE
    -DTLM_HOUSE_SYSTEM
    -DBDB_UTEVO_LUX
    -DWOLV_LOAD_NPC
    -DBD_HOUSE_WINDOW
    -DTR_ANTI_AFK
    -DELEM_VIP_LIST
    -DTR_SUMMONS
    -DTRS_GM_INVISIBLE
    -DTLM_SKULLS_PARTY
    -DBRN_EXIVA
    -DSD_BURST_ARROW
    -DBDB_REPLACE_SPEARS
    -DBD_ITEM_LOOK
    -DSM_RELOAD_CONFIG
    -DJD_DEATH_LIST
    -DCT_EXANI_TERA
    -DCVS_DAY_CYCLE
    -DTJ_MONSTER_BLOOD
    -DJD_WANDS
    -DMSVC_EXCEPTION_TRACER
    -DUSING_VISUAL_2005
    -D__DEBUG_PLAYERS__
    -DYUR_CVS_MODS
    -DYUR_ICE_RAPIER
    -DYUR_AOL
    -DYUR_LOGIN_QUEUE
    -DYUR_MULTIPLIERS
    -DYUR_BOH
    -DYUR_NPC_EXT
    -DYUR_GUILD_SYSTEM
    -DYUR_CMD_EXT
    -DYUR_ITEM_EXT
    -DYUR_ACT_EXT
    -DYUR_NO_MONSTER_HEAL
    -DYUR_PVP_ARENA
    -DYUR_RINGS_AMULETS
    -DYUR_CONFIG_CAP
    -DYUR_FIGHT_MODE
    -DYUR_READABLES
    -DYUR_LEARN_SPELLS
    -DYUR_HEAL_EXHAUST
    -DYUR_SHUTDOWN
    -DYUR_ROOKGARD
    -DYUR_LIGHT_ITEM
    -DYUR_CLEAN_MAP
    -DYUR_GM_LOOK
    -DYUR_HIGH_LEVELS
    -DYUR_PREMIUM_PROMOTION
    -DYUR_INVISIBLE
    -DYUR_DRAINS
    -DYUR_BUILTIN_AAC
)

add_definitions(-DMS_WIN64)

add_executable(
    yurots
    "${SRC_DIR}/aac.cpp"
    "${SRC_DIR}/account.cpp"
    "${SRC_DIR}/actions.cpp"
    "${SRC_DIR}/chat.cpp"
    "${SRC_DIR}/commands.cpp"
    "${SRC_DIR}/container.cpp"
    "${SRC_DIR}/creature.cpp"
    "${SRC_DIR}/fileloader.cpp"
    "${SRC_DIR}/game.cpp"
    "${SRC_DIR}/guilds.cpp"
    "${SRC_DIR}/houses.cpp"
    "${SRC_DIR}/ioaccount.cpp"
    "${SRC_DIR}/ioaccountxml.cpp"
    "${SRC_DIR}/iomapotbm.cpp"
    "${SRC_DIR}/iomapxml.cpp"
    "${SRC_DIR}/ioplayer.cpp"
    "${SRC_DIR}/ioplayerxml.cpp"
    "${SRC_DIR}/item.cpp"
    "${SRC_DIR}/itemloader.cpp"
    "${SRC_DIR}/items.cpp"
    "${SRC_DIR}/loginqueue.cpp"
    "${SRC_DIR}/luascript.cpp"
    "${SRC_DIR}/magic.cpp"
    "${SRC_DIR}/map.cpp"
    "${SRC_DIR}/md5.cpp"
    "${SRC_DIR}/mdump.cpp"
    "${SRC_DIR}/monster.cpp"
    "${SRC_DIR}/monsters.cpp"
    "${SRC_DIR}/networkmessage.cpp"
    "${SRC_DIR}/npc.cpp"
    "${SRC_DIR}/otserv.cpp"
    "${SRC_DIR}/player.cpp"
    "${SRC_DIR}/position.cpp"
    "${SRC_DIR}/protocol.cpp"
    "${SRC_DIR}/protocol76.cpp"
    "${SRC_DIR}/pvparena.cpp"
    "${SRC_DIR}/readables.cpp"
    "${SRC_DIR}/scheduler.cpp"
    "${SRC_DIR}/spawn.cpp"
    "${SRC_DIR}/spells.cpp"
    "${SRC_DIR}/status.cpp"
    "${SRC_DIR}/summons.cpp"
    "${SRC_DIR}/thing.cpp"
    "${SRC_DIR}/tile.cpp"
    "${SRC_DIR}/tools.cpp"
)

include(FetchContent)
set(FETCHCONTENT_QUIET OFF CACHE BOOL "USE FETCHCONTENT_QUIET" FORCE)

set(LIBXML2_WITH_TESTS OFF CACHE INTERNAL "")
FetchContent_Declare(
    libxml2
    GIT_REPOSITORY https://gitlab.gnome.org/GNOME/libxml2.git
)

FetchContent_Declare(
    liblua
    URL https://www.lua.org/ftp/lua-5.0.3.tar.gz
    URL_HASH MD5=feee27132056de2949ce499b0ef4c480
)

FetchContent_Declare(
    boost
    URL https://iweb.dl.sourceforge.net/project/boost/boost/1.33.1/boost_1_33_1.tar.gz
)

FetchContent_MakeAvailable(libxml2)
FetchContent_GetProperties(libxml2 SOURCE_DIR LIBXML_SRC)
FetchContent_GetProperties(libxml2 BINARY_DIR LIBXML_BIN)

FetchContent_MakeAvailable(liblua)
FetchContent_GetProperties(liblua SOURCE_DIR LUA_SRC)
FetchContent_GetProperties(liblua BINARY_DIR LUA_BIN)

FetchContent_MakeAvailable(boost)
FetchContent_GetProperties(boost SOURCE_DIR BOOST_SRC)

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

set_target_properties(liblua PROPERTIES PREFIX "")
set_target_properties(liblua PROPERTIES OUTPUT_NAME "liblua")
set_target_properties(liblualib PROPERTIES PREFIX "")
set_target_properties(liblualib PROPERTIES OUTPUT_NAME "liblualib")

add_library(
    boost_regex
    STATIC
    "${BOOST_SRC}/libs/regex/src/c_regex_traits.cpp"
    "${BOOST_SRC}/libs/regex/src/cpp_regex_traits.cpp"
    "${BOOST_SRC}/libs/regex/src/cregex.cpp"
    "${BOOST_SRC}/libs/regex/src/fileiter.cpp"
    "${BOOST_SRC}/libs/regex/src/icu.cpp"
    "${BOOST_SRC}/libs/regex/src/instances.cpp"
    "${BOOST_SRC}/libs/regex/src/posix_api.cpp"
    "${BOOST_SRC}/libs/regex/src/regex_debug.cpp"
    "${BOOST_SRC}/libs/regex/src/regex_raw_buffer.cpp"
    "${BOOST_SRC}/libs/regex/src/regex_traits_defaults.cpp"
    "${BOOST_SRC}/libs/regex/src/regex.cpp"
    "${BOOST_SRC}/libs/regex/src/static_mutex.cpp"
    "${BOOST_SRC}/libs/regex/src/usinstances.cpp"
    "${BOOST_SRC}/libs/regex/src/w32_regex_traits.cpp"
    "${BOOST_SRC}/libs/regex/src/wc_regex_traits.cpp"
    "${BOOST_SRC}/libs/regex/src/wide_posix_api.cpp"
    "${BOOST_SRC}/libs/regex/src/winstances.cpp"
)

target_include_directories(boost_regex PRIVATE "${BOOST_SRC}/")
set_target_properties(boost_regex PROPERTIES PREFIX "")
set_target_properties(boost_regex PROPERTIES OUTPUT_NAME "boost_regex")

target_include_directories(
    yurots
    PRIVATE
    "${LIBXML_SRC}/include"
    "${LIBXML_BIN}"
    "${LUA_SRC}/src"
    "${LUA_SRC}/include"
    "${BOOST_SRC}/"
)

target_link_libraries(yurots PRIVATE libxml2 liblua liblualib boost_regex ws2_32)
