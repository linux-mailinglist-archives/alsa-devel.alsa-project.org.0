Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C282377DDD6
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 11:51:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC91847;
	Wed, 16 Aug 2023 11:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC91847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692179502;
	bh=W07l8Ws8Hy74/qwzQC1Q10z7EN4t1ynvDjHJjgf2V5g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bhelkRlNmh/xjDdDMIjYnbeOVUNDHxjo0Ll8wE61PRS3dTo06ksScA5nDKB+b/1mv
	 lKGooavElfK/lhmcIzog8W34D69lAkqZ0UCxYtuempIfFt2zs83Rz0qVPGDtvosfmt
	 XdF2iON+gyN37u9zDlgC7N4YuFpNFHjvdN3Qm+BY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE855F80568; Wed, 16 Aug 2023 11:50:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45378F80557;
	Wed, 16 Aug 2023 11:50:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9126F8055A; Wed, 16 Aug 2023 11:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AFF1F80551
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 11:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AFF1F80551
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692179446222721577-webhooks-bot@alsa-project.org>
References: <1692179446222721577-webhooks-bot@alsa-project.org>
Subject: Build fails
Message-Id: <20230816095047.B9126F8055A@alsa1.perex.cz>
Date: Wed, 16 Aug 2023 11:50:47 +0200 (CEST)
Message-ID-Hash: P7XQXTX3CXTNHQIRXUUCDSN257JRPUCU
X-Message-ID-Hash: P7XQXTX3CXTNHQIRXUUCDSN257JRPUCU
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7XQXTX3CXTNHQIRXUUCDSN257JRPUCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #230 was edited from symdeb:

Follow INSTALL

$ls -l
total 148
-rw-rw-r-- 1 user user   440 Aug 16 17:40 acinclude.m4
drwxrwxr-x 3 user user  4096 Aug 16 17:40 alsaconf
drwxrwxr-x 3 user user  4096 Aug 16 17:40 alsactl
drwxrwxr-x 2 user user  4096 Aug 16 17:40 alsa-info
drwxrwxr-x 2 user user  4096 Aug 16 17:40 alsaloop
drwxrwxr-x 2 user user  4096 Aug 16 17:40 alsamixer
drwxrwxr-x 2 user user  4096 Aug 16 17:40 alsaucm
drwxrwxr-x 2 user user  4096 Aug 16 17:40 amidi
drwxrwxr-x 2 user user  4096 Aug 16 17:40 amixer
drwxrwxr-x 2 user user  4096 Aug 16 17:40 aplay
drwxrwxr-x 3 user user  4096 Aug 16 17:40 axfer
drwxrwxr-x 3 user user  4096 Aug 16 17:40 bat
-rw-rw-r-- 1 user user  1055 Aug 16 17:40 ChangeLog
-rw-rw-r-- 1 user user 17587 Aug 16 17:40 configure.ac
-rw-rw-r-- 1 user user 18002 Aug 16 17:40 COPYING
-rwxrwxr-x 1 user user   780 Aug 16 17:40 gitcompile
drwxrwxr-x 2 user user  4096 Aug 16 17:40 iecset
drwxrwxr-x 2 user user  4096 Aug 16 17:40 include
-rw-rw-r-- 1 user user  1595 Aug 16 17:40 INSTALL
drwxrwxr-x 2 user user  4096 Aug 16 17:40 m4
-rw-rw-r-- 1 user user  1063 Aug 16 17:40 Makefile.am
drwxrwxr-x 2 user user  4096 Aug 16 17:40 nhlt
drwxrwxr-x 2 user user  4096 Aug 16 17:40 po
-rw-rw-r-- 1 user user  1392 Aug 16 17:40 README.md
drwxrwxr-x 6 user user  4096 Aug 16 17:40 seq
drwxrwxr-x 3 user user  4096 Aug 16 17:40 speaker-test
-rw-rw-r-- 1 user user   187 Aug 16 17:40 TODO
drwxrwxr-x 3 user user  4096 Aug 16 17:40 topology
drwxrwxr-x 2 user user  4096 Aug 16 17:40 utils

$aclocal
$gettextize
Copying file ABOUT-NLS
Copying file config.rpath
Copying file po/Makefile.in.in
Copying file po/Makevars.template
Copying file po/Rules-quot
Copying file po/boldquot.sed
Copying file po/en@boldquot.header
Copying file po/en@quot.header
Copying file po/insert-header.sin
Copying file po/quot.sed
Copying file po/remove-potcdate.sin
Creating po/ChangeLog
Copying file m4/gettext.m4
Copying file m4/host-cpu-c-abi.m4
Copying file m4/iconv.m4
Copying file m4/intlmacosx.m4
Copying file m4/lib-ld.m4
Copying file m4/lib-link.m4
Copying file m4/lib-prefix.m4
Copying file m4/nls.m4
Copying file m4/po.m4
Copying file m4/progtest.m4
Updating EXTRA_DIST in m4/Makefile.am (backup is in m4/Makefile.am~)
Updating configure.ac (backup is in configure.ac~)
Adding an entry to ChangeLog (backup is in ChangeLog~)

Please run 'aclocal -I m4' to regenerate the aclocal.m4 file.
You need aclocal from GNU automake 1.9 (or newer) to do this.
Then run 'autoconf' to regenerate the configure file.

You will also need config.guess and config.sub, which you can get from the CVS
of the 'config' project at https://savannah.gnu.org/. The commands to fetch them
are
$ wget 'https://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess'
$ wget 'https://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.sub'

You might also want to copy the convenience header file gettext.h
from the /usr/share/gettext directory into your package.
It is a wrapper around <libintl.h> that implements the configure --disable-nls
option.

Press Return to acknowledge the previous three paragraphs.

$autoheader
configure.ac:480: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
./lib/autoconf/status.m4:289: AC_CONFIG_FILES is expanded from...
configure.ac:480: the top level
autom4te: error: /usr/bin/m4 failed with exit status: 1
autoheader: error: '/usr/bin/autom4te' failed with exit status: 1

$automake --foreign --copy --add-missing
configure.ac:480: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
./lib/autoconf/status.m4:289: AC_CONFIG_FILES is expanded from...
configure.ac:480: the top level
autom4te: error: /usr/bin/m4 failed with exit status: 1

$aclocal -I m4
configure.ac:480: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
./lib/autoconf/status.m4:289: AC_CONFIG_FILES is expanded from...
configure.ac:480: the top level
autom4te: error: /usr/bin/m4 failed with exit status: 1
aclocal: error: autom4te failed with exit status: 1

./configure
bash: ./configure: No such file or directory

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/230
Repository URL: https://github.com/alsa-project/alsa-utils
