Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BF703306
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 18:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7314282A;
	Mon, 15 May 2023 18:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7314282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684168349;
	bh=FigWM7qTafS0jo3B7gAp+bngpr6xZE2zFdtA53dQiaI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K52al83YctSV3ULi3QgzcA7mPIFYEp2CXlevwVehyATM22ey1dVEsqWH8/VFmzX7H
	 3X0n2e0xXr7Uwv+1WoEeztIC4igaXudiYBm02J5dJ4q5vRDVHNKIqG5Da/TljaJ27f
	 Zeb3jaSti0gn7vA44Ay0lD8gartZSvq3AICwFs/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 536D1F8055A; Mon, 15 May 2023 18:31:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E760AF8053D;
	Mon, 15 May 2023 18:31:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51DF5F80272; Mon, 15 May 2023 18:31:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 81429F8053D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 18:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81429F8053D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684168273981478691-webhooks-bot@alsa-project.org>
References: <1684168273981478691-webhooks-bot@alsa-project.org>
Subject: alsactl: fix compilation when building in a subdir
Message-Id: <20230515163116.51DF5F80272@alsa1.perex.cz>
Date: Mon, 15 May 2023 18:31:16 +0200 (CEST)
Message-ID-Hash: 3C3FJQDOFLAVCPI5YLE4YGPQB3VB32PL
X-Message-ID-Hash: 3C3FJQDOFLAVCPI5YLE4YGPQB3VB32PL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3C3FJQDOFLAVCPI5YLE4YGPQB3VB32PL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #213 was opened from heitbaum:

Fixes: 613372d
Fixes: cff2d1c
Fixes: #212

Compile errors when building in a subdir:
```
alsactl/alsactl.c:33:10: fatal error: os_compat.h: No such file or directory
   33 | #include "os_compat.h"
      |          ^~~~~~~~~~~~~
alsactl/lock.c:34:10: fatal error: os_compat.h: No such file or directory
   34 | #include "os_compat.h"
      |          ^~~~~~~~~~~~~
```

Request URL   : https://github.com/alsa-project/alsa-utils/pull/213
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/213.patch
Repository URL: https://github.com/alsa-project/alsa-utils
