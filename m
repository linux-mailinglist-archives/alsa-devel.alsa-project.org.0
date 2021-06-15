Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96033A8AC4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 23:11:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2155641;
	Tue, 15 Jun 2021 23:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2155641
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623791483;
	bh=17iKdOwlrmwGKNLVpFfyYVO97sviq/JhBBJvumSvKF8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3v7HUKa1jkLREPZINp0FLwLCzSoxGrINlu2RDbNn5HiZiXH1QAhMfLd5OCU7i0ul
	 cBtGC657oI1XY3RZAEnX+i0tZEoznMGkFUAUaxItv0tWPpanYQnVLDGB1RkI8b3VcD
	 k5J7+6SZcOfWN876/kePIiNhABg0i0X4wyW12Zjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 876C6F8025A;
	Tue, 15 Jun 2021 23:09:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B39F80171; Tue, 15 Jun 2021 23:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B5282F80165
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 23:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5282F80165
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623791385115118027-webhooks-bot@alsa-project.org>
References: <1623791385115118027-webhooks-bot@alsa-project.org>
Subject: Build failes with "undefined macro AM_GNU_GETTEXT"
Message-Id: <20210615210953.C3B39F80171@alsa1.perex.cz>
Date: Tue, 15 Jun 2021 23:09:53 +0200 (CEST)
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

alsa-project/alsa-utils issue #99 was opened from edward-a:

**./gitcompile** fails with the following output:

configure.ac:10: warning: macro 'AM_GNU_GETTEXT' not found in library
configure.ac:11: warning: macro 'AM_GNU_GETTEXT_VERSION' not found in library
./gitcompile: line 10: gettextize: command not found
configure.ac:15: installing './compile'
configure.ac:6: installing './install-sh'
configure.ac:6: installing './missing'
alsactl/Makefile.am: installing './depcomp'
axfer/test/Makefile.am:9: warning: source file '../container.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
automake: warning: possible forward-incompatibility.
automake: At least a source file is in a subdirectory, but the 'subdir-objects'
automake: automake option hasn't been enabled.  For now, the corresponding output
automake: object file(s) will be placed in the top-level directory.  However,
automake: this behaviour will change in future Automake versions: they will
automake: unconditionally cause object files to be placed in the same subdirectory
automake: of the corresponding sources.
automake: You are advised to start using 'subdir-objects' option throughout your
automake: project, to avoid future incompatibilities.
axfer/test/Makefile.am:9: warning: source file '../container-riff-wave.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:9: warning: source file '../container-au.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:9: warning: source file '../container-voc.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:9: warning: source file '../container-raw.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-riff-wave.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-au.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-voc.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-raw.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../mapper.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../mapper-single.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../mapper-multiple.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
parallel-tests: installing './test-driver'
**configure.ac:10: error: possibly undefined macro: AM_GNU_GETTEXT
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:11: error: possibly undefined macro: AM_GNU_GETTEXT_VERSION**
CFLAGS=-O2 -Wall -pipe -g
./configure 
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether to enable maintainer-specific portions of Makefiles... yes
./configure: line 2937: syntax error near unexpected token `external'
./configure: line 2937: `AM_GNU_GETTEXT(external)'


### System info:
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.2 LTS"
NAME="Ubuntu"
VERSION="20.04.2 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.2 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/99
Repository URL: https://github.com/alsa-project/alsa-utils
