// swift-tools-version:5.9

import PackageDescription

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
                "mz_crypt_openssl.c",
                "mz_crypt_winvista.c",
                "mz_crypt_winxp.c",
                "mz_os_win32.c",
                "mz_strm_bzip.c",
                "mz_strm_bzip.h",
                "mz_strm_libcomp.c",
                "mz_strm_libcomp.h",
                "mz_strm_lzma.c",
                "mz_strm_lzma.h",
                "mz_strm_os_win32.c",
                "mz_strm_ppmd.c",
                "mz_strm_ppmd.h",
                "mz_strm_zstd.c",
                "mz_strm_zstd.h",
                "mz_config.h.cmakein",
                "minizip.pc.cmakein",
                ".clang-format",
                ".codecov.yaml",
                "INDEX.md",
                "LICENSE",
                "README.md"
            ],
            sources: [
                "mz_crypt.c",
                "mz_crypt_apple.c",
                "mz_os.c",
                "mz_os_posix.c",
                "mz_strm.c",
                "mz_strm_buf.c",
                "mz_strm_mem.c",
                "mz_strm_os_posix.c",
                "mz_strm_pkcrypt.c",
                "mz_strm_split.c",
                "mz_strm_wzaes.c",
                "mz_strm_zlib.c",
                "mz_zip.c",
                "mz_zip_rw.c"
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("."),
                .define("unix", to: "1"),
                .define("HAVE_ZLIB", to: "1"),
                .define("ZLIB_COMPAT", to: "1"),
                .define("HAVE_WZAES", to: "1"),
                .define("HAVE_PKCRYPT", to: "1"),
                .define("NOCRYPT"),
                .define("NOUNCRYPT"),
                .unsafeFlags(["-w", "-fvisibility=hidden"])
            ],
            linkerSettings: [
                .linkedLibrary("z")
            ]
        )
    ],
    cLanguageStandard: .gnu11
)
