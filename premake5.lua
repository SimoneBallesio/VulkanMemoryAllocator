project "VulkanMemoryAllocator"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"

	targetdir ("Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("Build/" .. outputdir .. "/%{prj.name}")

	IncludeDir = {}
	IncludeDir["Vulkan"] = "$(VULKAN_SDK)/Include"

	files
	{
		"include/vk_mem_alloc.h",
		"src/VmaUsage.h",
		"src/VmaUsage.cpp"
	}
  
	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		defines 
		{ 
			"_CRT_SECURE_NO_WARNINGS"
		}

		includedirs
		{
			"%{IncludeDir.Vulkan}"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"