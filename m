Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC3742F68
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 23:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12DA43E7;
	Thu, 29 Jun 2023 23:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12DA43E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688073687;
	bh=Hh22/kvpJj3tvczt2QD8hWbD6WP9clTWrGtEAE/s0x4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o4Ag+vEM0gS1z0drSeqx53tM2JUBu3UlwBWFjMQS7Km8+qM3Vy4abQDzhxCSUeiEt
	 3GFPNQE8ZS16TXzOE6DSkkdFWDvRKolHLtRZmKqUBi1KUSogBVsk0deCZQDPoXOTf1
	 mrysG2MIqR+FRjzFkTJCpPFUOGhlIni6Vqi9IqfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84B3AF80169; Thu, 29 Jun 2023 23:20:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C14EF80212;
	Thu, 29 Jun 2023 23:20:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E998F80246; Thu, 29 Jun 2023 23:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C5EEFF800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 23:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5EEFF800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1688073618816920757-webhooks-bot@alsa-project.org>
References: <1688073618816920757-webhooks-bot@alsa-project.org>
Subject: configure: Add large file support via CFLAGS
Message-Id: <20230629212032.6E998F80246@alsa1.perex.cz>
Date: Thu, 29 Jun 2023 23:20:32 +0200 (CEST)
Message-ID-Hash: GGC6TWDBK2IQHCD3CZALR4GJFNSOMKGT
X-Message-ID-Hash: GGC6TWDBK2IQHCD3CZALR4GJFNSOMKGT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGC6TWDBK2IQHCD3CZALR4GJFNSOMKGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #223 was opened from kendase3:

Currently scanelf (pax-utils) detects missing LFS support in the following files/calls:
__open_2,fstat,mmap,open,scandir,stat,alphasort,lstat /usr/sbin/alsactl fopen /usr/lib/alsa-topology/libalsatplg_module_nhlt.so fopen /usr/bin/alsaucm
fopen /usr/bin/aplaymidi
__open_2,open /usr/bin/alsatplg
fstat,open,__open_2 /usr/bin/axfer
fopen /usr/bin/arecordmidi
fopen,__open_2 /usr/bin/speaker-test
creat,__open_2,lseek /usr/bin/amidi

Note that this may cause problems on systems with a 32-bit kernel, but I've tested playing audio on a more recent 32-bit system with a 64-bit kernel.

Let me know if you'd prefer a different approach! Notably the existing AC_SYS_LARGEFILE in configure.ac was not having any effect in my environment. I'm building on a 64-bit host for a 32-bit target.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/223
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/223.patch
Repository URL: https://github.com/alsa-project/alsa-utils
