Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8581EA79DF4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Apr 2025 10:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41DD60205;
	Thu,  3 Apr 2025 10:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41DD60205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743668567;
	bh=xtQvsYA1IXHHHO3BYsvy+TSBImXVF2i6pycXorIcwjg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TvNdBW3BRvP4rKGQQ36OYCxX5agU5QzxOiNnMRJXvy6dSNjtQ8IgrHPNj10OxJRZ5
	 wssTfcE0JBaU0PxpQfaaBhdjBH3in7gHIpkVKBBVBGdQcz24/1ziNHjSmNVE9+4+Rs
	 WcaKb57afTcgfNLyENMG8SJkIyqMwIRqbdMf/R4s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB408F805C6; Thu,  3 Apr 2025 10:22:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 992F0F805B2;
	Thu,  3 Apr 2025 10:22:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7008DF800BF; Thu,  3 Apr 2025 10:22:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B822BF800BF
	for <alsa-devel@alsa-project.org>; Thu,  3 Apr 2025 10:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B822BF800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1832c14bd7ed0500-webhooks-bot@alsa-project.org>
In-Reply-To: <1832c14bd7c7d100-webhooks-bot@alsa-project.org>
References: <1832c14bd7c7d100-webhooks-bot@alsa-project.org>
Subject: Alsa lib is not able to find the UCM .conf files
Date: Thu,  3 Apr 2025 10:22:19 +0200 (CEST)
Message-ID-Hash: WQU6SB4QHSU2SXYAH4PH6B4ELUHLU33U
X-Message-ID-Hash: WQU6SB4QHSU2SXYAH4PH6B4ELUHLU33U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQU6SB4QHSU2SXYAH4PH6B4ELUHLU33U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #449 was opened from 3bitbrain:

Note : the sound card is a Xonar DX ( AV200 )
The alsa UCM files are installed at PATH=/usr/share/alsa
When I try to start alsasound, I get this error ==
`
alsa-lib-1.2.11/src/umc/main.c:1554: (snd_use_case_mgr_open) error : failed to import hw:1 use case configuration -2
`
The CMD alsaucm listcards gets this response : list is empty.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/15455180/alsa-info.txt)
[aplay-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/15455183/aplay-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/449
Repository URL: https://github.com/alsa-project/alsa-lib
