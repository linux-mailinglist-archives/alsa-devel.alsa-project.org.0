Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B5262E617
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 21:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C420516E0;
	Thu, 17 Nov 2022 21:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C420516E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668717853;
	bh=vBLUh9Rt95WWUIVpPfT3XFco7yP8WFlR9I1lddkJ95Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p1OXd0tqlJS4yyvscnOsyz3YD4oTL1PaMpclQVgqMzvi4ICcbH+a+LcuA7dXt7wel
	 BsEtLsL83puaLWTwXQmitURkd7vAcOcZIAf5tcz317VnuakIsBo+t9GUVDpT6Y3EjA
	 mfxMEpa4OIe4nWDeuxqwTxtUfMaSoIZ4+s3OPZ/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E5BCF804BD;
	Thu, 17 Nov 2022 21:43:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2650F8025A; Thu, 17 Nov 2022 21:43:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 47703F80087
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 21:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47703F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1668717790637978077-webhooks-bot@alsa-project.org>
References: <1668717790637978077-webhooks-bot@alsa-project.org>
Subject: Revert "ucm2: add profile for the Librem 5"
Message-Id: <20221117204317.D2650F8025A@alsa1.perex.cz>
Date: Thu, 17 Nov 2022 21:43:17 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #243 was opened from craftyguy:

This reverts commit 998849d9510754960d808e20dad4c440adaf87ef.

The oem (Purism) is working on some big improvements to this config, which I knew of when I submitted the patch this reverts, however I didn't realize until now that their changes would break config.

It's probably best to just revert this so it doesn't make it into a release and wait for the oem to submit their improved ucm upstream.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/243
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/243.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
