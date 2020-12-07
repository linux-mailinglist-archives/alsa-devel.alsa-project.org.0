Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F02D28B5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 11:21:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C289716E2;
	Tue,  8 Dec 2020 11:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C289716E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607422881;
	bh=r+oqaWrhvZx2rQNN3uv8mWFnCqrtfpXal6hlZFMTFyM=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fmhtj5Bd9VWt5XADxi6yZ4Ur899pr4Xe6pv4McJWfG8/uKdaxzGycauzRpxLsKoqT
	 IsMkZglOxXGHb/VEtHZvAbJdcOjxa5I1OL29UyJ+/sqJDnpEu23ZaLDKA3atPSIlGt
	 ApUa1/44nesoWVP4qb2HbvBrx4omipqDT1vQoq1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6C3F80130;
	Tue,  8 Dec 2020 11:19:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59086F8020D; Mon,  7 Dec 2020 16:37:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,WEIRD_PORT autolearn=disabled
 version=3.4.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9040DF8010A
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 16:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9040DF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VPcjQF7P"
Received: by mail-il1-x12a.google.com with SMTP id x15so12582708ilq.1
 for <alsa-devel@alsa-project.org>; Mon, 07 Dec 2020 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QnD5jPPHRe8n4peIldaw45i4p42Xc3VMGykAnqUsUU4=;
 b=VPcjQF7PXlNoxUKjEL4PAKZGc+ndL6SLfDS38KGfhKopc0TnsKn1joZ4rbSpFmyz64
 LVeZh+JXypwZkfGqzo2WUXnKyQVp7ivkvI8FTk+EYjwrebZVz1e/M6FtEGt+NKW0XtYm
 VxijgsCnnUH2TYEHwt9xy+TNYz7jNQ3bjdzeMQAy3NMHRMVWQLWpn9x/mHrSALj2ujvZ
 dQUwwecd6G1IpHQbz5rIUMAjWMxZ+n1513yaVaBH8aGdpVBGL87Lx99NDUit9MppjaIe
 la+Ao2zkXUwfwhJfvoZFnXxNeAdJOdd7izqzpin+stvSsk/53AFAXXY70FKeUQ61vnSr
 F4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QnD5jPPHRe8n4peIldaw45i4p42Xc3VMGykAnqUsUU4=;
 b=iGdRAHIajg6bUR2XjlbnQPlDITcRKYuPnaqtNIFhn3iWhasZxwzM/ldy1KW2ydaY1G
 xlACnMNVJ9vrNmZ26FDmW3H06FbRRN/NFm1WTIxi3ed7FS4+VmdEOx7tPtMuSgDYelPU
 k/9f89LtgwpxohXMt7gEH53Ng5RRypA+GZR9d65f92oUtPaFX6c57JhIaIeV9NuId09h
 JJh7KMGZfu/hwkQG7NtrbrDgJZoziqm+10SMuRLX/VVK8NC5k8YKDYLqc2rwJRTV2dmG
 u0yy4CBDS87Kt6oizwxAzlr8/ySayHkmz/udweMOh8QwQ3b1vj/03lztRWBlxWUZo+zA
 VtZA==
X-Gm-Message-State: AOAM532JJ9lf+axOcUzJNjHEkxBD3CCNcDUl9YwL51Qc5ak+KudYLkIy
 izdbcIudbqHgIgfJvVtevRBal4CXcX93f0se/4xrmqDoFxs=
X-Google-Smtp-Source: ABdhPJzAUNJZR9Ya5ZNOWp/N97Xr4VDR/frbny5VNieQ4587h+2//NpL5w0xkyszA+r9ojFcYekQhrmiD/dw83zDmck=
X-Received: by 2002:a92:3211:: with SMTP id z17mr22851951ile.148.1607355459722; 
 Mon, 07 Dec 2020 07:37:39 -0800 (PST)
