Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1106FD303
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 01:22:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D3BA1DA;
	Wed, 10 May 2023 01:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D3BA1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683674533;
	bh=I5j2kiKHXwXQWTV5Rfge8CmV39i1KUvdecxyZrYIdqU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rsFvnJbK5kwweMCRdAY5cgQJl4mvS7woCG4bFPl2h0QTQxDZYqsvxb+V9iHziZ3/8
	 E75q1qf1r18A/Kit05HG2CSCIHsfiCvJM/ZuGJD9lfJsu0Oh3oMzhlCwyQLsiSrBWU
	 kq13bm6QIjZ89L6j8pUL2zOdjNmcQqwQ9mhaJt5Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA16DF80087;
	Wed, 10 May 2023 01:21:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BADCF8032D; Wed, 10 May 2023 01:21:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CBFCF80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 01:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBFCF80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683674463364523172-webhooks-bot@alsa-project.org>
References: <1683674463364523172-webhooks-bot@alsa-project.org>
Subject: Broadwell rt286 volume too low
Message-Id: <20230509232110.4BADCF8032D@alsa1.perex.cz>
Date: Wed, 10 May 2023 01:21:10 +0200 (CEST)
Message-ID-Hash: 3PYVMKLMRUXP4VOICV6LXOUBV57ZOKCD
X-Message-ID-Hash: 3PYVMKLMRUXP4VOICV6LXOUBV57ZOKCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PYVMKLMRUXP4VOICV6LXOUBV57ZOKCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #312 was opened from benfuddled:

- Distribution and distribution version: Pop!_OS 22.04 LTS (I've also experienced this issue on multiple versions of Fedora and Ubuntu.
- Desktop Environment: Gnome 42
- Kernel version (uname -r): 6.2.6-76060206-generic
- PipeWire version: 0.3.70

## Description of Problem:

My laptop (an HP Spectre X360 13-4002dx) speakers and headphone jack output audio at extremely low levels, to the point where initially I thought they weren't outputting audio at all. It was only when I allowed over-amplification in gnome-tweaks and holding my ear up to the speaker that I realized there was sound coming out.

However, when I plug in a pair of USB headphones (not via the headphone jack) sound levels are within expected range. Same thing if I output sound via HDMI to a television.

results of running alsa-info: http://alsa-project.org/db/?f=76b61d75f256f85bfcef41f7ae704fffb146cf06

Note: Myself and a few others had this problem and initially filed bugs independently with pipewire, but [a commenter](https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2822#note_1701628) seemed to think it may be a problem with the UCM file for this device.

Hoping someone here can shed some light on the issue. Thank you!

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/312
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
