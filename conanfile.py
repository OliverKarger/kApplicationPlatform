from conan import ConanFile

class KApplicationPlatform(ConanFile):
    name = "kApplicationPlatform"
    version = "0.1.0"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"
    requires = "spdlog/1.12.0", "fmt/10.1.1"
