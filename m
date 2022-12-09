Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18863647AB6
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 01:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E0A822;
	Fri,  9 Dec 2022 01:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E0A822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670545376;
	bh=jI6SUhmH5MM/ri61KzBdYeQoCpVBl8dA0+fl87Yrajc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sCPDSormtRkvGptBo0q3bPV1rLAQgZzqxvOXBPk44vZCd/Ot0wDR62ZuAN6QE6VXd
	 lbMuF8/gfBHOK5OpixgXj2+dkgF6dpUkNkHn6gyF4/8GN2mW+CvAMbsOmRNBCnKXX3
	 5gZfFYi28MwOSlJb8Rr3BRxcSNROWGx62hQBaO28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41AC5F800F8;
	Fri,  9 Dec 2022 01:21:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32424F80132; Fri,  9 Dec 2022 01:21:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 34840F80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 01:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34840F80007
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1670545314591640949-webhooks-bot@alsa-project.org>
References: <1670545314591640949-webhooks-bot@alsa-project.org>
Subject: Build Fails with AUTOMAKE v1.16.5 on Ubuntu - Solution Provided
Message-Id: <20221209002157.32424F80132@alsa1.perex.cz>
Date: Fri,  9 Dec 2022 01:21:57 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-utils issue #182 was opened from frkli1965:

I found that the prescribed compilation method in the 'INSTALL' file did not work on Ubuntu with Linux kernel v6.0.9 using 'automake 'and 'aclocal'  v1.16.5!

The following errors were encountered:-

Updating EXTRA_DIST in m4/Makefile.am (backup is in m4/Makefile.am~)
Updating configure.ac (backup is in configure.ac~)
Adding an entry to ChangeLog (backup is in ChangeLog~)

Please run 'aclocal -I m4' to regenerate the aclocal.m4 file.
You need aclocal from GNU automake 1.9 (or newer) to do this.
Then run 'autoconf' to regenerate the configure file.

You might also want to copy the convenience header file gettext.h
from the /usr/share/gettext directory into your package.
It is a wrapper around <libintl.h> that implements the configure --disable-nls
option.

Press Return to acknowledge the previous two paragraphs.

configure.ac:466: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
./lib/autoconf/status.m4:289: AC_CONFIG_FILES is expanded from...
configure.ac:466: the top level
autom4te: error: /usr/bin/m4 failed with exit status: 1
autoheader: error: '/usr/bin/autom4te' failed with exit status: 1
configure.ac:466: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
./lib/autoconf/status.m4:289: AC_CONFIG_FILES is expanded from...
configure.ac:466: the top level
autom4te: error: /usr/bin/m4 failed with exit status: 1
automake: error: autoconf failed with exit status: 1
configure.ac:466: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
./lib/autoconf/status.m4:289: AC_CONFIG_FILES is expanded from...
configure.ac:466: the top level
autom4te: error: /usr/bin/m4 failed with exit status: 1


****************************************** THE FIX ******************************************

git clone https://github.com/alsa-project/alsa-utils.git
cd alsa-utils
wget https://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess
wget https://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.sub
aclocal --force -I m4
autoreconf -fiv
gettextize
autoheader
automake --foreign --copy --add-missing
./configure --disable-alsatest --disable-alsaconf --disable-bat --disable-xmlto --with-curses=ncursesw
make

*********************************************************************************************

Despite lots of warnings as follows:-

libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
configure.ac:22: warning: The macro `AM_PROG_LIBTOOL' is obsolete.
configure.ac:26: warning: The macro `AC_ERROR' is obsolete.
configure.ac:223: warning: The macro `AC_HEADER_STDC' is obsolete.
configure.ac:313: warning: The macro `AC_TRY_LINK' is obsolete.
configure.ac:397: warning: The macro `AC_HEADER_TIME' is obsolete.
configure.ac:466: warning: AC_OUTPUT should be used without arguments.
alsactl/Makefile.am:69: warning: '%'-style pattern rules are a GNU make extension
gettextize: *** po/Makefile.in.in exists: use option -f if you really want to delete it.

and ones regarding the .po files e.g.

fr.po:828: warning: internationalised messages should not contain the '\r' escape sequence
eu.po:849: warning: internationalised messages should not contain the '\r' escape sequence

etc...

The build and installation succeeded nevertheless.

One other issue was that 'alsamixer' refused to run unless a system link was created for 'libasound_module_ctl_pipewire.so' as follows:-

sudo ln -s /usr/local/lib/x86_64-linux-gnu/alsa-lib/libasound_module_ctl_pipewire.so /usr/local/lib/alsa-lib/libasound_module_ctl_pipewire.so

which is most likely an Ubuntu (Debian) specific problem.

The following toolchain was utilised:-

aclocal (GNU automake) 1.16.5
autoreconf (GNU Autoconf) 2.71
gettextize (GNU gettext-tools) 0.21
autoheader (GNU Autoconf) 2.71
automake (GNU automake) 1.16.5
gcc version 12.1.0 (Ubuntu 12.1.0-2ubuntu1~22.04)

You're welcome!!!

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/182
Repository URL: https://github.com/alsa-project/alsa-utils
