Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36329C0562
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 13:10:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8042BDEE;
	Thu,  7 Nov 2024 13:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8042BDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730981432;
	bh=aBBTmbdG9cxUZWz57CPZY1U0vdBGGz8EIap9msps0XU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ahiIacLhJ0uK3hn5ktFOlUfyAMvRFwad/fH7xX3Q/0liceuLfKxFAdJAKtEz2cbH7
	 J0DKayQJPEeiNFO0tkIZPWVSOKbs1DZLDjkeqWLRO7zDwSRD+6ax69Gd0/MU7Vg9PU
	 y85IqX2CEzKncPuxyd8GweARPDy5pyh7UeJ6DZEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18BEBF805B3; Thu,  7 Nov 2024 13:10:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 850DEF805B1;
	Thu,  7 Nov 2024 13:10:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7483FF8013D; Thu,  7 Nov 2024 13:09:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D51F800C8
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 13:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7D51F800C8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1730981394094357252-webhooks-bot@alsa-project.org>
References: <1730981394094357252-webhooks-bot@alsa-project.org>
Subject: topology: Fix strcat() to uninitialized memory in add_define()
Message-Id: <20241107120956.7483FF8013D@alsa1.perex.cz>
Date: Thu,  7 Nov 2024 13:09:56 +0100 (CET)
Message-ID-Hash: GZXWGQY74L54LSEPHMET6HAEPYJ566XO
X-Message-ID-Hash: GZXWGQY74L54LSEPHMET6HAEPYJ566XO
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZXWGQY74L54LSEPHMET6HAEPYJ566XO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #277 was opened from rfvirgil:

If *defs == NULL the realloc() will be a simple malloc() and return a pointer to uninitialized memory. Doing a strcat() to this is bad, so in that case strcpy() the string into the newly allocated buffer.

This fixes the buffer overflow bug, such as:

*** buffer overflow detected ***: terminated
Program received signal SIGABRT, Aborted.
__pthread_kill_implementation (no_tid=0, signo=6, threadid=<optimized out>) at ./nptl/pthread_kill.c:44
warning: 44     ./nptl/pthread_kill.c: No such file or directory
(gdb) bt
    at ../sysdeps/posix/libc_fatal.c:132
    at ./debug/fortify_fail.c:24
    dest=dest@entry=0x5555555682c0 "hUUU\005PLATFORM=mtl,PREPROCESS_PLUGINS=nhlt,NHLT_BIN=nhlt-sof-mtl-sdw-cs42l42-l0-max98363-l2-4ch-48k-96k.bin,NUM_DMICS=4,PDM1_MIC_A_ENABLE=1,PDM1_MIC_B_ENABLE=1,DMIC0_ID=3,DMIC1_ID=4,DMIC1_ENABLE=passth"...,
    src=src@entry=0x7fffffffe0fa "PLATFORM=mtl,PREPROCESS_PLUGINS=nhlt,NHLT_BIN=nhlt-sof-mtl-sdw-cs42l42-l0-max98363-l2-4ch-48k-96k.bin,NUM_DMICS=4,PDM1_MIC_A_ENABLE=1,PDM1_MIC_B_ENABLE=1,DMIC0_ID=3,DMIC1_ID=4,DMIC1_ENABLE=passthrough"..., destlen=<optimized out>) at ./debug/strcat_chk.c:34
    __src=0x7fffffffe0fa "PLATFORM=mtl,PREPROCESS_PLUGINS=nhlt,NHLT_BIN=nhlt-sof-mtl-sdw-cs42l42-l0-max98363-l2-4ch-48k-96k.bin,NUM_DMICS=4,PDM1_MIC_A_ENABLE=1,PDM1_MIC_B_ENABLE=1,DMIC0_ID=3,DMIC1_ID=4,DMIC1_ENABLE=passthrough"...,
    __dest=<optimized out>) at /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130
    d=0x7fffffffe0fa "PLATFORM=mtl,PREPROCESS_PLUGINS=nhlt,NHLT_BIN=nhlt-sof-mtl-sdw-cs42l42-l0-max98363-l2-4ch-48k-96k.bin,NUM_DMICS=4,PDM1_MIC_A_ENABLE=1,PDM1_MIC_B_ENABLE=1,DMIC0_ID=3,DMIC1_ID=4,DMIC1_ENABLE=passthrough"...,
    defs=<synthetic pointer>) at topology.c:400

Request URL   : https://github.com/alsa-project/alsa-utils/pull/277
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/277.patch
Repository URL: https://github.com/alsa-project/alsa-utils