MIME-Version: 1.0
From: Caio Lima <caiodm2@gmail.com>
Date: Mon, 7 Dec 2020 12:37:28 -0300
Message-ID: <CAPYhKC8gpR=yMkM=zBa=qSaWJgexXhzR4E5jnH57WR2EMp67tw@mail.gmail.com>
Subject: Alsa-lib compilation error
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 08 Dec 2020 11:19:44 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello ALSA-devel team, nice to contact you. Firstly I want to let you know
I'm a fan of the work of you guys of the ALSA Project, specifically of the
alsa-lib of which I had a little experience.
I'm needing help with the compile of the alsa-lib library, I'm using cygwin
and following the instructions in the "INSTALL" file inside the source but
during the compiling with the command "./gitcompile" I'm getting some
errors, here the entire log:

Caio@Caio-PC ~/alsa-lib
$ ./gitcompile
configure.ac:30: installing './compile'
configure.ac:15: installing './config.guess'
configure.ac:15: installing './config.sub'
configure.ac:16: installing './install-sh'
configure.ac:16: installing './missing'
alsalisp/Makefile.am: installing './depcomp'
parallel-tests: installing './test-driver'
CFLAGS=3D-O2 -Wall -W -Wunused-const-variable=3D0 -pipe -g
./configure --disable-aload --prefix=3D/usr --libdir=3D/usr/lib
--with-plugindir=3D/usr/lib/alsa-lib --with-pkgconfdir=3D/usr/lib/pkgconfig
configure: loading site script /usr/share/config.site
checking build system type... x86_64-pc-cygwin
checking host system type... x86_64-pc-cygwin
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether to enable maintainer-specific portions of Makefiles... yes
checking whether make supports nested variables... (cached) yes
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.exe
checking for suffix of executables... .exe
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking whether gcc understands -c and -o together... yes
checking whether make supports the include directive... yes (GNU style)
checking dependency style of gcc... gcc3
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking whether ln -s works... yes
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for fgrep... /usr/bin/grep -F
checking for ld used by gcc... /usr/x86_64-pc-cygwin/bin/ld.exe
checking if the linker (/usr/x86_64-pc-cygwin/bin/ld.exe) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
checking the name lister (/usr/bin/nm -B) interface... BSD nm
checking the maximum length of command line arguments... 8192
checking how to convert x86_64-pc-cygwin file names to x86_64-pc-cygwin
format... func_convert_file_noop
checking how to convert x86_64-pc-cygwin file names to toolchain format...
func_convert_file_noop
checking for /usr/x86_64-pc-cygwin/bin/ld.exe option to reload object
files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... file_magic ^x86 archive
import|^x86 DLL
checking for dlltool... dlltool
checking how to associate runtime and link libraries...
func_cygming_dll_for_implib
checking for ar... ar
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm -B output from gcc object... ok
checking for sysroot... no
checking for a working dd... /usr/bin/dd
checking how to truncate binary pipes... /usr/bin/dd bs=3D4096 count=3D1
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -DDLL_EXPORT -DPIC
checking if gcc PIC flag -DDLL_EXPORT -DPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/x86_64-pc-cygwin/bin/ld.exe) supports
shared libraries... yes
checking whether -lc should be explicitly linked in... yes
checking dynamic linker characteristics... Win32 ld.exe
checking how to hardcode library paths into programs... immediate
checking whether a program can dlopen itself... yes
checking whether a statically linked program can dlopen itself... yes
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking if gcc supports -Wl,--no-undefined flag... yes
checking if gcc supports -Wl,-z,defs flag...
checking for ANSI C header files... (cached) yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking whether time.h and sys/time.h may both be included... yes
checking whether gcc needs -traditional... no
checking for uselocale... yes
checking for library version... major 1 minor 2 subminor 4 extrastr
 extraver 1000000
