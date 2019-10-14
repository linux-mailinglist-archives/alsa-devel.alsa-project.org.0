Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CCD620B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 14:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DE51673;
	Mon, 14 Oct 2019 14:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DE51673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571054904;
	bh=CyqdUp2nT9VD3SbnXqzQ5uqEHLOZTlL14exoIMDFBTc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aMeLls3GowMeRREL+RDy+6FTrIUsFRNQ0sjc07H7vhmSo5QlveykUgYsmURP4rDA4
	 oB+YUK5kPoEGf/t0bHekTpK0dp+5PBwM4B9PDZ8pMBLmyCv3gLAHNODHjpxbvbcxA0
	 g/OUyLRYdbx0OZgcAEqHNnVXAJ4fME3SW23ahAeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10DC0F805AE;
	Mon, 14 Oct 2019 14:05:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69F7EF804AB; Mon, 14 Oct 2019 14:05:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC392F80322
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 14:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC392F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cRcG44pd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8tmABv8wIynlKBUhA/5/2HttkPuDhFcFbN22gv8mMIc=; b=cRcG44pdaR8M
 WV7+m4n+6aqpDVJdpfiMHZTQrOQLO125Ic/jUgoQPbpSpzQtX1QaE0lsIXpLOMe80afAKcrgtHLH8
 gmC67Sons+EB+ng3gsnl3kmbYNVGVFhSVhNGemZpY0N6TKjzfigqvWiM/ktjMV8XYhaK1/+VLvdDf
 gjsJ8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iJz5t-0007WC-Qi; Mon, 14 Oct 2019 12:04:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4D8CF2742162; Mon, 14 Oct 2019 13:04:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191011164312.7988-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191014120457.4D8CF2742162@ypsilon.sirena.org.uk>
Date: Mon, 14 Oct 2019 13:04:57 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: bdw: fix operator
	precedence warnings" to the asoc tree
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

   ASoC: SOF: Intel: bdw: fix operator precedence warnings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 7ad03a2c848f6fb0a8dea656c9c161929696878e Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 11 Oct 2019 11:43:10 -0500
Subject: [PATCH] ASoC: SOF: Intel: bdw: fix operator precedence warnings

Address cppcheck warnings

sound/soc/sof/intel/bdw.c:265:26: style: Clarify calculation precedence
for '&' and '?'. [clarifyCalculation]
  panic & SHIM_IPCX_BUSY ? "yes" : "no",
                         ^

sound/soc/sof/intel/bdw.c:266:26: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
                         ^

sound/soc/sof/intel/bdw.c:269:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrx & SHIM_IMRX_BUSY ? "yes" : "no",
                        ^

sound/soc/sof/intel/bdw.c:270:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
                        ^

sound/soc/sof/intel/bdw.c:273:27: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  status & SHIM_IPCD_BUSY ? "yes" : "no",
                          ^

sound/soc/sof/intel/bdw.c:274:27: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  status & SHIM_IPCD_DONE ? "yes" : "no", status);
                          ^

sound/soc/sof/intel/bdw.c:277:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrd & SHIM_IMRD_BUSY ? "yes" : "no",
                        ^

sound/soc/sof/intel/bdw.c:278:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
                        ^

Fixes: 3a9e204d4e369 ("ASoC: SOF: Intel: Add context data to any IPC timeout.")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191011164312.7988-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/bdw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index f395d0638876..bf961a8798a7 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -262,20 +262,20 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 	imrd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRD);
 	dev_err(sdev->dev,
 		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
-		panic & SHIM_IPCX_BUSY ? "yes" : "no",
-		panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
+		(panic & SHIM_IPCX_BUSY) ? "yes" : "no",
+		(panic & SHIM_IPCX_DONE) ? "yes" : "no", panic);
 	dev_err(sdev->dev,
 		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
-		imrx & SHIM_IMRX_BUSY ? "yes" : "no",
-		imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
+		(imrx & SHIM_IMRX_BUSY) ? "yes" : "no",
+		(imrx & SHIM_IMRX_DONE) ? "yes" : "no", imrx);
 	dev_err(sdev->dev,
 		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
-		status & SHIM_IPCD_BUSY ? "yes" : "no",
-		status & SHIM_IPCD_DONE ? "yes" : "no", status);
+		(status & SHIM_IPCD_BUSY) ? "yes" : "no",
+		(status & SHIM_IPCD_DONE) ? "yes" : "no", status);
 	dev_err(sdev->dev,
 		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
-		imrd & SHIM_IMRD_BUSY ? "yes" : "no",
-		imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
+		(imrd & SHIM_IMRD_BUSY) ? "yes" : "no",
+		(imrd & SHIM_IMRD_DONE) ? "yes" : "no", imrd);
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
