Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543AA791883
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 15:37:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD8B825;
	Mon,  4 Sep 2023 15:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD8B825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693834635;
	bh=fIF88ECmG+YkLUEPnUSf4nEHe5VOK/VXmb7g7Q2TSsg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YX5N6bWP2t9ivMnkV8dKXr6tFw8VKsG30GDPgqI+GY1tmC8KwUENb1x5k/x59OdKT
	 kH8S+WUkkTIIebsbAwdftBskmzIGHgkcKn+uyVn+AsDnwRSreqNZjYh1YXbZflDGnZ
	 qr3lDprE4JkDs+Qalu1u/Lkhy3GQ/dlnlalY1Yfc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CB5EF80551; Mon,  4 Sep 2023 15:36:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E42C9F800AA;
	Mon,  4 Sep 2023 15:36:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27FA2F8047D; Mon,  4 Sep 2023 15:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE82F800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 15:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DE82F800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693834577165603399-webhooks-bot@alsa-project.org>
References: <1693834577165603399-webhooks-bot@alsa-project.org>
Subject: alsa-utils 1.2.10 fails to build with old gcc
Message-Id: <20230904133620.27FA2F8047D@alsa1.perex.cz>
Date: Mon,  4 Sep 2023 15:36:20 +0200 (CEST)
Message-ID-Hash: REFKL4NEEZRR5BTCAVNEBL5UERV52VFU
X-Message-ID-Hash: REFKL4NEEZRR5BTCAVNEBL5UERV52VFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REFKL4NEEZRR5BTCAVNEBL5UERV52VFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #233 was opened from tiwai:

The recent change for fixes builds on the latest gcc broke the builds on the older gcc version instead.
The truncated parameters can't be handled well by the older gcc.

I guess we should rather add the option to ignore the unused parameters instead of truncating unused parameters. Not all compilers support those new syntax.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/233
Repository URL: https://github.com/alsa-project/alsa-utils
