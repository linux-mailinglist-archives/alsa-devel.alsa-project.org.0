Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D76740F9C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E337825;
	Wed, 28 Jun 2023 13:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E337825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687950315;
	bh=vT8w1cOsPrUh+tHlBdJCfxGy6366vg5guwVRJazoxEU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FcgUIIr/taHK3g/rPykMxrc0cMnMBcfA2+RM8LawstdIS9c/MUkik12aPYetB5Phu
	 rnXrMdfPJ8lwGmovSHMblHBbHXs/PSBMNA4sDK6vhGgO5fv/EhMgqKgjh43BXDga9z
	 8+YFmQLmZ3CKENivdWFo+AoM7c+AHD23C6Rgjhr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAD3EF80212; Wed, 28 Jun 2023 13:04:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6392BF80212;
	Wed, 28 Jun 2023 13:04:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3698F80246; Wed, 28 Jun 2023 13:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CCCF80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 13:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CCCF80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687950258869607449-webhooks-bot@alsa-project.org>
References: <1687950258869607449-webhooks-bot@alsa-project.org>
Subject: ucm2: USB-Audio: Add support for ALC4080 Gigabyte Z590 AORUS ULTRA
Message-Id: <20230628110420.F3698F80246@alsa1.perex.cz>
Date: Wed, 28 Jun 2023 13:04:20 +0200 (CEST)
Message-ID-Hash: G2AA3SJ3KOA674EEWCORF4HVLSQOGYWQ
X-Message-ID-Hash: G2AA3SJ3KOA674EEWCORF4HVLSQOGYWQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2AA3SJ3KOA674EEWCORF4HVLSQOGYWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #310 was reopened from BearsPunch:

When installed Manjaro I had an issue my audio card was not recognized. USB ID is 0414:a00d and as I see you already have it under if.realtek-alc1220-vb condition, but I have ALC4080. So I manually changed USB-Audio.conf under If.realtek-alc4080 condition from (0414:a0(0e|1[0124])) to (0414:a0(0[de]|1[0124])) and now it works perfectly.

But Ubuntu (maybe from 22.04) doesn't have this issue. Does Canonical update alsa-ucm-conf by themselves without pull request to main branch?

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/310
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/310.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