checking for versioned symbols... yes
checking for symbolic-functions... no
checking for custom symbol prefixes...
checking for debug... yes
checking for debug assert... no
checking for tmpdir... /tmp
checking for softfloat... no
checking for libdl... checking for dlsym in -ldl... yes
checking for pthread... checking for pthread_join in -lpthread... yes
checking whether PTHREAD_MUTEX_RECURSIVE is declared... yes
checking for __thread... yes
checking for librt... checking for clock_gettime in -lrt... yes
checking for use of wordexp... no
checking endian.h usability... yes
checking endian.h presence... yes
checking for endian.h... yes
checking sys/endian.h usability... no
checking sys/endian.h presence... no
checking for sys/endian.h... no
checking sys/shm.h usability... yes
checking sys/shm.h presence... yes
checking for sys/shm.h... yes
checking for resmgr support... no
checking for aload* support... no
checking for ALSA device file directory... /dev/snd/
checking for aload* device file directory... /dev/
checking whether GCC supports builtin atomic intrinsics... yes
checking for default lockless dmix... no
checking for max number of cards... 32
checking for thread-safe API functions... yes
Making a symlink include/alsa
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating doc/pictures/Makefile
config.status: creating doc/doxygen.cfg
config.status: creating include/Makefile
config.status: creating include/sound/Makefile
config.status: creating include/sound/uapi/Makefile
config.status: creating src/Versions
config.status: creating src/Makefile
config.status: creating src/control/Makefile
config.status: creating src/mixer/Makefile
config.status: creating src/pcm/Makefile
config.status: creating src/pcm/scopes/Makefile
config.status: creating src/rawmidi/Makefile
config.status: creating src/timer/Makefile
config.status: creating src/hwdep/Makefile
config.status: creating src/seq/Makefile
config.status: creating src/ucm/Makefile
config.status: creating src/alisp/Makefile
config.status: creating src/topology/Makefile
config.status: creating src/conf/Makefile
config.status: creating src/conf/cards/Makefile
config.status: creating src/conf/pcm/Makefile
config.status: creating modules/Makefile
config.status: creating modules/mixer/Makefile
config.status: creating modules/mixer/simple/Makefile
config.status: creating alsalisp/Makefile
config.status: creating aserver/Makefile
config.status: creating test/Makefile
config.status: creating test/lsb/Makefile
config.status: creating utils/Makefile
config.status: creating utils/alsa-lib.spec
config.status: creating utils/alsa.pc
config.status: creating utils/alsa-topology.pc
config.status: creating include/config.h
config.status: executing depfiles commands
config.status: executing libtool commands
Creating asoundlib.h...
Making all in doc
make[1]: Entering directory '/home/Caio/alsa-lib/doc'
Making all in pictures
make[2]: Entering directory '/home/Caio/alsa-lib/doc/pictures'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/Caio/alsa-lib/doc/pictures'
make[2]: Entering directory '/home/Caio/alsa-lib/doc'
make[2]: Nothing to be done for 'all-am'.
make[2]: Leaving directory '/home/Caio/alsa-lib/doc'
make[1]: Leaving directory '/home/Caio/alsa-lib/doc'
Making all in include
make[1]: Entering directory '/home/Caio/alsa-lib/include'
make  all-recursive
make[2]: Entering directory '/home/Caio/alsa-lib/include'
Making all in sound
make[3]: Entering directory '/home/Caio/alsa-lib/include/sound'
Making all in uapi
make[4]: Entering directory '/home/Caio/alsa-lib/include/sound/uapi'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/Caio/alsa-lib/include/sound/uapi'
make[4]: Entering directory '/home/Caio/alsa-lib/include/sound'
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '/home/Caio/alsa-lib/include/sound'
make[3]: Leaving directory '/home/Caio/alsa-lib/include/sound'
make[3]: Entering directory '/home/Caio/alsa-lib/include'
Updating version.h
make[3]: Leaving directory '/home/Caio/alsa-lib/include'
make[2]: Leaving directory '/home/Caio/alsa-lib/include'
make[1]: Leaving directory '/home/Caio/alsa-lib/include'
Making all in src
make[1]: Entering directory '/home/Caio/alsa-lib/src'
Making all in control
make[2]: Entering directory '/home/Caio/alsa-lib/src/control'
  CC       cards.lo
