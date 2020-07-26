Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6BF22E347
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 01:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66484168F;
	Mon, 27 Jul 2020 01:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66484168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595805965;
	bh=xumGc9UVjWQ+vwstvPoxDTXazqyrweQEGNA2FI/JMAw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z2+5Cd79EOsMR4AzUmr99Fpu/dp5YeVqF0ajOzpdze+ZkwosFr2ThyfNjnAOjVYwS
	 CA/mHavWsWkcHxJUEJpz5FGBwuW3+udVTkm6pX/iizYDlx0dkhJF7+1+0SK4EoK8b8
	 Obml2aZmbBrg6Mx2TJbhBkfMKsjEx4trA2PLeC9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB15F801F7;
	Mon, 27 Jul 2020 01:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83600F8020B; Mon, 27 Jul 2020 01:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 60A22F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 01:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60A22F800DE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595805854090662956-webhooks-bot@alsa-project.org>
References: <1595805854090662956-webhooks-bot@alsa-project.org>
Subject: headphones detected but don't show up in alsa mixer,
 no audio on ubuntu 18.04 with gigabyte z370 gaming wifi motherboard
Message-Id: <20200726232421.83600F8020B@alsa1.perex.cz>
Date: Mon, 27 Jul 2020 01:24:21 +0200 (CEST)
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

alsa-project/alsa-lib issue #75 was opened from rbavery:

Here is my ALSA info: http://alsa-project.org/db/?f=dd3d1d8a9fa0020900a0adc03bc6adfaf1f77ee5

I tried following these remedies (including reinstalling alsa, reloading, restarting computer) but nothing has panned out: https://support.system76.com/articles/audio/

Any help or suggestions are appreciated

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/75
Repository URL: https://github.com/alsa-project/alsa-lib
