include(FetchContent)
set(FETCHCONTENT_QUIET OFF CACHE BOOL "USE FETCHCONTENT_QUIET" FORCE)

FetchContent_Declare(
    boost
    URL https://iweb.dl.sourceforge.net/project/boost/boost/1.33.1/boost_1_33_1.tar.gz
)

FetchContent_MakeAvailable(boost)
FetchContent_GetProperties(boost SOURCE_DIR BOOST_SRC)

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
