Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C6B87C6B0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 01:12:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 560B61931;
	Fri, 15 Mar 2024 01:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 560B61931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710461519;
	bh=c+Ki/YMUitm5qzFDXJqdt5MSj6JOqC3vJRIsYQvDAM0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Vo1jkV/tDu4VMmV1spghlb9NLs7zTTmeY8UsuxVIawlrh8uHeEmV2sJXcxR1kbb5f
	 Nxa6iSrTcqC49ud30LvfDHIv0VxDJwTraOBUtMTDUrn0dqsZ7/qM1qsyDqmR8YqIP9
	 fl2lzl3BpaVJM28lZ/o05pZA/FtlE7UcebKagWQ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2AEBF804B0; Fri, 15 Mar 2024 01:11:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25223F805A0;
	Fri, 15 Mar 2024 01:11:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51545F8025F; Fri, 15 Mar 2024 01:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 273A3F80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 01:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 273A3F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710461476578677654-webhooks-bot@alsa-project.org>
References: <1710461476578677654-webhooks-bot@alsa-project.org>
Subject: Update CI to actions/checkout@v4
Message-Id: <20240315001121.51545F8025F@alsa1.perex.cz>
Date: Fri, 15 Mar 2024 01:11:21 +0100 (CET)
Message-ID-Hash: YXMVSB4A6NW6JKJPWDEMN4NWJI3T52CG
X-Message-ID-Hash: YXMVSB4A6NW6JKJPWDEMN4NWJI3T52CG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXMVSB4A6NW6JKJPWDEMN4NWJI3T52CG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #389 was opened from ryandesign:

As it says in the annotations of recent CI builds:

> Node.js 16 actions are deprecated. Please update the following actions to use Node.js 20: actions/checkout@v3. For more information see: https://github.blog/changelog/2023-09-22-github-actions-transitioning-from-node-16-to-node-20/.

In other words, switch to actions/checkout@v4.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/389
Repository URL: https://github.com/alsa-project/alsa-lib
