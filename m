Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0B3793942
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 12:01:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D217F1;
	Wed,  6 Sep 2023 12:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D217F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693994501;
	bh=qxQdfGVfvOEslfvsh5Q3H8ANCLKowY4/vJUvQVIr9UE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ma6LRcJWI0mNvG9HLYpFciYAufSGiJESajhrmppDA4P7jgvuLlpl44e9lwjTCiO3w
	 S7dlzCU+/VUpX1Qb7xGSo1MWKaOJmLUpXjwaQUdKlNGQvMWTBU6IifPRLlsYmRCmhS
	 NBWQvQhIYbPgPxNd00K5tPM/GUoUNWnzh/RzMgEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA633F80527; Wed,  6 Sep 2023 12:00:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6865F80494;
	Wed,  6 Sep 2023 12:00:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41571F804F3; Wed,  6 Sep 2023 12:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 07954F80431
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 11:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07954F80431
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693994146787618876-webhooks-bot@alsa-project.org>
References: <1693994146787618876-webhooks-bot@alsa-project.org>
Subject: _dlsym_control_001 undeclared when compiling alsa-lib
Message-Id: <20230906100041.41571F804F3@alsa1.perex.cz>
Date: Wed,  6 Sep 2023 12:00:41 +0200 (CEST)
Message-ID-Hash: NAMC2IPCYJ4UZ7QMDPCC6NR5HX7QTEME
X-Message-ID-Hash: NAMC2IPCYJ4UZ7QMDPCC6NR5HX7QTEME
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAMC2IPCYJ4UZ7QMDPCC6NR5HX7QTEME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #350 was edited from cemkeylan:

Hello, as mentioned I'm getting the above error when compiling alsa-lib `1.2.10`. Full error below.

```
In file included from ../../include/local.h:177,
                 from control_local.h:22,
                 from control.c:188:
control.c: In function 'snd_ctl_open_conf':
../../include/global.h:98:36: warning: implicit declaration of function '__STRING' [-Wimplicit-function-declaratio]
   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
      |                                    ^~~~~~~~
control.c:1541:25: note: in expansion of macro 'SND_DLSYM_VERSION'
 1541 |                         SND_DLSYM_VERSION(SND_CONTROL_DLSYM_VERSION), 1);
      |                         ^~~~~~~~~~~~~~~~~
../../include/control.h:43:41: error: '_dlsym_control_001' undeclared (first use in this function)
   43 | #define SND_CONTROL_DLSYM_VERSION       _dlsym_control_001
      |                                         ^~~~~~~~~~~~~~~~~~
../../include/global.h:98:45: note: in definition of macro 'SND_DLSYM_VERSION'
   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
      |                                             ^~~~~~~
control.c:1541:43: note: in expansion of macro 'SND_CONTROL_DLSYM_VERSION'
 1541 |                         SND_DLSYM_VERSION(SND_CONTROL_DLSYM_VERSION), 1);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
../../include/control.h:43:41: note: each undeclared identifier is reported only once for each function it appears in
   43 | #define SND_CONTROL_DLSYM_VERSION       _dlsym_control_001
      |                                         ^~~~~~~~~~~~~~~~~~
../../include/global.h:98:45: note: in definition of macro 'SND_DLSYM_VERSION'
   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
      |                                             ^~~~~~~
control.c:1541:43: note: in expansion of macro 'SND_CONTROL_DLSYM_VERSION'
 1541 |                         SND_DLSYM_VERSION(SND_CONTROL_DLSYM_VERSION), 1);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
make: *** [Makefile:415: control.lo] Error 1
```

I have tried to understand the reason this occurs. This doesn't happen when compiling version `1.2.9`, yet I also can't understand how and where the declaration is for that version.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/350
Repository URL: https://github.com/alsa-project/alsa-lib
