Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6901115B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A5441744;
	Thu,  2 May 2019 04:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A5441744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556763637;
	bh=W8XTP7E2d2+EoJ7kmvFDhlK4+B9sz2GBgXuPQ5hQ5dw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fTcBRTkt1WNRDCFQmsRmlP8wE82jZeSIcKxhxpOE/ocDKSO96cm7Q0N5Jta2ERWjE
	 eblvPW92BPGMl7wgZB79U11Ev4vPfNhPUqwPO8//PatqcIUysUgVB63bwK17LhhhHl
	 QAxxPc7nS40BpJY0pSz/BsEsXujaFVJ1EBF6cpi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD80CF89729;
	Thu,  2 May 2019 04:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EDE3F896EC; Thu,  2 May 2019 04:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A194BF80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A194BF80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZyOnCzlg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hi5VJQ+Lo4aZnL4bPsz8CJ7C64a60/l+NzHBAYZHxDk=; b=ZyOnCzlgGXRu
 O1yR9cDzUnqTs0maY8Js4ndpN8ytMim1H8P6Ko4u3p764rh0oLC+Z/z9RcdMCABR51C8NH0v5fKCI
 +5MTYKRIq7jl1PjAJU+09p5+5u09vYX3ZGBqQr7LDbjwhVX8dugEFhf3LuzXeBkJ2Nw9W7G6fe7Oe
 qvy/w=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1IS-0005pl-QM; Thu, 02 May 2019 02:18:05 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id E0AC1441D3E; Thu,  2 May 2019 03:18:01 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20190501101332.31190-2-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021801.E0AC1441D3E@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:01 +0100 (BST)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: wm_adsp: Use DSP ops pointers to stop
	watchdog in error handlers" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: wm_adsp: Use DSP ops pointers to stop watchdog in error handlers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 81ed884501a59a49c71cd810578f793f3890c131 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Wed, 1 May 2019 11:13:32 +0100
Subject: [PATCH] ASoC: wm_adsp: Use DSP ops pointers to stop watchdog in error
 handlers

Whilst this isn't strictly necessary as the code is already DSP specific
better to use the pointers to avoid potential issues in the future if
one core ends up having multiple methods of stopping the watchdog.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index a9298bfddd9c..bb10c4aeceb4 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -4285,7 +4285,7 @@ irqreturn_t wm_adsp2_bus_error(struct wm_adsp *dsp)
 
 	if (val & ADSP2_WDT_TIMEOUT_STS_MASK) {
 		adsp_err(dsp, "watchdog timeout error\n");
-		wm_adsp_stop_watchdog(dsp);
+		dsp->ops->stop_watchdog(dsp);
 		wm_adsp_fatal_error(dsp);
 	}
 
@@ -4396,7 +4396,7 @@ irqreturn_t wm_halo_wdt_expire(int irq, void *data)
 	mutex_lock(&dsp->pwr_lock);
 
 	adsp_warn(dsp, "WDT Expiry Fault\n");
-	wm_halo_stop_watchdog(dsp);
+	dsp->ops->stop_watchdog(dsp);
 	wm_adsp_fatal_error(dsp);
 
 	mutex_unlock(&dsp->pwr_lock);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