In file included from ../../include/local.h:25,
                 from control_local.h:22,
                 from cards.c:35:
../../include/config.h:226: warning: "__SYMBOL_PREFIX" redefined
  226 | #define __SYMBOL_PREFIX ""
      |
In file included from /usr/include/sys/config.h:238,
                 from /usr/include/_ansi.h:11,
                 from /usr/include/stdio.h:29,
                 from cards.c:28:
/usr/include/cygwin/config.h:58: note: this is the location of the previous
definition
   58 | # define __SYMBOL_PREFIX
      |
In file included from ../../include/sound/asound.h:11,
                 from ../../include/local.h:146,
                 from control_local.h:22,
                 from cards.c:35:
../../include/alsa/sound/uapi/asound.h:512:2: error: unknown type name
=E2=80=98__s64=E2=80=99
  512 |  __s64 tv_sec;
      |  ^~~~~
../../include/alsa/sound/uapi/asound.h:513:2: error: unknown type name
=E2=80=98__s64=E2=80=99
  513 |  __s64 tv_nsec;
      |  ^~~~~
cards.c: In function =E2=80=98snd_card_load2=E2=80=99:
../../include/alsa/sound/uapi/asound.h:1064:35: warning: implicit
declaration of function =E2=80=98_IOR=E2=80=99 [-Wimplicit-function-declara=
tion]
 1064 | #define SNDRV_CTL_IOCTL_CARD_INFO _IOR('U', 0x01, struct
snd_ctl_card_info)
      |                                   ^~~~
cards.c:49:23: note: in expansion of macro =E2=80=98SNDRV_CTL_IOCTL_CARD_IN=
FO=E2=80=99
   49 |   if (ioctl(open_dev, SNDRV_CTL_IOCTL_CARD_INFO, &info) < 0) {
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
../../include/alsa/sound/uapi/asound.h:1064:51: error: expected expression
before =E2=80=98struct=E2=80=99
 1064 | #define SNDRV_CTL_IOCTL_CARD_INFO _IOR('U', 0x01, struct
snd_ctl_card_info)
      |                                                   ^~~~~~
cards.c:49:23: note: in expansion of macro =E2=80=98SNDRV_CTL_IOCTL_CARD_IN=
FO=E2=80=99
   49 |   if (ioctl(open_dev, SNDRV_CTL_IOCTL_CARD_INFO, &info) < 0) {
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from cards.c:32:
cards.c: In function =E2=80=98snd_card_get_index=E2=80=99:
cards.c:133:15: warning: array subscript has type =E2=80=98char=E2=80=99 [-=
Wchar-subscripts]
  133 |  if ((isdigit(*string) && *(string + 1) =3D=3D 0) ||
      |               ^~~~~~~
cards.c:134:15: warning: array subscript has type =E2=80=98char=E2=80=99 [-=
Wchar-subscripts]
  134 |      (isdigit(*string) && isdigit(*(string + 1)) && *(string + 2)
=3D=3D 0)) {
      |               ^~~~~~~
cards.c:134:35: warning: array subscript has type =E2=80=98char=E2=80=99 [-=
Wchar-subscripts]
  134 |      (isdigit(*string) && isdigit(*(string + 1)) && *(string + 2)
=3D=3D 0)) {
      |                                   ^~~~~~~~~~~~~
make[2]: *** [Makefile:404: cards.lo] Error 1
make[2]: Leaving directory '/home/Caio/alsa-lib/src/control'
make[1]: *** [Makefile:554: all-recursive] Error 1
make[1]: Leaving directory '/home/Caio/alsa-lib/src'
make: *** [Makefile:405: all-recursive] Error 1

I would really appreciate your help with this issue!

Regards

Caio H. Lima
