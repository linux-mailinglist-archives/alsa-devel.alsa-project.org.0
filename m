Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C558070AD14
	for <lists+alsa-devel@lfdr.de>; Sun, 21 May 2023 11:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1CBE827;
	Sun, 21 May 2023 11:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1CBE827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684659978;
	bh=7PVs/ap5yk40NFLi5wZrLigSpQHsGNSWazIrT8z2sfQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tYSLimeb5dA2rzKugvQQGv/ZLppw4RW3+3RrV/6lgTUodeM7rLv0f/0Odv3Fg0n4c
	 RnDdECjRmmOciVGUJinS9M4ZTSy4Vu6Md2WgkEjTfFbzNIboDRoXrKXmSVQ9WgX9RO
	 dYPL1n6z9eihsZcrJuWB8aArcYZFysFUKBwbrT1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33E0FF80425; Sun, 21 May 2023 11:05:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB680F80249;
	Sun, 21 May 2023 11:05:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B275AF8024E; Sun, 21 May 2023 11:05:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C6728F800DF
	for <alsa-devel@alsa-project.org>; Sun, 21 May 2023 11:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6728F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684659915435691595-webhooks-bot@alsa-project.org>
References: <1684659915435691595-webhooks-bot@alsa-project.org>
Subject: Add Korean translations
Message-Id: <20230521090522.B275AF8024E@alsa1.perex.cz>
Date: Sun, 21 May 2023 11:05:22 +0200 (CEST)
Message-ID-Hash: EQGIJOMO5RQLNXU2ZOU5CDGSFTZGDUM2
X-Message-ID-Hash: EQGIJOMO5RQLNXU2ZOU5CDGSFTZGDUM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQGIJOMO5RQLNXU2ZOU5CDGSFTZGDUM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #214 was opened from yi-yunseok:

As a sub.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/214
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/214.patch
Repository URL: https://github.com/alsa-project/alsa-utils
