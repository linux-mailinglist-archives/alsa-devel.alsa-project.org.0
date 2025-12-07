Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F403CAB344
	for <lists+alsa-devel@lfdr.de>; Sun, 07 Dec 2025 10:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552AB60206;
	Sun,  7 Dec 2025 10:43:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552AB60206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765100636;
	bh=eN9TOv22k0OOCPcAgTqkq38oypYC2NWEUhkZ3WR7dvw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GMrZJJso9dkmtnYyDbZELHqKyNjcc2nrDTis/EU95qxarJgXEM4IgTSYjRGCIp49V
	 bveGoZCyNWmhkhvtpuy87hFRYNeuRL25zLVFfH+rxcojE4Df3I3uCTo+JCBkLLxG7i
	 7mJ5asvryr+fV3hKdaBA9KpZ1VuUq+HKpAd+FVWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A5A3F805D3; Sun,  7 Dec 2025 10:43:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A66F805C4;
	Sun,  7 Dec 2025 10:43:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C4A3F80494; Sun,  7 Dec 2025 10:43:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id EF03BF800FE
	for <alsa-devel@alsa-project.org>; Sun,  7 Dec 2025 10:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF03BF800FE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187ee5a3d22ff200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/654@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/654@alsa-project.org>
Subject: [for alsa-lib 1.2.15] USB-Audio: add support for conf.d
 configurations
Date: Sun,  7 Dec 2025 10:43:17 +0100 (CET)
Message-ID-Hash: E7CNQUQK7WMKPNCKIKYAUM6BLPTZCJPD
X-Message-ID-Hash: E7CNQUQK7WMKPNCKIKYAUM6BLPTZCJPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7CNQUQK7WMKPNCKIKYAUM6BLPTZCJPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #654 was edited from perexg:

It may be useful to add new or override specific hardware configurations until they are merged to the main USB-Audio.conf file.

BugLink: https://github.com/alsa-project/alsa-ucm-conf/issues/609

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/654
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/654.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
