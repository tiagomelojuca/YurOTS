cmake_minimum_required(VERSION 3.12)

project(yurots-094f)
set(SRC_DIR "source")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(boost)
include(libxml2)
include(lua)

add_definitions(-DWIN32 -DNDEBUG -D_CONSOLE -DTLM_BUY_SELL -DTLM_SERVER_SAVE -DTLM_HOUSE_SYSTEM
                -DBDB_UTEVO_LUX -DWOLV_LOAD_NPC -DBD_HOUSE_WINDOW -DTR_ANTI_AFK -DELEM_VIP_LIST
                -DTR_SUMMONS -DTRS_GM_INVISIBLE -DTLM_SKULLS_PARTY -DBRN_EXIVA -DSD_BURST_ARROW
                -DBDB_REPLACE_SPEARS -DBD_ITEM_LOOK -DSM_RELOAD_CONFIG -DJD_DEATH_LIST -DCT_EXANI_TERA
                -DCVS_DAY_CYCLE -DTJ_MONSTER_BLOOD -DJD_WANDS -DMSVC_EXCEPTION_TRACER -DUSING_VISUAL_2005
                -D__DEBUG_PLAYERS__ -DYUR_CVS_MODS -DYUR_ICE_RAPIER -DYUR_AOL -DYUR_LOGIN_QUEUE
                -DYUR_MULTIPLIERS -DYUR_BOH -DYUR_NPC_EXT -DYUR_GUILD_SYSTEM -DYUR_CMD_EXT -DYUR_ITEM_EXT
                -DYUR_ACT_EXT -DYUR_NO_MONSTER_HEAL -DYUR_PVP_ARENA -DYUR_RINGS_AMULETS -DYUR_CONFIG_CAP
                -DYUR_FIGHT_MODE -DYUR_READABLES -DYUR_LEARN_SPELLS -DYUR_HEAL_EXHAUST -DYUR_SHUTDOWN
                -DYUR_ROOKGARD -DYUR_LIGHT_ITEM -DYUR_CLEAN_MAP -DYUR_GM_LOOK -DYUR_HIGH_LEVELS
                -DYUR_PREMIUM_PROMOTION -DYUR_INVISIBLE -DYUR_DRAINS -DYUR_BUILTIN_AAC -DMS_WIN64)

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

set(OUT_FOLDER "exeobj_cmake")
set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR})
install(TARGETS yurots DESTINATION "${OUT_FOLDER}")
install(FILES "${CMAKE_SOURCE_DIR}/config.lua" DESTINATION "${OUT_FOLDER}")
install(
    DIRECTORY
    "${CMAKE_SOURCE_DIR}/data"
    "${CMAKE_SOURCE_DIR}/docs"
    "${CMAKE_SOURCE_DIR}/perl"
    DESTINATION
    "${OUT_FOLDER}"
)
