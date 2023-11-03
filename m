Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE507E0652
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0368AE12;
	Fri,  3 Nov 2023 17:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0368AE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028599;
	bh=kjdDsewq7/Uih5g1eAdb2BVmOlhcgA7XLihAWsdtKOY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gxiOTSS0zN8J1m5HnhitSficBSMCkD/cwyqA9kHc4QT3TAahUyh/16WQn4tzhLvid
	 V5iuDAzI3gSs0P1O1NoZtB+L4svT4eF0mexug3CX8jk258tXvo5me+j/XmYJwPFflS
	 Y+GGxE+PeRKUjS/MOWFyx8bs6w5hAnSFQWFqDbfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FC2DF805E1; Fri,  3 Nov 2023 17:20:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F985F805AC;
	Fri,  3 Nov 2023 17:20:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D777F805AA; Fri,  3 Nov 2023 17:20:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 501DBF8016D
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 17:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 501DBF8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1699028405927824736-webhooks-bot@alsa-project.org>
References: <1699028405927824736-webhooks-bot@alsa-project.org>
Subject: Documentation: Add ucm URL
Message-Id: <20231103162019.0D777F805AA@alsa1.perex.cz>
Date: Fri,  3 Nov 2023 17:20:18 +0100 (CET)
Message-ID-Hash: AML5M4Q4WTVPHRAPOSEP2UXVYPATUNXV
X-Message-ID-Hash: AML5M4Q4WTVPHRAPOSEP2UXVYPATUNXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AML5M4Q4WTVPHRAPOSEP2UXVYPATUNXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #366 was opened from broukema:

This commit adds the main alsa-ucm-conf documentation URL to PinePhone.conf, and clarifies the relevance of the other three URLs.

While in principle it could be argued that anyone editing ucm2 .conf files should RTFM, in practice everybody's busy and will not always find which documentation is the most useful and up-to-date. This commit aims to help people identify where they can expect to find the most useful+up-to-date info so that they can understand the current roles of the various types of sections of the config files, and file bug reports if behaviour of alsa-lib software differs from what's described in the documentation.

This merge request should hopefully be uncontroversial. :)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/366
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/366.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
