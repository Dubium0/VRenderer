workspace "VulkanRenderer"
   architecture "x64"
   configurations { "Debug", "Release" }
  
project "VulkanRenderer"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++17"
   targetdir "bin/%{cfg.buildcfg}"
   objdir ("bin-int/%{cfg.buildcfg}")

   files { "src/*.h", "src/*.cpp" }

   includedirs {
      "include/GLFW",
      "include/glm",
      "include/STB_IMAGE",
      "include/TINY_OBJECT_LOADER",
      "include/VULKAN"
   }

   -- Link GLFW and Vulkan libraries
   filter "system:windows"
      links {
         "glfw3",
         "vulkan-1"
      }
      libdirs { 
         "lib/GLFW",
         "lib/VULKAN"
      }

   -- On Linux, link the libraries dynamically
   filter "system:linux"
      links {
         "glfw",
         "vulkan"
      }

   -- Configure Debug and Release builds
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
