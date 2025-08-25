Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE2CB33B5A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Aug 2025 11:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB48601BC;
	Mon, 25 Aug 2025 11:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB48601BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756114983;
	bh=xehP/gpBrPL437K1//bUcRGUZpTV7yfva3B1SIEtmnY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lUhQkbjw9cpkvi2Jk/hTVxeSKIFF2IlcXVMdGmJN5dQMixDvP/Gt2yJW1QBbJ9jG/
	 JrJdFP96tiTAfzE6hpPfyadG0cTzCpWywJkx32/wBuNOerrMkVGufnXpLoARPJHOJ7
	 iod/bAoQs0Q1h+fJJUwkwGiQkPgEN8EnG+dHBKYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16481F805C1; Mon, 25 Aug 2025 11:42:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF0BF805C8;
	Mon, 25 Aug 2025 11:42:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49E45F804B0; Mon, 25 Aug 2025 11:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C0217F800B0
	for <alsa-devel@alsa-project.org>; Mon, 25 Aug 2025 11:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0217F800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185ef935cd764700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/549@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/549@alsa-project.org>
Subject: ucm2: MediaTek: mt8395-evk: Add support for SOF
Date: Mon, 25 Aug 2025 11:41:59 +0200 (CEST)
Message-ID-Hash: KHPPD4VJIKLS77SQ3UT37LFMKUG6JCMW
X-Message-ID-Hash: KHPPD4VJIKLS77SQ3UT37LFMKUG6JCMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHPPD4VJIKLS77SQ3UT37LFMKUG6JCMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #549 was edited from julien-massot:

Add support for sof-mt8395-evk. Currently, enable only the minimum: earphone output and HDMI output.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/549
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/549.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
