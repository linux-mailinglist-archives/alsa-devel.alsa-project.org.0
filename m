Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1AE87D473
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 20:25:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2B42358;
	Fri, 15 Mar 2024 20:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2B42358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710530714;
	bh=XFMF6mIzqhFA3vzLIcaFWOoczZA6Gtz0WVl3Dqt7hZ4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hSx1LOcPZvJBHx9y8tUK48tnnTOYDSMGStSS6E6m4O8gVEcNRnZ6go+Ld8uy+swAG
	 jOZysnUEOdPNPg9EOHB8l1JYxfkA3nqoYaBkPotv8xONhIVa7T9y3mSVPcY/lIowkb
	 +9Mz8/TCxQWeAWK9gXeWGEAfdpMHpqFmpjFL/bzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39821F805A1; Fri, 15 Mar 2024 20:24:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE77BF80578;
	Fri, 15 Mar 2024 20:24:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2887F8028D; Fri, 15 Mar 2024 20:24:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B9ECF8014B
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 20:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B9ECF8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710530673444325447-webhooks-bot@alsa-project.org>
References: <1710530673444325447-webhooks-bot@alsa-project.org>
Subject: Linux 6.9 pre-rc1 might have broken UCM matching
Message-Id: <20240315192436.F2887F8028D@alsa1.perex.cz>
Date: Fri, 15 Mar 2024 20:24:36 +0100 (CET)
Message-ID-Hash: XQRSLIATPZU5ORDM2BTOTOSSXOS63B2D
X-Message-ID-Hash: XQRSLIATPZU5ORDM2BTOTOSSXOS63B2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQRSLIATPZU5ORDM2BTOTOSSXOS63B2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #404 was opened from pinkflames:

While testing Torvalds' master branch of Linux which will become 6.9-rc1 eventually, I have stumbled upon PipeWire/WirePlumber apparently no longer applying the UCM profile for my USB connected on-board audio controller. Git bisection leads to the following commit: torvalds/linux@1601cd53c7e3197181277326dbfc131d20a74e46 . It's possible that I'm wrong in concluding that the issue is UCM no longer applying/matching but that's my best guess looking at seemingly ACP named devices and the lack of any `ucm` strings in the output of pw-dump, when the regression is present.

Since this is likely a kernel regression, I'll be reporting that to the kernel bugzilla, too, but I thought alsa-ucm-conf might be interested in this change as well.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/404
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
