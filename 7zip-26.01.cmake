cmake_minimum_required( VERSION 3.14 )

option(7ZIP_DISABLE_RAR "Disable RAR archive support in 7-Zip" OFF)
option(7ZIP_USE_ASM "Use ASM in 7-Zip" ON)
option(7ZIP_USE_EXPORTS "Use ArchiveExports.cpp/DllExports2.cpp in 7-Zip" OFF)

set(7ZIP_SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR})

set(7ZIP_COMPILE_DEFINITIONS Z7_EXTERNAL_CODECS)

set(7ZIP_SOURCES
	${7ZIP_SOURCE_DIR}/CPP/Common/CRC.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/CrcReg.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/DynLimBuf.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/IntToString.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/LzFindPrepare.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Md5Reg.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/MyMap.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/MyString.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/MyVector.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/MyXml.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/NewHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Sha1Prepare.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Sha1Reg.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Sha256Prepare.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Sha256Reg.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Sha3Reg.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Sha512Prepare.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Sha512Reg.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/StringConvert.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/StringToInt.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/UTFConvert.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Wildcard.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/Xxh64Reg.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/XzCrc64Init.cpp
	${7ZIP_SOURCE_DIR}/CPP/Common/XzCrc64Reg.cpp

	${7ZIP_SOURCE_DIR}/CPP/Windows/FileDir.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/FileFind.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/FileIO.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/FileName.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/PropVariant.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/PropVariantConv.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/PropVariantUtils.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/System.cpp
	${7ZIP_SOURCE_DIR}/CPP/Windows/TimeUtils.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/CreateCoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/CWrappers.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/InBuffer.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/InOutTempBuffer.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/FilterCoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/LimitedStreams.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/LockedStream.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/MethodId.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/MethodProps.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/OffsetStream.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/OutBuffer.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/ProgressUtils.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/PropId.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/StreamObjects.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/StreamUtils.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Common/UniqBlocks.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ApfsHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ApmHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ArHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ArjHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Base64Handler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Bz2Handler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ComHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/CpioHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/CramfsHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/DeflateProps.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/DmgHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ElfHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ExtHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/FatHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/FlvHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/GzHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/GptHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/HandlerCont.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/HfsHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/IhexHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/LpHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/LzhHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/LzmaHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/MachoHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/MbrHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/MslzHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/MubHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/NtfsHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/PeHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/PpmdHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/QcowHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/RpmHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/SparseHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/SplitHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/SquashfsHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/SwfHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/UefiHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/VdiHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/VhdHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/VhdxHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/VmdkHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/XarHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/XzHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ZHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ZstdHandler.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/CoderMixer2.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/DummyOutStream.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/FindSignature.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/InStreamWithCRC.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/ItemNameUtils.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/MultiStream.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/OutStreamWithCRC.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/OutStreamWithSha1.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/HandlerOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Common/ParseProperties.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zCompressionMode.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zDecode.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zEncode.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zExtract.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zFolderInStream.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zHandlerOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zHeader.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zIn.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zProperties.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zSpecStream.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zUpdate.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/7z/7zRegister.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Cab/CabBlockInStream.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Cab/CabHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Cab/CabHeader.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Cab/CabIn.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Cab/CabRegister.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Chm/ChmHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Chm/ChmIn.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Iso/IsoHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Iso/IsoHeader.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Iso/IsoIn.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Iso/IsoRegister.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Nsis/NsisDecode.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Nsis/NsisHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Nsis/NsisIn.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Nsis/NsisRegister.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Tar/TarHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Tar/TarHandlerOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Tar/TarHeader.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Tar/TarIn.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Tar/TarOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Tar/TarUpdate.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Tar/TarRegister.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Udf/UdfHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Udf/UdfIn.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Wim/WimHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Wim/WimHandlerOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Wim/WimIn.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Wim/WimRegister.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipAddCommon.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipHandler.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipHandlerOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipIn.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipItem.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipOut.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipUpdate.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Zip/ZipRegister.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Bcj2Coder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Bcj2Register.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BcjCoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BcjRegister.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BitlDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BranchMisc.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BranchRegister.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/ByteSwap.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BZip2Crc.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BZip2Decoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BZip2Encoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/BZip2Register.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/CodecExports.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/CopyCoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/CopyRegister.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Deflate64Register.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/DeflateDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/DeflateEncoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/DeflateRegister.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/DeltaFilter.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/ImplodeDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzfseDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzhDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Lzma2Decoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Lzma2Encoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Lzma2Register.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzmaDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzmaEncoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzmaRegister.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzmsDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzOutWindow.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/LzxDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/PpmdDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/PpmdEncoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/PpmdRegister.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/PpmdZip.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/QuantumDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/ShrinkDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/XpressDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/XzDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/XzEncoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/ZlibDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/ZlibEncoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/ZDecoder.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/ZstdDecoder.cpp

	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/7zAes.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/7zAesRegister.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/HmacSha1.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/HmacSha256.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/MyAes.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/MyAesReg.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/Pbkdf2HmacSha1.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/RandGen.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/WzAes.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/ZipCrypto.cpp
	${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/ZipStrong.cpp

	${7ZIP_SOURCE_DIR}/C/7zBuf2.c
	${7ZIP_SOURCE_DIR}/C/7zCrc.c
	${7ZIP_SOURCE_DIR}/C/7zCrcOpt.c
	${7ZIP_SOURCE_DIR}/C/7zStream.c
	${7ZIP_SOURCE_DIR}/C/Alloc.c
	${7ZIP_SOURCE_DIR}/C/Bcj2.c
	${7ZIP_SOURCE_DIR}/C/Bcj2Enc.c
	${7ZIP_SOURCE_DIR}/C/Blake2s.c
	${7ZIP_SOURCE_DIR}/C/Bra.c
	${7ZIP_SOURCE_DIR}/C/Bra86.c
	${7ZIP_SOURCE_DIR}/C/BraIA64.c
	${7ZIP_SOURCE_DIR}/C/BwtSort.c
	${7ZIP_SOURCE_DIR}/C/CpuArch.c
	${7ZIP_SOURCE_DIR}/C/Delta.c
	${7ZIP_SOURCE_DIR}/C/HuffEnc.c
	${7ZIP_SOURCE_DIR}/C/LzFind.c
	${7ZIP_SOURCE_DIR}/C/Lzma2Dec.c
	${7ZIP_SOURCE_DIR}/C/Lzma2DecMt.c
	${7ZIP_SOURCE_DIR}/C/Lzma2Enc.c
	${7ZIP_SOURCE_DIR}/C/LzmaDec.c
	${7ZIP_SOURCE_DIR}/C/LzmaEnc.c
	${7ZIP_SOURCE_DIR}/C/Md5.c
	${7ZIP_SOURCE_DIR}/C/MtCoder.c
	${7ZIP_SOURCE_DIR}/C/MtDec.c
	${7ZIP_SOURCE_DIR}/C/Ppmd7.c
	${7ZIP_SOURCE_DIR}/C/Ppmd7Dec.c
	${7ZIP_SOURCE_DIR}/C/Ppmd7aDec.c
	${7ZIP_SOURCE_DIR}/C/Ppmd7Enc.c
	${7ZIP_SOURCE_DIR}/C/Ppmd8.c
	${7ZIP_SOURCE_DIR}/C/Ppmd8Dec.c
	${7ZIP_SOURCE_DIR}/C/Ppmd8Enc.c
	${7ZIP_SOURCE_DIR}/C/Sort.c
	${7ZIP_SOURCE_DIR}/C/SwapBytes.c
	${7ZIP_SOURCE_DIR}/C/Xxh64.c
	${7ZIP_SOURCE_DIR}/C/Xz.c
	${7ZIP_SOURCE_DIR}/C/XzDec.c
	${7ZIP_SOURCE_DIR}/C/XzEnc.c
	${7ZIP_SOURCE_DIR}/C/XzIn.c
	${7ZIP_SOURCE_DIR}/C/XzCrc64.c
	${7ZIP_SOURCE_DIR}/C/XzCrc64Opt.c
	${7ZIP_SOURCE_DIR}/C/Aes.c
	${7ZIP_SOURCE_DIR}/C/AesOpt.c
	${7ZIP_SOURCE_DIR}/C/Sha1.c
	${7ZIP_SOURCE_DIR}/C/Sha1Opt.c
	${7ZIP_SOURCE_DIR}/C/Sha256.c
	${7ZIP_SOURCE_DIR}/C/Sha256Opt.c
	${7ZIP_SOURCE_DIR}/C/Sha3.c
	${7ZIP_SOURCE_DIR}/C/Sha512.c
	${7ZIP_SOURCE_DIR}/C/Sha512Opt.c
	${7ZIP_SOURCE_DIR}/C/ZstdDec.c
)

if(7ZIP_USE_EXPORTS)
	list(APPEND 7ZIP_SOURCES
		${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/ArchiveExports.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/DllExports2.cpp
	)
endif()

if(7ZIP_USE_ASM)
	if(CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|AMD64|amd64|i.86)$")
		find_program(7ZIP_NASM_EXECUTABLE nasm)
		if(7ZIP_NASM_EXECUTABLE)
			enable_language(ASM_NASM)
			list(APPEND 7ZIP_SOURCES ${7ZIP_SOURCE_DIR}/Asm/x86/LzmaDecOpt.asm)
			list(APPEND 7ZIP_COMPILE_DEFINITIONS Z7_7ZIP_ASM)
			message(STATUS "7-Zip ASM enabled: ${7ZIP_NASM_EXECUTABLE}")
		else()
			message(
				WARNING
				"7ZIP_USE_ASM=ON but NASM was not found. "
				"Building 7-Zip without x86 ASM."
			)
		endif()
	elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64)$")
		list(APPEND 7ZIP_SOURCES ${7ZIP_SOURCE_DIR}/Asm/arm64/LzmaDecOpt.S)
		list(APPEND 7ZIP_COMPILE_DEFINITIONS Z7_7ZIP_ASM)
		message(STATUS "7-Zip ARM64 ASM enabled")
	endif()
endif()

if(MINGW)
	list(APPEND 7ZIP_COMPILE_DEFINITIONS Z7_ST)
	list(APPEND 7ZIP_SOURCES
		${7ZIP_SOURCE_DIR}/C/Threads.c
		${7ZIP_SOURCE_DIR}/CPP/7zip/Bundles/Format7zF/resource.rc
	)
else()
	list(APPEND 7ZIP_SOURCES
		${7ZIP_SOURCE_DIR}/C/LzFindMt.c
		${7ZIP_SOURCE_DIR}/C/LzFindOpt.c
		${7ZIP_SOURCE_DIR}/C/Threads.c
		${7ZIP_SOURCE_DIR}/CPP/7zip/Common/StreamBinder.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Common/VirtThread.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Common/MemBlocks.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Common/OutMemStream.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Common/ProgressMt.cpp
		${7ZIP_SOURCE_DIR}/CPP/Common/MyWindows.cpp
	)
endif()

if(NOT 7ZIP_DISABLE_RAR)
	list(APPEND 7ZIP_SOURCES
		${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Rar/RarHandler.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Archive/Rar/Rar5Handler.cpp

		${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Rar1Decoder.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Rar2Decoder.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Rar3Decoder.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Rar3Vm.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/Rar5Decoder.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Compress/RarCodecsRegister.cpp

		${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/Rar20Crypto.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/Rar5Aes.cpp
		${7ZIP_SOURCE_DIR}/CPP/7zip/Crypto/RarAes.cpp
	)
endif()

add_library(7zip OBJECT ${7ZIP_SOURCES})
target_include_directories(
	7zip
	PRIVATE
		${7ZIP_SOURCE_DIR}/CPP
		${7ZIP_SOURCE_DIR}/C
)
target_compile_definitions(7zip PRIVATE ${7ZIP_COMPILE_DEFINITIONS})

if(NOT MSVC)
	target_compile_options(
		7zip
		PRIVATE
			-Wall
			-Wextra
			-D_REENTRANT
			-D_FILE_OFFSET_BITS=64
			-D_LARGEFILE_SOURCE
	)

	set_target_properties(
		7zip
		PROPERTIES
			POSITION_INDEPENDENT_CODE ON
	)

endif()

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
	target_compile_options(
		7zip
		PRIVATE
			-g
	)
else()
	target_compile_definitions(
		7zip
		PRIVATE
			NDEBUG
	)
endif()

if(NOT MSVC)
	target_compile_options(
		7zip
		PRIVATE
			$<$<CONFIG:Release>:-O2>
			$<$<CONFIG:RelWithDebInfo>:-O2>
			$<$<CONFIG:MinSizeRel>:-O2>
	)
endif()
