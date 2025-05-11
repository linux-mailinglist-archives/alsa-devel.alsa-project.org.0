Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD01AB7F79
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:00:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582A261AC9;
	Thu, 15 May 2025 09:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582A261AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294139;
	bh=rn234ZM7sXQ05Sa+4BN7aL0VKP6jVOT0x5iNJqH84xg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gret/GssTPQfxx+zorBzNWByHxVQhp/aL/ZNaROGWKNxBQBO3ofR+UE4drwZZhRLR
	 8rm0rpTdG46UR1gYcy42NX8xyAOxKOIQAH1gVG00DDo9Nl27NouCXOZmiAa5Bym0j/
	 SRyB0Tg4A7Kepp0u4B+mmrPey5L92NEO07EAb+9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B375F80722; Sun, 11 May 2025 11:19:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 022C9F8071D;
	Sun, 11 May 2025 11:19:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C572F80683; Sun, 11 May 2025 11:19:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B4386F8067E
	for <alsa-devel@alsa-project.org>; Sun, 11 May 2025 11:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4386F8067E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183e6e7c5cd98000-webhooks-bot@alsa-project.org>
In-Reply-To: <183e6e7c5cd01500-webhooks-bot@alsa-project.org>
References: <183e6e7c5cd01500-webhooks-bot@alsa-project.org>
Subject: ALSA UCM error for Scarlett 18i20 Gen2 with new profile introduced in
 1.2.14
Date: Sun, 11 May 2025 11:19:48 +0200 (CEST)
Message-ID-Hash: UDPC74PSRA6KZULXUVNJNRH27MY5VOOO
X-Message-ID-Hash: UDPC74PSRA6KZULXUVNJNRH27MY5VOOO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDPC74PSRA6KZULXUVNJNRH27MY5VOOO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #559 was opened from chw90:

I run the Focusrite 18i20 Gen2 on Arch Linux and the recent update of alsa-ucm-conf from 1.2.13-2 to 1.2.14-2 broke the audio output of my device.

`May 11 10:33:55 chw90 wireplumber[1636]: spa.alsa: Error in ALSA UCM profile for _ucm0009.hw:USB,0 (HiFi: Direct 2: source): CaptureChannels=20 > avail 18`

Reverting to 1.2.13-2 fixes the problem.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/559
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
