Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FE9D8D0A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2024 20:52:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1555F85D;
	Mon, 25 Nov 2024 20:52:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1555F85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732564348;
	bh=MiIC0WWRQ3F+0De9lTCKuxPgPHnaXWxxcFRaA4uThBY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cJorXLcfwJioaepdgDPnqgYU9EJRETasUN1/FlujnBj6b/rlLyqIOzYArqYzLTVnK
	 n1ZWviSaaZKVzdjX844EdFwFXPWLi80oaU1rsMRJSSrZt0pZcUm2+z1t3WEuCT7qwi
	 Fp/jxSe0/MFNAIDCZASYFOGYr29WHfxx1tnp1QCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 301C8F805BD; Mon, 25 Nov 2024 20:51:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93C95F805C0;
	Mon, 25 Nov 2024 20:51:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F84AF80496; Mon, 25 Nov 2024 20:51:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E4C5F8019B
	for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2024 20:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E4C5F8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732564309704993010-webhooks-bot@alsa-project.org>
References: <1732564309704993010-webhooks-bot@alsa-project.org>
Subject: GoXLR not working in 1.2.13
Message-Id: <20241125195152.2F84AF80496@alsa1.perex.cz>
Date: Mon, 25 Nov 2024 20:51:52 +0100 (CET)
Message-ID-Hash: BNR6JD44E3WHI6OH4T47FUHVMI3BDXXY
X-Message-ID-Hash: BNR6JD44E3WHI6OH4T47FUHVMI3BDXXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNR6JD44E3WHI6OH4T47FUHVMI3BDXXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #473 was opened from AruAki:

GoXLR not splitting into multiple channels.

`alsaucm -c hw:1 dump text` returns 

```
ALSA lib parser.c:270:(parse_syntax_field) Incompatible syntax 7 in USB-Audio.conf
ALSA lib main.c:1554:(snd_use_case_mgr_open) error: failed to import hw:1 use case configuration -22
alsaucm: error failed to open sound card hw:1: Invalid argument
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/473
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
