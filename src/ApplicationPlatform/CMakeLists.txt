file(GLOB_RECURSE PLATFORM_SOURCES CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/include/*.hh"
)

add_executable(ApplicationPlatform ${PLATFORM_SOURCES})

target_include_directories(ApplicationPlatform
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(ApplicationPlatform
    PRIVATE
        PluginBase::PluginBase
)
