Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0DC943FB7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 03:49:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A086E3239;
	Thu,  1 Aug 2024 03:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A086E3239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722476931;
	bh=iEUIGrt7Xyj9U2v20TxB6M4Fg/yP4jxt3ZFAsn0mXpc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=t1YWGjyU8bRhjNt3J0zvDBc3CgyZ5i0qPQ5QuB5riJdp3MOmZepp5WBcVBoXn74lS
	 dDGJVeH+3wtQC4nDlcV6hHlKR/9Jj51qqUpOGJpF6or9tC62eAPx4fp26HHMKeR4fT
	 FiHZojVOQXWRj/R7jUlz4vPUPLrjMzS+N+18Xxsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA22F805AF; Thu,  1 Aug 2024 03:48:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D333DF805B0;
	Thu,  1 Aug 2024 03:48:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA340F8026A; Thu,  1 Aug 2024 03:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2117FF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 03:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2117FF8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1722476891953684330-webhooks-bot@alsa-project.org>
References: <1722476891953684330-webhooks-bot@alsa-project.org>
Subject: gitcompile: restore ACLOCAL_FLAGS ability to use ../alsa-lib/utils/
Message-Id: <20240801014815.BA340F8026A@alsa1.perex.cz>
Date: Thu,  1 Aug 2024 03:48:15 +0200 (CEST)
Message-ID-Hash: YM7XQCTAC7HANJHWBWQMSYUS6M4INLVI
X-Message-ID-Hash: YM7XQCTAC7HANJHWBWQMSYUS6M4INLVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YM7XQCTAC7HANJHWBWQMSYUS6M4INLVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #272 was opened from marc-hb:

Fixes cryptic "error macro 'AM_PATH_ALSA' not found in library configure.ac:22" when attempting a local install as described at https://thesofproject.github.io/latest/getting_started/build-guide/build-from-scratch.html#build-alsa-lib-and-alsa-utils-from-source

Fixes giant commit f9e6010d5ec7 ("topology: plugins - add Intel nhlt encoder plugin") which added a second invocation of `aclocal` in 2021 but forgot the extra `$alsa_m4_flags`.

To avoid duplication, do not fix by adding the missing `$alsa_m4_flags` to the second aclocal invocation. Instead, drop that variable and append `-I ../alsa-lib/utils` directly to $ACLOCAL_FLAGS

Request URL   : https://github.com/alsa-project/alsa-utils/pull/272
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/272.patch
Repository URL: https://github.com/alsa-project/alsa-utils
