file(GLOB_RECURSE PLUGINBASE_SOURCES CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/include/*.hh"
)

add_library(PluginBase STATIC ${PLUGINBASE_SOURCES})

target_include_directories(PluginBase
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_library(PluginBase::PluginBase ALIAS PluginBase)
