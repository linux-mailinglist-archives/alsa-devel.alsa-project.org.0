Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A8955CE0
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Aug 2024 16:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23A5210C;
	Sun, 18 Aug 2024 16:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23A5210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723989963;
	bh=rJ5wcr16i6zszL/h7oSXrSftUfb2GBcq2p70QZwyNx8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HX9ysbBm6JWwG+v+IvLhZBI/IwZcSsazA4m0McdF05/+WTdDn5twSNnaZVaQdoQGU
	 YyO46sJLPN814d5sZ49OZpBDaWu8SV6QopYOcofvo/9JHvtXAwgQjFKSfYvJcLaWRV
	 7W44r+JLs+eclWgv9O8n5yfAXXH/Vn+wk6SCW5PQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC61F805B3; Sun, 18 Aug 2024 16:05:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0600F8025E;
	Sun, 18 Aug 2024 16:05:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6015F80494; Sun, 18 Aug 2024 16:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D5B7F8016E
	for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2024 16:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5B7F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1723989696882387638-webhooks-bot@alsa-project.org>
References: <1723989696882387638-webhooks-bot@alsa-project.org>
Subject: Add persistent ID's for soundcards and midi devices (like coreaudio)
Message-Id: <20240818140141.C6015F80494@alsa1.perex.cz>
Date: Sun, 18 Aug 2024 16:01:41 +0200 (CEST)
Message-ID-Hash: FRYPQPGK2QVALAGBUUOIH3LKIAPZ3RRU
X-Message-ID-Hash: FRYPQPGK2QVALAGBUUOIH3LKIAPZ3RRU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRYPQPGK2QVALAGBUUOIH3LKIAPZ3RRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #407 was opened from sjomae:

"This is something where macOS' Coreaudio/MIDI shines. Unlike macOS 
Linux/ALSA has no persistent unique IDs for soundcards or MIDI devices. 
ALSA supports hotplug, and first come first server sequential numeric 
IDs. The best you^Wpipewire can do is keep track of cards by name.

So this is not something pipewire can reliably address, until ALSA get 
support to identify cards by vendor and serial-number, and provide a UUID."

https://lists.linuxaudio.org/hyperkitty/list/linux-audio-dev@lists.linuxaudio.org/thread/OV63UFHRZ2LQYUDADZCUHC2MRA4JWPCU/

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/407
Repository URL: https://github.com/alsa-project/alsa-lib
