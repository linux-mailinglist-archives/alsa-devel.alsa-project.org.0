Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988587DAA3
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Mar 2024 16:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA152365;
	Sat, 16 Mar 2024 16:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA152365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710604630;
	bh=Vpxn+b/ZzuoQucscIQFZHLQyhIZQNfIOfFgnH2VV60E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=A0ykfNAen3fuxmxsIbBVlbsDuTUsaJtrMokYDOtA1y3FDURxrasdmeiXR8gpQOhFa
	 z3hT2Pj5L0/DOm5RFe/Uy2jfhTVsdAEgmWLYnGI+BrXkRH7rdUn4Xt7IFzhipS6sRq
	 8aI3HW8Z/0VqSAoSfZRne6TcmBaUrdWb8+uyze6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4617F805B2; Sat, 16 Mar 2024 16:56:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C851CF804E7;
	Sat, 16 Mar 2024 16:56:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 677E4F8028D; Sat, 16 Mar 2024 16:53:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 50DD1F8014B
	for <alsa-devel@alsa-project.org>; Sat, 16 Mar 2024 16:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50DD1F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710604380511434317-webhooks-bot@alsa-project.org>
References: <1710604380511434317-webhooks-bot@alsa-project.org>
Subject: chore: Use actions/checkout@v4
Message-Id: <20240316155322.677E4F8028D@alsa1.perex.cz>
Date: Sat, 16 Mar 2024 16:53:22 +0100 (CET)
Message-ID-Hash: X4SJUZHCZWCKF72PXFFFP7LKFRK4QD54
X-Message-ID-Hash: X4SJUZHCZWCKF72PXFFFP7LKFRK4QD54
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4SJUZHCZWCKF72PXFFFP7LKFRK4QD54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #259 was opened from Korilakkuma:

Refer to https://github.blog/changelog/2023-09-22-github-actions-transitioning-from-node-16-to-node-20.

> Node.js 16 actions are deprecated. Please update the following actions to use Node.js 20: actions/checkout@v3.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/259
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/259.patch
Repository URL: https://github.com/alsa-project/alsa-utils
