Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542C9C2DB6
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2024 15:05:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0C1F51;
	Sat,  9 Nov 2024 15:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0C1F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731161121;
	bh=O7oBYCnYjlO5y3Gg2zVxsj7SrTcckBTHKNfdM+BcQLc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZYBP+qmcq43k6Dm/aw/7MCdTUZ2tg+Ow8YhR2FcnKwSAYi4j3uisetS/SNs89/O8V
	 m1RVRp+IfilUhlkrVie7fteK4H51o26aQiF4l2jGdjjcedKcbNmZLAKvcS6uBcGaNz
	 HgiQ9ZOQb+e+Aiw0rO3Rh9gaNXnXvFWvEzP/dlhQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 631BFF805AD; Sat,  9 Nov 2024 15:04:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C3CF805AD;
	Sat,  9 Nov 2024 15:04:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26210F8013D; Sat,  9 Nov 2024 15:04:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 631A6F800BD
	for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2024 15:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 631A6F800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731161079684648275-webhooks-bot@alsa-project.org>
References: <1731161079684648275-webhooks-bot@alsa-project.org>
Subject: Odd behavior with Tempotec Serenade PCIe (CM8888)
Message-Id: <20241109140442.26210F8013D@alsa1.perex.cz>
Date: Sat,  9 Nov 2024 15:04:42 +0100 (CET)
Message-ID-Hash: MGTFHQCLJE5JAZ2CV5OHDHUU5KJRKBLQ
X-Message-ID-Hash: MGTFHQCLJE5JAZ2CV5OHDHUU5KJRKBLQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGTFHQCLJE5JAZ2CV5OHDHUU5KJRKBLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #418 was opened from lss4:

This card is powered by CM8888, using `snd-hda-intel` driver, and it does work in Linux, but its behavior is quite odd.

1. Both the RCA connection and 6.35 headphone jack on the card are connected at the moment. Preferably I'd like to be able to switch to use either RCA (to speakers) or headphone, but I can't -- Audio always goes through both outputs, and there's only one analog output from this card.
2. This is the odd behavior I'm talking about -- the card's outputs are muted by default. Playing an audio file will trigger the card to unmute the output after 2-3 seconds followed by an audible click from the relay on the sound card. When the output is active, if no audio is being actively played for at least 10 seconds, the output will be muted again on its own, and this is again followed by an audible click from the relay. Honestly I've never seen an audio card capable of doing something that "intelligent" before.

`alsa-info.sh` output attached here. The sound card in question is `card1` (`hwC1D1`).
[alsa-info-20241109.txt](https://github.com/user-attachments/files/17687665/alsa-info-20241109.txt)

I'm currently using Garuda Linux on this system. Previously I was using Manjaro. Both are Arch-based, and the behaviors are the same.

I'm not sure about the support of this chip (CM8888) in general, as the information I could find online about CM8888 on Linux is limited and mostly outdated (several years ago).

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/418
Repository URL: https://github.com/alsa-project/alsa-lib
