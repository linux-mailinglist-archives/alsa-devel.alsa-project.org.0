Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF51A3F73B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2025 15:28:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DBAD60557;
	Fri, 21 Feb 2025 15:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DBAD60557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740148116;
	bh=IpGEehfeHDTP8+UlApJ1wZpAlncmr+yKfkZLBY0swNc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WCrdQvZ6KTWq0xBKGN2eG9YCS+wANMde+N0m7uggFHsPLlSy5BKvDC0xpeClvAEve
	 CsXGawYwjnUG/SR+W25mXFzGBuDb4plB7vy8QFh8JM5SPMPYHIZ3gry44MxMcQGNUQ
	 NCz8hTx/oVm7M6sKwrzE0U+T88tXHBDbsxPcOO/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C9A1F80544; Fri, 21 Feb 2025 15:28:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D0EF8055B;
	Fri, 21 Feb 2025 15:28:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B9FDF80424; Fri, 21 Feb 2025 15:27:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id F079EF800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2025 15:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F079EF800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740148065642512083-webhooks-bot@alsa-project.org>
References: <1740148065642512083-webhooks-bot@alsa-project.org>
Subject: FiiO K7 USB DAC no Inputs
Message-Id: <20250221142749.4B9FDF80424@alsa1.perex.cz>
Date: Fri, 21 Feb 2025 15:27:48 +0100 (CET)
Message-ID-Hash: BXKEBGKEKLCDSVIUZIWJGNWYANY2CXVF
X-Message-ID-Hash: BXKEBGKEKLCDSVIUZIWJGNWYANY2CXVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXKEBGKEKLCDSVIUZIWJGNWYANY2CXVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #439 was opened from Starfoxfs:

I have problems with Fiio K7 USB DAC in Linux Mint Cinnamon 22.1 (6.8.0-56-generic)

Alsa Version: 1.0.25+dfsg-0ubuntu7
Pipewire: 1.0.5-1ubuntu2
Wireplumber: 0.4.17-1ubuntu4

The USB Dac has this Ports:
2x Line IN (Cinch)
2x Line OUT or Pre OUT(Cinch)
1x Digital IN TOSLINK
1x COAX/RCA IN (Yellow Cinch)

The Problem is:
Alsa didnt find any of this IN Ports. 

There are 4 OUTPUTS:
Analog Stereo works fine with Alsa
Digital IEC958 (thats wrong Device has no Digital Output)
Digital Surround 51 (thats wrong Device has no Digital Output)
Pro Audio works fine with Alsa

Would be nice to have the Inputs.

Heres my Alsa-Info Output:

[alsa-info.txt](https://github.com/user-attachments/files/18907991/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/439
Repository URL: https://github.com/alsa-project/alsa-lib
