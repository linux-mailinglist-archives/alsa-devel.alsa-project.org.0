Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DE3F33FF
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 20:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 920191678;
	Fri, 20 Aug 2021 20:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 920191678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629484898;
	bh=mhNg/uKLPouMcVdgXuvVkmH3+/DVabdWhxyPUdB2ubI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBu/dwlEFTSx7R0o+HqI42GDceVXCDstbIt/p8jKLAZzSDIF3YPggwnlyVoe0P+PD
	 JowPjfEwO4dvGLHXUc7igJ2IhzZA8wiAvjEY/+KGqMFdnUiY3p+K/6lR1Bg9kQfJLm
	 I0JayEt1KYHPQC819hbrTM2Nhgv0RbUetLZEke0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7FD5F80259;
	Fri, 20 Aug 2021 20:40:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A9AF80249; Fri, 20 Aug 2021 20:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B956AF800CC
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 20:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B956AF800CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1629484806165328979-webhooks-bot@alsa-project.org>
References: <1629484806165328979-webhooks-bot@alsa-project.org>
Subject: (.text+0x0): multiple definition of `__packed';
 .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
Message-Id: <20210820184020.02A9AF80249@alsa1.perex.cz>
Date: Fri, 20 Aug 2021 20:40:20 +0200 (CEST)
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

alsa-project/alsa-lib issue #171 was opened from shoober420:

Trying to compile alsa-lib from the latest two commits as of Aug 20th (https://github.com/alsa-project/alsa-lib/commit/868ecd509deb05938107faf66577c69e1702d6f3) (https://github.com/alsa-project/alsa-lib/commit/95eb312fade1908a2c944e9de4626c0ff60b2203), I get this error during build. Im using Gentoo Linux with GCC 11.2 version.

[buildalsalib.log](https://github.com/alsa-project/alsa-lib/files/7023522/buildalsalib.log)

```
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../x86_64-pc-linux-gnu/bin/ld: parser.o (symbol from plugin): in function `uc_mgr_config_load_file':
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../x86_64-pc-linux-gnu/bin/ld: ucm_cond.o (symbol from plugin): in function `uc_mgr_evaluate_condition':
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../x86_64-pc-linux-gnu/bin/ld: ucm_subs.o (symbol from plugin): in function `uc_mgr_get_substituted_value':
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../x86_64-pc-linux-gnu/bin/ld: ucm_include.o (symbol from plugin): in function `uc_mgr_config_tree_merge':
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../x86_64-pc-linux-gnu/bin/ld: ucm_regex.o (symbol from plugin): in function `uc_mgr_define_regex':
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../x86_64-pc-linux-gnu/bin/ld: ucm_exec.o (symbol from plugin): in function `uc_mgr_exec':
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../x86_64-pc-linux-gnu/bin/ld: main.o (symbol from plugin): in function `snd_use_case_identifier':
(.text+0x0): multiple definition of `__packed'; .libs/conf.o (symbol from plugin):(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:495: libasound.la] Error 1
make[2]: Leaving directory '/var/tmp/portage/media-libs/alsa-lib-9999/work/alsa-lib-9999-abi_x86_32.x86/src'
make[1]: *** [Makefile:555: all-recursive] Error 1
make[1]: Leaving directory '/var/tmp/portage/media-libs/alsa-lib-9999/work/alsa-lib-9999-abi_x86_32.x86/src'
make: *** [Makefile:407: all-recursive] Error 1
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/171
Repository URL: https://github.com/alsa-project/alsa-lib
