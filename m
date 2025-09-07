Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B12E6B4798A
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Sep 2025 10:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64FF6021E;
	Sun,  7 Sep 2025 10:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64FF6021E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757232868;
	bh=EewS0t0cXAdwfqPN4Vb3JbXX5bcFHv2X6muRw9Q3234=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sibuGHA7teXorNYw4ExMPGpi1DaBepUESFAxqVYZG2/R8I+XLh+umVK/U5LkO2blJ
	 yhujWAuMm3TE11Cx0sut5EMuxqPP2rxgyhI97KvE/29n0cFI77FTbmZC22tkH3jzfi
	 Ppymv6yO3mo3+GuQTbzRLOCmdzPW3s02i8cLemjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 848C9F805D7; Sun,  7 Sep 2025 10:14:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC47FF805E2;
	Sun,  7 Sep 2025 10:14:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A6A7F805BE; Sun,  7 Sep 2025 10:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE5AF805B5
	for <alsa-devel@alsa-project.org>; Sun,  7 Sep 2025 10:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE5AF805B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1862f1f47bd44500-webhooks-bot@alsa-project.org>
In-Reply-To: <1862f1f47b73f600-webhooks-bot@alsa-project.org>
References: <1862f1f47b73f600-webhooks-bot@alsa-project.org>
Subject: Mic from audio jack not work on Dell Precision M4800. Please add mic
 drivers
Date: Sun,  7 Sep 2025 10:13:59 +0200 (CEST)
Message-ID-Hash: HVVGH6QHEOUBP6MLYII7FWVSS3RTRME3
X-Message-ID-Hash: HVVGH6QHEOUBP6MLYII7FWVSS3RTRME3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVVGH6QHEOUBP6MLYII7FWVSS3RTRME3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #476 was edited from Slavomir9:

Hello,
on my Dell Precision M4800 not work mic on headset Koss CS100 audio jack (non USB) version.
Please add mic drivers.

[Dell Precision M4800 ](https://www.google.com/search?q=%0D%0ADell+Precision+M4800%0D%0A&sca_esv=e618e5e4341fb9f4&)

[Headset Koss CS100](https://www.kaufland.sk/product/5373091/)

I use dual boot. On Windows 11 work mic only after install drivers from Dell website.

More information about bug here
https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2122269

Please add mic drivers.
Thanks

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/476
Repository URL: https://github.com/alsa-project/alsa-lib
