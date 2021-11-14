Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9149E44F9FF
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Nov 2021 19:54:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BB41671;
	Sun, 14 Nov 2021 19:53:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BB41671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636916069;
	bh=XT2E9oh2RfpW25nKOx9Xb0vmNkEU2ClC5GZpzhSDwX8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EUABtgT2Bivag45gMgS9KGpf4C/Iuvj2jDPj2T+SpCg5jwYswL5/ITwvf4TaVbIhj
	 8SLOccGk9Rw6M7csBYVlCImU/SDmzlP6o/oBrQrUIeghPnwORbpFdoJuZY7pQJYMrY
	 H+RGbK0ugSsD+TD8Zka5KC8n1pll3p84SAsJyQgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E6B3F8026D;
	Sun, 14 Nov 2021 19:53:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 876BFF80272; Sun, 14 Nov 2021 19:53:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1C0DCF80134
 for <alsa-devel@alsa-project.org>; Sun, 14 Nov 2021 19:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C0DCF80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636915981275537014-webhooks-bot@alsa-project.org>
References: <1636915981275537014-webhooks-bot@alsa-project.org>
Subject: HP Probook Mute volume + mic LED indicators not working (Audio codec =
 ALC236)
Message-Id: <20211114185310.876BFF80272@alsa1.perex.cz>
Date: Sun, 14 Nov 2021 19:53:10 +0100 (CET)
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

alsa-project/alsa-lib issue #190 was opened from antintin0:

Tested on kernel 5.13 and 5.15.2
Not sure if this is the right place to ask, but no one else seems to be able to help.
I have an HP Probook x360 435 g7 with the Realtek ALC236 codec and my mute volume + mute mic LED indicators aren't working (they do on windows). I found there were some patches mentioning mute LEDs on ALC236 on the below links:
https://patchwork.kernel.org/project/alsa-devel/patch/20210701091417.9696-1-andy.chi@canonical.com/
https://mailman.alsa-project.org/pipermail/alsa-devel/2021-November/192225.html

But obviously they're not working for me, so I tried following this: https://wiki.archlinux.org/title/Laptop#Audio_mute_LED
Theres nothing specific for ALC236 but I tried pretty much all the relevant parameters for the snd-hda-intel module option "model" under "ALC22x/23x/25x/269/27x/28x/29x (and vendor-specific ALC3xxx models)" and none worked.

Any help would be appreciated

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/190
Repository URL: https://github.com/alsa-project/alsa-lib
