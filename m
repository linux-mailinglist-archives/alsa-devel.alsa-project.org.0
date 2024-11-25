Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E29D850A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2024 13:06:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64AD7F4;
	Mon, 25 Nov 2024 13:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64AD7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732536391;
	bh=AaWzNmPanX5YKolifrNLLKttu50LroQ154hrgtAyd3g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VBZnqQE5icVNOeeXMbio/nUbUnxotDebMqrgKErVdb21VaiLsE1N4DOsJ3iWYfyUs
	 cMZd+ljumpSsKcz8dAgYZ5cZLqUWdMKzrzgE6jfYW7Rtgnmu6MwsvS0PD0pdCaehuo
	 t83EqV7GT4RbRYbYawYzKlqPIk5iUqlCi2VKqu2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2709BF805B1; Mon, 25 Nov 2024 13:06:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE94CF805AD;
	Mon, 25 Nov 2024 13:06:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA62F80496; Mon, 25 Nov 2024 13:05:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 02AD6F80134
	for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2024 13:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02AD6F80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732536349380672693-webhooks-bot@alsa-project.org>
References: <1732536349380672693-webhooks-bot@alsa-project.org>
Subject: 1.2.13 will lead to mute of speakers and headphone jack on MTL laptop
 Lenovo Youga Pro 7 14IMH9
Message-Id: <20241125120556.AFA62F80496@alsa1.perex.cz>
Date: Mon, 25 Nov 2024 13:05:56 +0100 (CET)
Message-ID-Hash: ZRCRDYLEDAJAXYG2B4GB7Y5JFXBRN2GE
X-Message-ID-Hash: ZRCRDYLEDAJAXYG2B4GB7Y5JFXBRN2GE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRCRDYLEDAJAXYG2B4GB7Y5JFXBRN2GE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #472 was edited from phush0:

Changing version from 1.2.12 to 1.2.13 will lead to not working sound during plug/unplug of the head phone jack or mute during reboot on Arch install. Other ppl with similar laptops have reported same problem. On my version codec is ALC287 with bass speaker output. I can unmute speaker or headphones trough alsamixer, but plugin headphone and the unplugin will lead to both mute. Sometimes reboot will lead to same problem and I have to operate channels by hand again. Similar problems:

[https://discuss.cachyos.org/t/sound-problems-kde/4350](https://discuss.cachyos.org/t/sound-problems-kde/4350)

edit: reading more seems like problem is with the new HDMI macro, because other report problems with HDMI output.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/472
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
