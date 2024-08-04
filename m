Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F70946E48
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2024 12:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F304808;
	Sun,  4 Aug 2024 12:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F304808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722766761;
	bh=ElTlecJXXQHK56wGU2TGI/w8tbziqsQsSQGNqElG8kc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ld0Y4MyUk5SEAKUHSRcVBIX77U1guxSnHyXq6QNnu8zaGedN1ZTHJgnDXD/S1PWM2
	 2EBbjWyPi3EgrYlDjBCff8dH8GBackwGpeQO2QYjmkCsxHMuRcgOUekFbhT6N6nZ9K
	 fDHgauYF9kQJQWWyjLl1FJmANH3ci6woyxf2vPbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 853E8F80589; Sun,  4 Aug 2024 12:19:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 173F3F805AD;
	Sun,  4 Aug 2024 12:19:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F31ABF802DB; Sun,  4 Aug 2024 12:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B05F800B0
	for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2024 12:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B05F800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1722766512276105642-webhooks-bot@alsa-project.org>
References: <1722766512276105642-webhooks-bot@alsa-project.org>
Subject: a52 plugin Unknown field card error
Message-Id: <20240804101518.F31ABF802DB@alsa1.perex.cz>
Date: Sun,  4 Aug 2024 12:15:18 +0200 (CEST)
Message-ID-Hash: ZRZEGGHZ4SHXQECXCCJAMJR4HGU4TFA6
X-Message-ID-Hash: ZRZEGGHZ4SHXQECXCCJAMJR4HGU4TFA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRZEGGHZ4SHXQECXCCJAMJR4HGU4TFA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #405 was opened from DocMAX:

```
a52:CARD=Adapter
    USB SPDIF Adapter
    Plugin to convert multichannel stream to A52 (AC3) bitstream

[root@desktop ~]# speaker-test -c6 -Da52

speaker-test 1.2.12

Playback device is a52
Stream parameters are 48000Hz, S16_LE, 6 channels
Using 16 octaves of pink noise
ALSA lib pcm_rate.c:1701:(_snd_pcm_rate_open) Unknown field card
Playback open error: -22,Invalid argument
```
how to fix this error?
running arch linux all updated

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/405
Repository URL: https://github.com/alsa-project/alsa-lib
