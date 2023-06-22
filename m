Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67B73AB81
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 23:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34661836;
	Thu, 22 Jun 2023 23:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34661836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687468942;
	bh=sEM0Wc5aLpl4l41lSaU4jIt2GTxbmI1ZswuP+UKd6W8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EczT/cqL/HgsSsLCMrFr5QZgTg9YWPSodSbZQn56llHtzd+kDasfdYPNN7VsLVN0t
	 r0Vu28El+PG4W5fmxMixGtIe2UuYLxnTMjvSi40AyW94iGEIY843Xjb1xIC0nsMJWg
	 3dwntiM8bhL/dY8XXUEYVPCayAUoq9Tuy2TKm8nM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E3B4F80130; Thu, 22 Jun 2023 23:21:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7613F80132;
	Thu, 22 Jun 2023 23:21:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26B12F80141; Thu, 22 Jun 2023 23:21:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A63FFF80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 23:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A63FFF80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687468876067026138-webhooks-bot@alsa-project.org>
References: <1687468876067026138-webhooks-bot@alsa-project.org>
Subject: Intel/sof-essx8336: Fix HiFi.conf
Message-Id: <20230622212122.26B12F80141@alsa1.perex.cz>
Date: Thu, 22 Jun 2023 23:21:22 +0200 (CEST)
Message-ID-Hash: HVC4YYATCN5UOAPDUQX7GMLIALKAE5YO
X-Message-ID-Hash: HVC4YYATCN5UOAPDUQX7GMLIALKAE5YO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVC4YYATCN5UOAPDUQX7GMLIALKAE5YO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #328 was opened from xry111:

1. Enable Left/Right Headphone Mixer Left/Right DAC Switch in BootSequence.  Despite they seem enabled in sof-essx8336.conf, if I don't add this I'll need to enable them with alsamixer.  I guess they are killed by disdevall.
2. Switch Headphone on/off in Headphones enable/disable sequence.  This should be obvious.
3. "Headset Switch" is not recognized and triggers errors running "alsaucm -c hw:0 set _verb Hifi".  Change it to "Headset Mic Switch". And in the disable sequence we should turn it off, not on.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/328
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/328.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
