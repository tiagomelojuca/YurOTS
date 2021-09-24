include(FetchContent)
set(FETCHCONTENT_QUIET OFF CACHE BOOL "USE FETCHCONTENT_QUIET" FORCE)

set(LIBXML2_WITH_TESTS OFF CACHE INTERNAL "")

FetchContent_Declare(
    libxml2
    GIT_REPOSITORY https://gitlab.gnome.org/GNOME/libxml2.git
)

FetchContent_MakeAvailable(libxml2)
FetchContent_GetProperties(libxml2 SOURCE_DIR LIBXML_SRC)
FetchContent_GetProperties(libxml2 BINARY_DIR LIBXML_BIN)
