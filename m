Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A81618359C7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 04:35:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84EA9826;
	Mon, 22 Jan 2024 04:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84EA9826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705894533;
	bh=0DgqUg8rG2twbyg/xpN+S0vxtwOigjOykaPWvTIXJvA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pQA8HOcHf9r6tqzhyo6lHM64Nq/EEDgH0ONlh+rVOJO3NSceeSde+b/1ZtitQjzHd
	 kWdeHgOnVD4jcwY1EVVPw5hYfGbeo3FjJ+FMyGJR8OaiSJ0G1MAiPGgLDW2Zaab+Fo
	 o5vzK8efies2jhuDiKk7PZzIbFeBzTXCjaVT0j0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ABC5F8057E; Mon, 22 Jan 2024 04:35:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD29F8057B;
	Mon, 22 Jan 2024 04:35:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB202F8025F; Mon, 22 Jan 2024 04:34:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 80703F8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 04:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80703F8020D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705894488547621489-webhooks-bot@alsa-project.org>
References: <1705894488547621489-webhooks-bot@alsa-project.org>
Subject: Allow for an optional output in plugin multi
Message-Id: <20240122033455.DB202F8025F@alsa1.perex.cz>
Date: Mon, 22 Jan 2024 04:34:55 +0100 (CET)
Message-ID-Hash: MOFQ455QGBIEJRMIPWGN3OLVWZ44U3R6
X-Message-ID-Hash: MOFQ455QGBIEJRMIPWGN3OLVWZ44U3R6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOFQ455QGBIEJRMIPWGN3OLVWZ44U3R6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #379 was opened from wonbinbk:

Let's say I have 2 sound cards, card 0 and card 1. Card 1 is unplug-able from the system so it might not exist when applications read asound.conf.

I think it makes sense to add ability to specify an optional pcm device which if it doesn't exist won't break alsa.

```
ALSA lib ../../alsa-lib-1.2.6.1/src/confmisc.c:165:(snd_config_get_card) Cannot get card index for 1
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/379
Repository URL: https://github.com/alsa-project/alsa-lib
