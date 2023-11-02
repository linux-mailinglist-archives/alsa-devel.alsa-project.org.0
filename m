Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947C7DEFB7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 11:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B228829;
	Thu,  2 Nov 2023 11:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B228829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698920459;
	bh=c5A6e384V0dc4DP0+0sDW91fp2XhVmmdBi01YG6i5Ww=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RgHGM+7teNbXmU26h7uVGjlajdhE0D9lwE7OihheLKjT5VdL+/8v1leW3lZVDrP3j
	 YqvIK5cZh9zVpM5IFtxHfMsugi909uGmvHlSnwPZ2bW+5yDmEqA4aZmKovvHwM0yyj
	 /yTPLIu4yRNrrr17F3GX+/kFtRvvgh3LBxsVzTpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05913F8020D; Thu,  2 Nov 2023 11:19:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4105CF8020D;
	Thu,  2 Nov 2023 11:19:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C0F7F80290; Thu,  2 Nov 2023 11:18:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CF21F8014B
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 11:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CF21F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698920304734942913-webhooks-bot@alsa-project.org>
References: <1698920304734942913-webhooks-bot@alsa-project.org>
Subject: hdajackretask info window takes up all screens
Message-Id: <20231102101828.9C0F7F80290@alsa1.perex.cz>
Date: Thu,  2 Nov 2023 11:18:28 +0100 (CET)
Message-ID-Hash: 775LOVKPLET5SBKN3DJV3WSYBJEWV6AO
X-Message-ID-Hash: 775LOVKPLET5SBKN3DJV3WSYBJEWV6AO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/775LOVKPLET5SBKN3DJV3WSYBJEWV6AO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #20 was opened from francisdb:

For a multi-monitor setup you get a very large screen.

The code below should probably be removed

https://github.com/alsa-project/alsa-tools/blob/8c8d6941f21ea68894ce7fd13e92b3ac9f16dc8a/hdajackretask/main-gtk.c#L517-L523

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/20
Repository URL: https://github.com/alsa-project/alsa-tools
