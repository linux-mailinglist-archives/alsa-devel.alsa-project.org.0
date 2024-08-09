Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3862C94D738
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 21:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F1D0EA3;
	Fri,  9 Aug 2024 21:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F1D0EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723231541;
	bh=V3+CQZgbTgl14ME8n95u0pJ7yNic3HhEf0zOpt431bs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fgxC63UkzyerdJv50z41AbuYYrp7/1KyroUJZp2yJ5JltdssE2JPLbH70sIMjztnA
	 CV15fW+GgenT7ZVLcGaLlOrHhLTaOqkhCrUkmdkf+BAZbXuFxcHLFJX+nX9c79BirH
	 GGbYa3ISK2uiSnnr13DfJLuaM7YyJz24xgWyeqRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE14DF805AF; Fri,  9 Aug 2024 21:25:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E74C9F800BF;
	Fri,  9 Aug 2024 21:25:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42E15F8049C; Fri,  9 Aug 2024 21:22:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 01726F805A1
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 21:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01726F805A1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1723231258971286535-webhooks-bot@alsa-project.org>
References: <1723231258971286535-webhooks-bot@alsa-project.org>
Subject: (Question) Difference between defaults.pcm.srate and
 defaults.pcm.rate
Message-Id: <20240809192202.42E15F8049C@alsa1.perex.cz>
Date: Fri,  9 Aug 2024 21:22:02 +0200 (CEST)
Message-ID-Hash: 6GYDPCUG6SMRDGX2SZXEO4BXO6Q63PA3
X-Message-ID-Hash: 6GYDPCUG6SMRDGX2SZXEO4BXO6Q63PA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GYDPCUG6SMRDGX2SZXEO4BXO6Q63PA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #406 was edited from ViNi-Arco:

What is the difference between `defaults.pcm.srate`?

I know there's `defaults.pcm.!rate` and `defaults.pcm.rate`, but I couldn't find any information about defaults.pcm.srate

I'm asking because I was given this configuration:

![IMG](https://github.com/user-attachments/assets/84316655-2d44-4f54-a842-86bd60a780e3)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/406
Repository URL: https://github.com/alsa-project/alsa-lib
