#ifndef MZ_CONFIG_H
#define MZ_CONFIG_H

#define HAVE_DIRENT_H 1
#define HAVE_SYS_DIRENT_H 0
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_PDIR 1
#define HAVE_FSEEKO 1
#define HAVE_SYMLINK 1
#define HAVE_READLINK 1
#define HAVE_ZLIB 1
#define ZLIB_COMPAT 1

#ifndef MZ_ZIP_NO_CRYPTO
#define MZ_ZIP_NO_CRYPTO 1
#endif

#ifndef MZ_ZIP_NO_ENCRYPTION
#define MZ_ZIP_NO_ENCRYPTION 1
#endif

#endif
