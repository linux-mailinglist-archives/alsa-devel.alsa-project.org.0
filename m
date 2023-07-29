Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4876817E
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 21:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9A91F4;
	Sat, 29 Jul 2023 21:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9A91F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690659825;
	bh=qZhttz150FWvMuUpAIOLsD6rs0C/wbnCPcwMZ84s010=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h1On/EOReGeI2SN0u1FAJ1f43lXiaehQZHhgz6qnPKMLoCxjfXEu7XnDdPR5DT/9f
	 SKqsk8a7CZtkGdr4Lcb5hNoJ2wwuCk++boWFIngsmnRLdTG3K65jh3WYPeVq+xpi6x
	 8BZoMbJYX1zlOabtvbN+psPxlmoLPkTzizsB1rko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 620E1F80310; Sat, 29 Jul 2023 21:42:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D79F80163;
	Sat, 29 Jul 2023 21:42:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B555F8019B; Sat, 29 Jul 2023 21:41:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 73ED1F800C7
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 21:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73ED1F800C7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1690659704510955572-webhooks-bot@alsa-project.org>
References: <1690659704510955572-webhooks-bot@alsa-project.org>
Subject: ALC3306 beeing registered as ALC287 on Lenovo Yoga
Message-Id: <20230729194154.5B555F8019B@alsa1.perex.cz>
Date: Sat, 29 Jul 2023 21:41:54 +0200 (CEST)
Message-ID-Hash: LRQJ7TOXCUXIXIGNQFKFNIJSJKK2KEH3
X-Message-ID-Hash: LRQJ7TOXCUXIXIGNQFKFNIJSJKK2KEH3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRQJ7TOXCUXIXIGNQFKFNIJSJKK2KEH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #339 was opened from InfinityRed-Code:

I have a Lenovo Yoga 7 16IAP7 with Fedora Workstation 38 installed.

Kernel Verion: Linux 6.4.6-200.fc38.x86_64
alsa-lib version: alsa-lib-1.2.9-1.fc38.x86_64

I installed alsa-tools and went into hdajackretask to see what is going on. Then I noticed that my System is telling me that I have an ALC287 installed but actually it is a ALC3306. Sound is horrible and several fixes with ALC 287 for Legion Models did nit work. In the Settings I can see as well, that only 2 of the 4 integrated speakers are getting noticed.

Is there any known fix?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/339
Repository URL: https://github.com/alsa-project/alsa-lib
