// swift-tools-version:5.9
//  Package.swift
//  minizip-ng
//
//  Created by Magesh K on 28/07/26.
//  Copyright © 2026 SideStore. All rights reserved.
//

import PackageDescription

#if os(Windows)
let osSources = [
    "mz_os_win32.c",
    "mz_strm_os_win32.c"
]
let osExcludes = [
    "mz_os_posix.c",
    "mz_strm_os_posix.c"
]
let osDefines: [CSetting] = [
    .define("_CRT_SECURE_NO_WARNINGS"),
    .define("_CRT_NONSTDC_NO_WARNINGS")
]
let linkerLibs: [LinkerSetting] = []
#else
let osSources = [
    "mz_os_posix.c",
    "mz_strm_os_posix.c"
]
let osExcludes = [
    "mz_os_win32.c",
    "mz_strm_os_win32.c"
]
let osDefines: [CSetting] = [
    .define("unix", to: "1")
]
let linkerLibs: [LinkerSetting] = [
    .linkedLibrary("z")
]
#endif

let package = Package(
    name: "minizip-ng",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "minizip-ng",
            targets: ["minizip-ng"]
        )
    ],
    targets: [
        .target(
            name: "minizip-ng",
            path: ".",
            exclude: [
                "CMakeLists.txt",
                "cmake",
                "compat",
                "doc",
                "test",
                "minigzip.c",
                "minizip.c",
                "mz_crypt_apple.c",
                "mz_crypt_openssl.c",
                "mz_crypt_winvista.c",
                "mz_crypt_winxp.c",
                "mz_strm_bzip.c",
                "mz_strm_bzip.h",
                "mz_strm_libcomp.c",
                "mz_strm_libcomp.h",
                "mz_strm_lzma.c",
                "mz_strm_lzma.h",
                "mz_strm_pkcrypt.c",
                "mz_strm_pkcrypt.h",
                "mz_strm_ppmd.c",
                "mz_strm_ppmd.h",
                "mz_strm_wzaes.c",
                "mz_strm_wzaes.h",
                "mz_strm_zstd.c",
                "mz_strm_zstd.h",
                "mz_config.h.cmakein",
                "minizip.pc.cmakein",
                ".clang-format",
                ".codecov.yaml",
                "INDEX.md",
                "LICENSE",
                "README.md"
            ] + osExcludes,
            sources: [
                "mz_crypt.c",
                "mz_os.c",
                "mz_strm.c",
                "mz_strm_buf.c",
                "mz_strm_mem.c",
                "mz_strm_split.c",
                "mz_strm_zlib.c",
                "mz_zip.c",
                "mz_zip_rw.c"
            ] + osSources,
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("."),
                .define("HAVE_ZLIB", to: "1"),
                .define("ZLIB_COMPAT", to: "1"),
                .define("MZ_ZIP_NO_ENCRYPTION"),
                .define("MZ_ZIP_NO_CRYPTO"),
                .unsafeFlags(["-w"])
            ] + osDefines,
            linkerSettings: linkerLibs
        )
    ],
    cLanguageStandard: .gnu11
)
